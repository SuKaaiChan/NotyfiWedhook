local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local PlayerCount = #Players:GetPlayers()

local FullMoonWebhookUrl = "https://discord.com/api/webhooks/1309464336825323541/1buVoCJ_5xeTil_XVA5vQliq_-cLTbH_KjSkG-MvBV7u4tmkbZSenijcTo4-LLjnP-Ud"
local function sendWebhook(webhookUrl, data)
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }
    local request = http_request or request or syn.request or fluxus.request or Krnl.request or delta.request
    local final = { Url = webhookUrl, Body = jsonData, Method = "POST", Headers = headers }
    local success, response = pcall(function() return request(final) end)

    if not success then
        warn("Webhook failed:", response)
    end
end
local location
if game.PlaceId == 2753915549 then
    location = "Sea 1"
elseif game.PlaceId == 4442272183 then
    location = "Sea 2"
elseif game.PlaceId == 7449423635 then
    location = "Sea 3"
else
    location = "Unknown Location"
end

local function SendFullMoonWebhook(location, playerCount)
    local data = {
        embeds = {
            {
                title = "discord:",
                color = tonumber(0xffa500),
                footer = {
                    text = "Created by Light Reall",
                    icon_url = ":)"
                },
                timestamp = DateTime.now():ToIsoDate(),
                fields = {
                    {
                        name = "⭐️ Overview",
                        value = "```Note: If No Message, it got blocked by Discord (wait 1-2 hours and it will self-fix) - Prime Andy```",
                        inline = false
                    },
                    {
                        name = "🧸 Status",
                        value = "```Full Moon Test```",
                        inline = true
                    },
                    {
                        name = "🗺️ Location",
                        value = "```" .. location .. "```",
                        inline = true
                    },
                    {
                        name = "🍪 Player Count",
                        value = "```" .. PlayerCount .. "/12```",
                        inline = true
                    },
                    {
                        name = "📄 Job ID",
                        value = lostring(game.JobId),
                        inline = true
                    },
                    {
                        name = "📝 Join Script",
                        value = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "', game:GetService('Players').LocalPlayer)",
                        inline = true
                    }
                }
            }
        }
    }
    sendWebhook(FullMoonWebhookUrl, data)
end

if Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
    SendFullMoonWebhook(location, PlayerCount)
end