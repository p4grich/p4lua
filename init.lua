--
-- User: p4grich
-- Date: 2019-03-13
-- Time: 16:50
--
local sysinfo = {}
local platform = " "
local os_name = " "
local arch_name = " "
local kern_ver = " "


function sysinfo.plat()
  local directory_separator = package.config:sub(1,1)
  if directory_separator == "/" then
    platform = "unix"
  end
  if directory_separator == "\\" then
    platform = "windows"
  end
  return platform
end

function sysinfo.os()
  sysinfo.plat()
  if platform == "unix" then
    os_name = io.popen('uname -s','r'):read('*l')
  end
  if platform == "windows" then
    os_name = os.getenv('OS')
  end
  return os_name
end

function sysinfo.arch()
  sysinfo.plat()
  if platform == "unix" then
    arch_name = io.popen('uname -m','r'):read('*l')
  end
  if platform == "windows" then
    arch_name = os.getenv('PROCESSOR_ARCHITECTURE')
  end
  return arch_name
end

function sysinfo.kernel()
  sysinfo.plat()
  if platform == "unix" then
    kern_ver = io.popen('uname -r','r'):read('*l')
  end
  if platform == "windows" then
    local ver = io.popen('ver','r'):read('*a')
    kern_ver = string.match(ver, "%d+[.]%d+[.]%d+")
  end
    return kern_ver
end

return sysinfo
