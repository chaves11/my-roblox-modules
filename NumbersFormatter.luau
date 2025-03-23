local NumbersFormatter = {}

--Abreviador de numeros grandes como 1500 = 1.50K ou 20000 = 20K
function NumbersFormatter.FormatWithSuffix(number: number)
	if number < 1e3 then
		return tostring(math.floor(number)) 
	end
	
	local PossibleSuffix = {
		{1e33, "Dec"}, 
		{1e30, "Non"},  
		{1e27, "Oct"}, 
		{1e24, "Sep"},   
		{1e21, "Sex"},  
		{1e18, "Qui"}, 
		{1e15, "Qua"},  
		{1e12, "Tri"},  
		{1e9 , "Bi" },   
		{1e6 , "Mi" },   
		{1e3 , "K"  },   
	}

	for _, Suffix in ipairs(PossibleSuffix) do
		local Value, DecimalValue = Suffix[1], Suffix[2]
		
		if number >= Value then
			if number % Value == 0 then
				return string.format("%d%s", number/Value, DecimalValue) 
			end
			
			return string.format("%.2f%s", number / Value, DecimalValue)
		end
	end
end

--Transforma numeros em horas como 3725 = 01:02:05 
function NumbersFormatter.FormatTime(totalSeconds: number)
	local hours   = math.floor( totalSeconds / 3600)
	local minutes = math.floor((totalSeconds % 3600) / 60)
	local seconds = math.floor( totalSeconds % 60)

	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

return NumbersFormatter