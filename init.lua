sysInfo = {}

function sysInfo.plat()
  directory_separator = package.config:sub(1,1)
  if directory_separator == "/" then
    platform = "unix"
  end
  if directory_separator == "\\" then
    platform = "windows"
  end
  return platform
end

function sysInfo.os()
  sysInfo.plat()
  if platform == "unix" then
    os_name = io.popen('uname -s','r'):read('*l')
  end
  if platform == "windows" then
    os_name = os.getenv('OS')
  end
  return os_name
end

function sysInfo.arch()
  sysInfo.plat()
  if platform == "unix" then
    arch_name = io.popen('uname -m','r'):read('*l')
  end
  if platform == "windows" then
    arch_name = os.getenv('PROCESSOR_ARCHITECTURE')
  end
  return arch_name
end

function sysInfo.kernel()
  sysInfo.plat()
  if platform == "unix" then
    kern_ver = io.popen('uname -r','r'):read('*l')
  end
  if platform == "windows" then
    ver = io.popen('ver','r'):read('*a')
    kern_ver = string.match(ver, "%d+[.]%d+[.]%d+")
  end
  return kern_ver
end

return sysInfo
