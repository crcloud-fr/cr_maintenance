---
--- @Author CriticalR, crcloud-fr
--- @Copyright (c) CriticalR & crcloud-fr - All Rights Reserved
--- @DateTime: 03/10/2023 19:18:13
---

Maintenance = {}

Maintenance.Enable = true
Maintenance.Listening = 'JSON' -- JSON or nil
Maintenance.DropMessage = Strings.drop_message
Maintenance.Discord = {
    url = "https://discord.gg/kcgKxtHgCf",
}

Maintenance.Whitelisted = {}
Maintenance.Allowed = {
    'license:'
}