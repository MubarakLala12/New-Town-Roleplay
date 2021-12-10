seqsSwitch = nil
seqsRemaingingTime = 0

AddEventHandler('mhackings:seqsstart', function(solutionlength, duration, callback)
	if type(solutionlength) ~= 'table' and type(duration) ~= 'table' then
		TriggerEvent('mhackings:show')
		TriggerEvent('mhackings:start', solutionlength, duration, mhackingsseqsCallback)
		while seqsSwitch == nil do
			Citizen.Wait(5)
		end
		TriggerEvent('mhackings:hide')
		callback(seqsSwitch, seqsRemaingingTime, true)
		seqsRemaingingTime = 0
		seqsSwitch = nil
		
	elseif type(solutionlength) == 'table' and type(duration) ~= 'table' then
		TriggerEvent('mhackings:show')
		seqsRemaingingTime = duration
		for _, sollen in pairs(solutionlength) do
			TriggerEvent('mhackings:start', sollen, seqsRemaingingTime, mhackingsseqsCallback)	
			while seqsSwitch == nil do
				Citizen.Wait(5)
			end
			
			if next(solutionlength,_) == nil or seqsRemaingingTime == 0 then
				callback(seqsSwitch, seqsRemaingingTime, true)
			else
				callback(seqsSwitch, seqsRemaingingTime, false)
			end
			seqsSwitch = nil
		end
		seqsRemaingingTime = 0
		TriggerEvent('mhackings:hide')
		
	elseif type(solutionlength) ~= 'table' and type(duration) == 'table' then
		TriggerEvent('mhackings:show')
		for _, dur in pairs(duration) do
			TriggerEvent('mhackings:start', solutionlength, dur, mhackingsseqsCallback)	
			while seqsSwitch == nil do
				Citizen.Wait(5)
			end
			if next(duration,_) == nil then
				callback(seqsSwitch, seqsRemaingingTime, true)
			else
				callback(seqsSwitch, seqsRemaingingTime, false)
			end
			seqsSwitch = nil
		end
		seqsRemaingingTime = 0
		TriggerEvent('mhackings:hide')
	
	elseif type(solutionlength) == 'table' and type(duration) == 'table' then
		local itrTbl = {}
		local solTblLen = 0
		local durTblLen = 0
		for _ in ipairs(solutionlength) do solTblLen = solTblLen + 1 end
		for _ in ipairs(duration) do durTblLen = durTblLen + 1 end
		itrTbl = duration
		if solTblLen > durTblLen then itrTbl = solutionlength end	
		TriggerEvent('mhackings:show')
		for idx in ipairs(itrTbl) do
			TriggerEvent('mhackings:start', solutionlength[idx], duration[idx], mhackingsseqsCallback)	
			while seqsSwitch == nil do
				Citizen.Wait(5)
			end
			if next(itrTbl,idx) == nil then
				callback(seqsSwitch, seqsRemaingingTime, true)
			else
				callback(seqsSwitch, seqsRemaingingTime, false)
			end
			seqsSwitch = nil
		end
		seqsRemaingingTime = 0
		TriggerEvent('mhackings:hide')
		
	end
end)

function mhackingsseqsCallback(success, remainingtime)
	seqsSwitch = success
	seqsRemaingingTime = math.floor(remainingtime/1000.0 + 0.5)
end