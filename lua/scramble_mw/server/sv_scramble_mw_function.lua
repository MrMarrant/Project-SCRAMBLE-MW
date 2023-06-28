if CLIENT then return end

function scramble_mw.UpdateConvarClientSide(value)
    net.Start(SCRAMBLE_MW_CONFIG.UpdateConvarToClient)
        net.WriteBool(value)
    net.Broadcast()
end