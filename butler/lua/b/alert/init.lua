local module = {}

function module.show(str)
	import('butler', 'butler.API')
	nativeAlert = Alert()
	nativeAlert:show(str)
end

return module
