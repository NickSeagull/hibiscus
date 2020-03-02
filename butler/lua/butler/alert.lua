local module = {}

function module.show(str)
	import("System.Windows.Forms")
	MessageBox.Show(str)
end

return module
