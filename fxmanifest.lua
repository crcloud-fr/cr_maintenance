---
--- @Author CriticalR, crcloud-fr
--- @Copyright (c) CriticalR & crcloud-fr - All Rights Reserved
--- @DateTime: 03/10/2023 19:17:41
---

fx_version("cerulean")
games { "rdr3", "gta5" }
lua54("yes")

shared_scripts {
	'shared/language.lua',
    'shared/config.lua',
}

server_scripts {
    "server/sv_maintenance.lua"
}