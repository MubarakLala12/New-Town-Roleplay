if GetCurrentResourceName() == 'ctrpfw' then 
    function GetSharedObject()
        return CTRPFW
    end

    exports('GetSharedObject', GetSharedObject)
end

CTRPFW = exports['ctrpfw']:GetSharedObject()