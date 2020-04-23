function AutoRepair()
    local orangeColor ="|c00FF4D00"
    local greenColor = "|c0000FF00"
    local redColor   = "|c00FF0000"

    local cost = GetRepairAllCost()
    local accountBalance = GetMoney()
    local text = nil
    
    if cost > 0 then
        if cost > accountBalance then
            text = redColor .. "Cannot AutoRepair because you have not sufficient fund. You need at least " .. GetCoinTextureString(cost) .. ".|r"
        else
            RepairAllItems()
            text = greenColor .. "AutoRepair bill " .. GetCoinTextureString(cost) .. ".|r"
        end
    else
        text = "Equipment is already repaired."
    end

    DEFAULT_CHAT_FRAME:AddMessage(orangeColor .. "ClassicAutoRepair:|r " .. text)
end

local f = CreateFrame("FRAME")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function(self,event, ...)
    if event == "MERCHANT_SHOW" then
        if CanMerchantRepair() then
            AutoRepair()
        end
    end
end)

