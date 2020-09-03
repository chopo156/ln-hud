# ln-hud
Hi everyone i will show this hud:

To make it work rewrite:
esx_status/client/main.lua/ 71line this:
TriggerEvent(‘esx_status:onTick’, GetStatusData(true)) to this
TriggerEvent(‘ln-hud:updateStatus’, GetStatusData(true))
