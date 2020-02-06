print("Hello, world")

import config as vconfig

cache1 = vconfig.LibvirtConfigGuestCPUTuneCacheTuneCache()
cache2 = vconfig.LibvirtConfigGuestCPUTuneCacheTuneCache()
cache2.size = 9216

cachetune1 = vconfig.LibvirtConfigGuestCPUTuneCacheTune()
cachetune1.vcpus = "0-3"
cachetune1.cache = cache1
# print(cachetune1.to_xml())

cachetune2 = vconfig.LibvirtConfigGuestCPUTuneCacheTune()
cachetune2.vcpus = "4-9"
cachetune2.cache = cache2
# print(cachetune2.to_xml())

# cachetune = (cachetune1, cachetune2)
# for ct in cachetune:
#     print(ct.to_xml())

cputune = vconfig.LibvirtConfigGuestCPUTune()
cputune.cachetune = [cachetune1, cachetune2]
print(cputune.to_xml())
