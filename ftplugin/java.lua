if not pcall(require, 'jdtls') then
    return
end

local home_dir = os.getenv 'HOME'
local sdkman_dir = os.getenv 'SDKMAN_DIR'

local root_dir = require('jdtls.setup').find_root {
    'gradlew',
    'mvnw',
    'build.xml',
    '.git',
}

local jdtls_dir = home_dir .. '/.local/share/eclipse/jdtls'

local workspace_folder = home_dir
    .. '/.local/share/eclipse/workspaces/'
    .. vim.fn.fnamemodify(root_dir, ':p:h:t')

-- Configurations found here: https://marketplace.visualstudio.com/items?itemName=redhat.java

local config = {}

config.cmd = { jdtls_dir .. '/bin/jdtls', '-data', workspace_folder }
config.root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' }
config.on_attach = require('lsp').on_attach

config.settings = {
    java = {
        format = {
            settings = {
                -- url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            },
        },
        autobuild = { enabled = false },
        signatureHelp = {
            enabled = true,
            description = {
                enabled = true,
            },
        },
        contentProvider = { preferred = 'fernflower' },
        saveActions = { organizeImports = false },
        completion = {
            favoriteStaticMembers = {
                'io.crate.testing.Asserts.assertThat',
                'org.assertj.core.api.Assertions.assertThat',
                'org.assertj.core.api.Assertions.assertThatThrownBy',
                'org.assertj.core.api.Assertions.assertThatExceptionOfType',
                'org.assertj.core.api.Assertions.catchThrowable',
                'org.hamcrest.MatcherAssert.assertThat',
                'org.hamcrest.Matchers.*',
                'org.hamcrest.CoreMatchers.*',
                'org.junit.jupiter.api.Assertions.*',
                'java.util.Objects.requireNonNull',
                'java.util.Objects.requireNonNullElse',
                'org.mockito.Mockito.*',
            },
            filteredTypes = {
                'com.sun.*',
                'io.micrometer.shaded.*',
                'java.awt.*',
                'jdk.*',
                'sun.*',
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
            hashCodeEquals = {
                useJava7Objects = true,
            },
            useBlocks = true,
            insertionLocation = 'afterCursor',
        },
        project = {
            resourceFilters = {
                'node_modules',
                '.git',
            },
        },
        configuration = {
            runtimes = {
                {
                    name = 'JavaSE-17',
                    path = sdkman_dir .. '/candidates/java/17.0.8-amzn',
                },
                {
                    name = 'JavaSE-11',
                    path = sdkman_dir .. '/candidates/java/11.0.20-amzn',
                },
                {
                    name = 'JavaSE-1.8',
                    path = sdkman_dir .. '/candidates/java/8.0.382-amzn',
                },
            },
        },
    },
}

--
-- Extensions
--

local bundles = vim.list_extend(
    {},
    vim.split(vim.fn.glob(jdtls_dir .. '/extensions/*.jar', 1), '\n')
)

config.init_options = {
    bundles = bundles,
}

require('jdtls').start_or_attach(config)
