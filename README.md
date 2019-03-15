# p4lua

Lua 5.X Platform detection.

Supports MacOS, Linux and Windows

Will return os name, cpu archiature, and kernel version using native tools.

uname and ver.exe 

Sample:

  sysinfo = require("sysinfo")

  print(sysinfo.os())

  print(sysinfo.arch())
  
  print(sysinfo.kernel())

Darwin

x86_64

17.7.0
