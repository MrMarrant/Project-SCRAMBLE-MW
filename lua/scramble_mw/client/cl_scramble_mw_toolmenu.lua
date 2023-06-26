if SERVER then return end

hook.Add("PopulateToolMenu", "vrnvgtoolmenu_ScrambleMW", function()
	local ply = LocalPlayer()
	
	spawnmenu.AddToolMenuOption("Options", "COD: NVGs", "ventnvgscramble", "Scramble Config", "", "", function(panel)
		panel:ClearControls()
		panel:AddControl("Checkbox", {Label = "Enabled Scramble effect.", Command = "vrnvg_scramble"})
	end)
end)
