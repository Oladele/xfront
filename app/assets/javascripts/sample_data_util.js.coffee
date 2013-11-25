window.sample_data_util =
	randGen: (arrLength, min, max) ->
		arr = []
		for x in [1..arrLength]
			random_float = Math.random()
			range = max - min + 1
			offset = min
			random_float_in_range = random_float*range+offset
			random_integer_in_range = Math.floor(random_float_in_range)

			arr.push(random_integer_in_range)
		return arr

	daysArray: (days, interval,format) ->
		arr = []
		today = moment(7, "HH")
		for x in [0..(days-1)]
			day = moment(today.add('days', 1*interval))
			switch format
				when "unix" then arr.push(day.unix())
				when "jsEpoch" then arr.push(day.valueOf())
				when "jsDate" then arr.push(day.toDate())
				when "moment" then arr.push(day)
				else arr.push(day.toDate())
		return arr

	workoutDays: (days, interval, format, randMin, randMax) ->
		arrIntensity = @randGen(days,randMin,randMax)
		arrDays = @daysArray(days, interval, format)
		workouts = {}
		for i in [0..(arrDays.length-1)]
			workouts[arrDays[i]] = arrIntensity[i]
		workouts