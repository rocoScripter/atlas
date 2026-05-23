local httpService = cloneref(game:GetService('HttpService'))

local ThemeManager = {} do
	ThemeManager.Folder = 'LinoriaLibSettings'
	ThemeManager.Library = nil
	ThemeManager.BuiltInThemes = {
		['Default'] 		= { 1, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"6759b3","BackgroundColor":"141414","OutlineColor":"323232"}') },
		['Venom'] 		= { 2, httpService:JSONDecode('{"FontColor":"BFBFBF","MainColor":"0E0E0E","AccentColor":"ff0000","BackgroundColor":"0E0E0E","OutlineColor":"0B0B0B"}') },
		['Cyan'] 		= { 1, httpService:JSONDecode('{"FontColor":"BFBFBF","MainColor":"0F0F0F","AccentColor":"00ffef","BackgroundColor":"101010","OutlineColor":"0B0B0B"}') },
		['Burn'] 		= { 4, httpService:JSONDecode('{"FontColor":"FF8200","MainColor":"0C0C0C","AccentColor":"FF8200","BackgroundColor":"0C0C0C","OutlineColor":"0C0C0C"}') },
		['Fatality'] 		= { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"28204F"}') },
		['GameSense'] 		= { 6, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"171717","AccentColor":"98E22E","BackgroundColor":"171717","OutlineColor":"31371C"}') },
		['Comet.pub'] 		= { 7, httpService:JSONDecode('{"FontColor":"5E5E5E","MainColor":"0F0F0F","AccentColor":"5D589D","BackgroundColor":"0F0F0F","OutlineColor":"191919"}') },
		['Ruby'] 		= { 8, httpService:JSONDecode('{"FontColor":"ffc8c8","MainColor":"280a0a","AccentColor":"dc3232","BackgroundColor":"0f0505","OutlineColor":"3c0f0f"}') },
		['Sapphire'] 		= { 9, httpService:JSONDecode('{"FontColor":"c8dcff","MainColor":"0f1932","AccentColor":"64b4ff","BackgroundColor":"050a14","OutlineColor":"192850"}') },
		['Amethyst'] 		= { 10, httpService:JSONDecode('{"FontColor":"e6c8ff","MainColor":"231037","AccentColor":"b464ff","BackgroundColor":"0f051f","OutlineColor":"371555"}') },
		['Bloodline'] 		= { 11, httpService:JSONDecode('{"FontColor":"c86478","MainColor":"19080c","AccentColor":"961e32","BackgroundColor":"0a0305","OutlineColor":"2d0f19"}') },
		['Stealth'] 		= { 12, httpService:JSONDecode('{"FontColor":"808080","MainColor":"0d0d0d","AccentColor":"404040","BackgroundColor":"080808","OutlineColor":"1a1a1a"}') },
		['Ghost'] 		= { 13, httpService:JSONDecode('{"FontColor":"28283c","MainColor":"dcdce6","AccentColor":"9696b4","BackgroundColor":"f5f5fa","OutlineColor":"b4b4c8"}') },
		['Razor'] 		= { 14, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0a0f15","AccentColor":"00ffff","BackgroundColor":"050810","OutlineColor":"0f1820"}') },
		['Gold'] 		= { 15, httpService:JSONDecode('{"FontColor":"E6C200","MainColor":"0F0D02","AccentColor":"FFD700","BackgroundColor":"0A0800","OutlineColor":"2A2400"}') },
		['Mint'] 		= { 16, httpService:JSONDecode('{"FontColor":"A8FFD4","MainColor":"0A1F14","AccentColor":"3DFFA8","BackgroundColor":"051208","OutlineColor":"1A3D28"}') },
		['Rose'] 		= { 17, httpService:JSONDecode('{"FontColor":"FFC2D4","MainColor":"1F0A14","AccentColor":"FF6B9D","BackgroundColor":"140510","OutlineColor":"3D1A2E"}') },
		['Synthwave'] 		= { 18, httpService:JSONDecode('{"FontColor":"FFB3D9","MainColor":"1A0A2E","AccentColor":"FF2975","BackgroundColor":"0F0520","OutlineColor":"2E144A"}') },
		['Ocean'] 		= { 19, httpService:JSONDecode('{"FontColor":"B3D9FF","MainColor":"0A1628","AccentColor":"0077B6","BackgroundColor":"050D18","OutlineColor":"142850"}') },
		['Cherry'] 		= { 20, httpService:JSONDecode('{"FontColor":"FFB3C1","MainColor":"1F0A10","AccentColor":"DE3163","BackgroundColor":"140510","OutlineColor":"3D1428"}') },
		['Matrix'] 		= { 21, httpService:JSONDecode('{"FontColor":"00CC33","MainColor":"050F05","AccentColor":"00FF41","BackgroundColor":"020A02","OutlineColor":"0F280F"}') },
		['Frost'] 		= { 22, httpService:JSONDecode('{"FontColor":"1A3A4A","MainColor":"E8F4F8","AccentColor":"4FC3F7","BackgroundColor":"F0F8FF","OutlineColor":"B0D4E8"}') },
		['Sunset'] 		= { 23, httpService:JSONDecode('{"FontColor":"FFD4C8","MainColor":"1F100A","AccentColor":"FF6F61","BackgroundColor":"140A05","OutlineColor":"3D1F14"}') },
		['Violet Storm'] 	= { 24, httpService:JSONDecode('{"FontColor":"D4B3FF","MainColor":"140A28","AccentColor":"7B2FBE","BackgroundColor":"0A0518","OutlineColor":"281450"}') },
		['Emerald'] 		= { 25, httpService:JSONDecode('{"FontColor":"A8E6C0","MainColor":"0A1F10","AccentColor":"50C878","BackgroundColor":"051408","OutlineColor":"1A3D22"}') },
		['Lavender'] 		= { 26, httpService:JSONDecode('{"FontColor":"D4C1FF","MainColor":"1A0F28","AccentColor":"B57EDC","BackgroundColor":"10081F","OutlineColor":"321A50"}') },
		['Peach'] 		= { 27, httpService:JSONDecode('{"FontColor":"FFE0D6","MainColor":"1F100A","AccentColor":"FFB7B2","BackgroundColor":"140A05","OutlineColor":"3D1F14"}') },
		['Neon'] 		= { 28, httpService:JSONDecode('{"FontColor":"E6FF4D","MainColor":"0A0F02","AccentColor":"DFFF00","BackgroundColor":"050A00","OutlineColor":"283200"}') },
		['Burgundy'] 		= { 29, httpService:JSONDecode('{"FontColor":"E6B3C1","MainColor":"1A050A","AccentColor":"800020","BackgroundColor":"0F0305","OutlineColor":"320A14"}') },
		['Teal'] 		= { 30, httpService:JSONDecode('{"FontColor":"B3E6E6","MainColor":"0A1A1A","AccentColor":"008080","BackgroundColor":"050F0F","OutlineColor":"143232"}') },
		['Cosmic'] 		= { 31, httpService:JSONDecode('{"FontColor":"C8B3FF","MainColor":"0F0A28","AccentColor":"8B5CF6","BackgroundColor":"08051A","OutlineColor":"1E1450"}') },
		['Arctic'] 		= { 32, httpService:JSONDecode('{"FontColor":"2A4A5A","MainColor":"E0EEF4","AccentColor":"81D4FA","BackgroundColor":"EBF5FA","OutlineColor":"A8C8DC"}') },
		['Copper'] 		= { 33, httpService:JSONDecode('{"FontColor":"E6C8A8","MainColor":"1A100A","AccentColor":"B87333","BackgroundColor":"0F0A05","OutlineColor":"32281A"}') },
		['Midnight'] 		= { 34, httpService:JSONDecode('{"FontColor":"B3C1E6","MainColor":"0A0A1A","AccentColor":"191970","BackgroundColor":"05050F","OutlineColor":"141432"}') },
	}

	function ThemeManager:ApplyTheme(theme)
		local customThemeData = self:GetCustomTheme(theme)
		local data = customThemeData or self.BuiltInThemes[theme]

		if not data then return end

		local scheme = data[2]
		for idx, col in next, customThemeData or scheme do
			self.Library[idx] = Color3.fromHex(col)
			
			if Options[idx] then
				Options[idx]:SetValueRGB(Color3.fromHex(col))
			end
		end

		self:ThemeUpdate()
	end

	function ThemeManager:ThemeUpdate()
		-- This allows us to force apply themes without loading the themes tab :)
		local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
		for i, field in next, options do
			if Options and Options[field] then
				self.Library[field] = Options[field].Value
			end
		end

		self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
		self.Library:UpdateColorsUsingRegistry()
	end

	function ThemeManager:LoadDefault()		
		local theme = 'Default'
		local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

		local isDefault = true
		if content then
			if self.BuiltInThemes[content] then
				theme = content
			elseif self:GetCustomTheme(content) then
				theme = content
				isDefault = false;
			end
		elseif self.BuiltInThemes[self.DefaultTheme] then
		 	theme = self.DefaultTheme
		end

		if isDefault then
			Options.ThemeManager_ThemeList:SetValue(theme)
		else
			self:ApplyTheme(theme)
		end
	end

	function ThemeManager:SaveDefault(theme)
		writefile(self.Folder .. '/themes/default.txt', theme)
	end

	function ThemeManager:CreateThemeManager(groupbox)
		groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
		groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
		groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
		groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
		groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });

		local ThemesArray = {}
		for Name, Theme in next, self.BuiltInThemes do
			table.insert(ThemesArray, Name)
		end

		table.sort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

		groupbox:AddDivider()
		groupbox:AddDropdown('ThemeManager_ThemeList', { Text = 'Theme list', Values = ThemesArray, Default = 1 })

		Options.ThemeManager_ThemeList:OnChanged(function()
			self:ApplyTheme(Options.ThemeManager_ThemeList.Value)
		end)

		groupbox:AddButton('Delete theme', function()
			if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
				local path = self.Folder .. '/themes/' .. Options.ThemeManager_CustomThemeList.Value .. '.json'
				if isfile(path) then
					delfile(path)
					self.Library:Notify(string.format('Deleted theme %q', Options.ThemeManager_CustomThemeList.Value))
					Options.ThemeManager_CustomThemeList.Values = self:ReloadCustomThemes()
					Options.ThemeManager_CustomThemeList:SetValues()
					Options.ThemeManager_CustomThemeList:SetValue(nil)
				end
			end
		end)

		groupbox:AddDivider()
		groupbox:AddButton('Export to clipboard', function()
			local theme = {}
			local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
			for _, field in next, fields do
				theme[field] = Options[field].Value:ToHex()
			end
			setclipboard(httpService:JSONEncode(theme))
			self.Library:Notify('Exported theme to clipboard')
		end)

		groupbox:AddButton('Import from clipboard', function()
			local success, decoded = pcall(function()
				return httpService:JSONDecode(getclipboard())
			end)
			if success and decoded then
				for _, field in next, { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" } do
					if decoded[field] then
						Options[field]:SetValueRGB(Color3.fromHex(decoded[field]))
					end
				end
				self:ThemeUpdate()
				self.Library:Notify('Imported theme from clipboard')
			else
				self.Library:Notify('Failed to import theme from clipboard')
			end
		end)

		groupbox:AddButton('Generate random theme', function()
			local function randomColor()
				return Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
			end
			Options.BackgroundColor:SetValueRGB(randomColor())
			Options.MainColor:SetValueRGB(randomColor())
			Options.AccentColor:SetValueRGB(randomColor())
			Options.OutlineColor:SetValueRGB(randomColor())
			Options.FontColor:SetValueRGB(randomColor())
			self:ThemeUpdate()
			self.Library:Notify('Generated random theme')
		end)

		ThemeManager:LoadDefault()

		local function UpdateTheme()
			self:ThemeUpdate()
		end

		Options.BackgroundColor:OnChanged(UpdateTheme)
		Options.MainColor:OnChanged(UpdateTheme)
		Options.AccentColor:OnChanged(UpdateTheme)
		Options.OutlineColor:OnChanged(UpdateTheme)
		Options.FontColor:OnChanged(UpdateTheme)
	end

	function ThemeManager:GetCustomTheme(file)
		local path = self.Folder .. '/themes/' .. file
		if not isfile(path) then
			return nil
		end

		local data = readfile(path)
		local success, decoded = pcall(httpService.JSONDecode, httpService, data)
		
		if not success then
			return nil
		end

		return decoded
	end

	function ThemeManager:SaveCustomTheme(file)
		if file:gsub(' ', '') == '' then
			return self.Library:Notify('Invalid file name for theme (empty)', 3)
		end

		local theme = {}
		local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

		for _, field in next, fields do
			theme[field] = Options[field].Value:ToHex()
		end

		writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
	end

	function ThemeManager:ReloadCustomThemes()
		local list = listfiles(self.Folder .. '/themes')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == '.json' then
				-- i hate this but it has to be done ...

				local pos = file:find('.json', 1, true)
				local char = file:sub(pos, pos)

				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1))
				end
			end
		end

		return out
	end

	function ThemeManager:SetLibrary(lib)
		self.Library = lib
	end

	function ThemeManager:BuildFolderTree()
		local paths = {}

		-- build the entire tree if a path is like some-hub/phantom-forces
		-- makefolder builds the entire tree on Synapse X but not other exploits

		local parts = self.Folder:split('/')
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, '/', 1, idx)
		end

		table.insert(paths, self.Folder .. '/themes')
		table.insert(paths, self.Folder .. '/settings')

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function ThemeManager:SetFolder(folder)
		self.Folder = folder
		self:BuildFolderTree()
	end

	function ThemeManager:CreateGroupBox(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		return tab:AddLeftGroupbox('Themes')
	end

	function ThemeManager:ApplyToTab(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		local groupbox = self:CreateGroupBox(tab)
		self:CreateThemeManager(groupbox)
	end

	function ThemeManager:ApplyToGroupbox(groupbox)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		self:CreateThemeManager(groupbox)
	end

	ThemeManager:BuildFolderTree()
end

return ThemeManager
