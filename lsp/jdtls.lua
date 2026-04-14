local function get_jdtls_config_path(path_to_jdtls)
    local os_name = vim.uv.os_uname().sysname
    local config_path

    if os_name == 'Linux' then
        config_path = path_to_jdtls .. '/config_linux'
    elseif os_name == 'Darwin' then
        config_path = path_to_jdtls .. '/config_mac_arm'
    else
        error("JDTLS ERROR: OS '' .. os_name .. '' config not supported.")
    end
    return config_path
end

local home = os.getenv('HOME')
local path_to_jdtls = home .. '/.local/share/nvim/mason/packages/jdtls'
local path_to_jar = path_to_jdtls .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar'

local path_to_config = get_jdtls_config_path(path_to_jdtls)

local function find_root()
	local root_markers = { 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', '.git' }
	local path = vim.fn.getcwd()
	while path ~= '/' do
		for _, marker in ipairs(root_markers) do
			if vim.fn.glob(path .. '/' .. marker) ~= '' then
				return path
			end
		end
		path = vim.fn.fnamemodify(path, ':h')
	end
	return vim.fn.getcwd()
end

local root_dir = find_root()
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

return {
  root_markers = {
    'build.xml',
    'pom.xml',
    'settings.gradle',
    'settings.gradle.kts',
    'mvnw',
    'gradlew',
    'build.gradle',
    'build.gradle.kts',
    '.git',
  },
  cmd = {
    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
    -- '/opt/homebrew/Cellar/openjdk/25/libexec/openjdk.jdk/Contents/Home/bin/java',
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    -- 💀
    '-jar',
    path_to_jar,
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version
    -- 💀
    '-configuration',
    path_to_config,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.
    -- 💀
    -- See `data directory configuration` section in the README
    '-data',
    workspace_dir,
  },
  settings = {},
}
