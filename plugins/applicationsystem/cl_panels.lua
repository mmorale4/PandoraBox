local PLUGIN = PLUGIN
local PANEL = {}

--[[-------------------------------------------------------------------------
Application Viewer
---------------------------------------------------------------------------]]
function PANEL:Init()
	ix.gui.appview = self
	self:SetSize(ScrW() / 2, ScrH() / 2)
	self:Center()
	self:MakePopup()
	self.ListView = self:Add("DListView")
	self.ListView:Dock(FILL)
	self.ListView:AddColumn("Applicant Name")
	self.ListView:AddColumn("Applicant ID")
	self.ListView:AddColumn("Application Date")
	self.ListView:AddColumn("Status")
	self.ViewButton = self:Add("DButton")
	self.ViewButton:Dock(BOTTOM)
	self.ViewButton:SetText("View Application")
	self:PopulateApplications()

	function self.ViewButton:DoClick()
		local row = ix.gui.appview.ListView:GetSelectedLine()
		local line = ix.gui.appview.ListView:GetLine(row)
		local ui = vgui.Create("CPApplicationMenuViewer")

		--print(ui)
		--Set the data in the new interface in case the UI behind it is closed.
		ui.data = {
			["name"] = line:GetColumnText(1),
			["id"] = line:GetColumnText(2),
			["date"] = line:GetColumnText(3),
			["steamid"] = line.steamid,
			["appinfo"] = line.appinfo
		}
		--print(ui.data)
	end
end

function PANEL:AddApplication(name, id, date, steamid, appinfo)
	----print(name)
	local status
	print(appinfo["response"])
	if string.len(appinfo["response"]) > 0 then
		status = "Rejected"
		if appinfo["response"] == "!true" then
			status = "Approved"
		end
	else
		status = "Pending"
	end
	
	local row = self.ListView:AddLine(name, id, date, status)
	row.steamid = steamid
	row.appinfo = appinfo
end

function PANEL:PopulateApplications()
	timer.Simple(1, function()
		for k, v in pairs(self.sqldata) do
			self:AddApplication(v["name"], v["cid"], v["date"], v["steamid"], v)
			print(v["app_id"])
		end
	end)
end

vgui.Register("CPApplicationMenu", PANEL, "DFrame")
local PANEL = {}

--[[-------------------------------------------------------------------------
Application Viewer Viewer
---------------------------------------------------------------------------]]
function PANEL:Init()
	ix.gui.appviewviewer = self
	self:SetSize(ScrW() / 2, ScrH() / 2)
	self:Center()
	self:MakePopup()
	self.AcceptButton = self:Add("DButton")
	self.AcceptButton:Dock(BOTTOM)
	self.AcceptButton:SetText("Respond to Application")

	function self.AcceptButton:DoClick()
		local ui = vgui.Create("DFrame")
			ui:SetSize(ScrW() / 4, ScrH() / 3)
			ui:Center()
			ui:MakePopup()

			ui.Text = ui:Add("DLabel")
			ui.Text:Dock(TOP)
			ui.Text:SetFont("ixSmallFont")
			ui.Text:SetText("Respond to the application with a quick and concise reasoning, tick the checkbox if they are accepted or not, if they are accepted, whatever you enter in the box doesn't matter, it will be overwritten anyway.")
			ui.Text:SetWrap(true)
			ui.Text:SetAutoStretchVertical(true)

			ui.CheckBox = ui:Add("DCheckBox")
			ui.CheckBox:Center()
			ui.CheckBox:SetText("Check this box if they are accepted or not.")

			ui.TextEntry = ui:Add("DTextEntry")
			ui.TextEntry:Dock(TOP)
			local w, h = ui.TextEntry:GetSize()
			ui.TextEntry:SetSize(w, 50)

			ui.button = ui:Add("DButton")
			ui.button:Dock(BOTTOM)
			ui.button:SetText("Submit Review")

			function ui.button:DoClick()
				if tobool(ix.gui.appviewviewer.data.appinfo.seen) == true then
					LocalPlayer():Notify("You cannot change the response on an already reviewed application!")
					return
				end
				local text = self:GetParent().TextEntry:GetText()
				if ui.CheckBox:GetChecked() then
					text = "!true"
				end
				netstream.Start("ApplicationResponse", {text, ix.gui.appviewviewer.data})
				self:GetParent():Close()
			end
	end

	self.PanelList = self:Add("DPanelList")
	self.PanelList:Dock(FILL)
	self.PanelList:EnableVerticalScrollbar(true)

	timer.Simple(1, function()
		--printTable(self.data)
		local data = self.data.appinfo
		self.AppTitle1 = self:Add("DLabel")
		self.AppTitle1:Dock(TOP)
		self.AppTitle1:SetFont("ixBigFont")
		self.AppTitle1:SetText("Name")
		self.AppTitle1:SizeToContents()
		self.PanelList:AddItem(self.AppTitle1)
		self.AppText1 = self:Add("DLabel")
		self.AppText1:Dock(TOP)
		self.AppText1:SetFont("ixSmallFont")
		self.AppText1:SetText(self.data.appinfo.name)
		self.AppText1:SetWrap(true)
		self.AppText1:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText1)
		self.AppTitle2 = self:Add("DLabel")
		self.AppTitle2:Dock(TOP)
		self.AppTitle2:SetFont("ixBigFont")
		self.AppTitle2:SetText("Citizen Identification Number")
		self.AppTitle2:SizeToContents()
		self.PanelList:AddItem(self.AppTitle2)
		self.AppText2 = self:Add("DLabel")
		self.AppText2:Dock(TOP)
		self.AppText2:SetFont("ixSmallFont")
		self.AppText2:SetText(self.data.appinfo.cid)
		self.AppText2:SetWrap(true)
		self.AppText2:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText2)
		self.AppTitle3 = self:Add("DLabel")
		self.AppTitle3:Dock(TOP)
		self.AppTitle3:SetFont("ixBigFont")
		self.AppTitle3:SetText("Referral Information")
		self.AppTitle3:SizeToContents()
		self.PanelList:AddItem(self.AppTitle3)
		self.AppText3 = self:Add("DLabel")
		self.AppText3:Dock(TOP)
		self.AppText3:SetFont("ixSmallFont")
		self.AppText3:SetText(self.data.appinfo.referral)
		self.AppText3:SetWrap(true)
		self.AppText3:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText3)
		self.AppTitle4 = self:Add("DLabel")
		self.AppTitle4:Dock(TOP)
		self.AppTitle4:SetFont("ixBigFont")
		self.AppTitle4:SetText("Why do you want to join?")
		self.AppTitle4:SizeToContents()
		self.PanelList:AddItem(self.AppTitle4)
		self.AppText4 = self:Add("DLabel")
		self.AppText4:Dock(TOP)
		self.AppText4:SetFont("ixSmallFont")
		self.AppText4:SetText(self.data.appinfo.why)
		self.AppText4:SetWrap(true)
		self.AppText4:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText4)
		self.AppTitle5 = self:Add("DLabel")
		self.AppTitle5:Dock(TOP)
		self.AppTitle5:SetFont("ixBigFont")
		self.AppTitle5:SetText("Background Information")
		self.AppTitle5:SizeToContents()
		self.PanelList:AddItem(self.AppTitle5)
		self.AppText5 = self:Add("DLabel")
		self.AppText5:Dock(TOP)
		self.AppText5:SetFont("ixSmallFont")
		self.AppText5:SetText(self.data.appinfo.story)
		self.AppText5:SetWrap(true)
		self.AppText5:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText5)
		self.AppTitle6 = self:Add("DLabel")
		self.AppTitle6:Dock(TOP)
		self.AppTitle6:SetFont("ixBigFont")
		self.AppTitle6:SetText("Notable Skills")
		self.AppTitle6:SizeToContents()
		self.PanelList:AddItem(self.AppTitle6)
		self.AppText6 = self:Add("DLabel")
		self.AppText6:Dock(TOP)
		self.AppText6:SetFont("ixSmallFont")
		self.AppText6:SetText(self.data.appinfo.skills)
		self.AppText6:SetWrap(true)
		self.AppText6:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText6)
		self.AppTitle7 = self:Add("DLabel")
		self.AppTitle7:Dock(TOP)
		self.AppTitle7:SetFont("ixBigFont")
		self.AppTitle7:SetText("Relocation History")
		self.AppTitle7:SizeToContents()
		self.PanelList:AddItem(self.AppTitle7)
		self.AppText7 = self:Add("DLabel")
		self.AppText7:Dock(TOP)
		self.AppText7:SetFont("ixSmallFont")
		self.AppText7:SetText(self.data.appinfo.relocation)
		self.AppText7:SetWrap(true)
		self.AppText7:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText7)
		self.AppTitle8 = self:Add("DLabel")
		self.AppTitle8:Dock(TOP)
		self.AppTitle8:SetFont("ixBigFont")
		self.AppTitle8:SetText("Family History")
		self.AppTitle8:SizeToContents()
		self.PanelList:AddItem(self.AppTitle8)
		self.AppText8 = self:Add("DLabel")
		self.AppText8:Dock(TOP)
		self.AppText8:SetFont("ixSmallFont")
		self.AppText8:SetText(self.data.appinfo.family)
		self.AppText8:SetWrap(true)
		self.AppText8:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText8)
		self.AppTitle9 = self:Add("DLabel")
		self.AppTitle9:Dock(TOP)
		self.AppTitle9:SetFont("ixBigFont")
		self.AppTitle9:SetText("Employment History")
		self.AppTitle9:SizeToContents()
		self.PanelList:AddItem(self.AppTitle9)
		self.AppText9 = self:Add("DLabel")
		self.AppText9:Dock(TOP)
		self.AppText9:SetFont("ixSmallFont")
		self.AppText9:SetText(self.data.appinfo.employment)
		self.AppText9:SetWrap(true)
		self.AppText9:SetAutoStretchVertical(true)
		self.PanelList:AddItem(self.AppText9)
	end)
end

vgui.Register("CPApplicationMenuViewer", PANEL, "DFrame")
--vgui.Create("CPApplicationMenu")
--[[-------------------------------------------------------------------------
Apply Intro
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
	ix.gui.cpapp = self
	self:SetSize(ScrW() / 4, ScrH() / 2)
	self:Center()
	self:MakePopup()
	self.ApplicationTitle = self:Add("DLabel")
	self.ApplicationTitle:Dock(TOP)
	self.ApplicationTitle:SetText("OOC Whitelist Application Terminal.")
	self.ApplicationTitle:SetContentAlignment(5)
	self.ApplicationTitle:SetFont("ixSmallFont")
	self.ApplicationTitle:SetExpensiveShadow(1)
	self.ApplicationDescription = self:Add("DLabel")
	self.ApplicationDescription:SetContentAlignment(5)
	self.ApplicationDescription:Dock(TOP)
	self.ApplicationDescription:SetText("\n\nThis terminal was made for the purpose of applying for whitelists in the server. You can select the three whitelists and apply for them and applications will be sent to the staff from it. Select bellow what whitelist you wish to apply for.")
	self.ApplicationDescription:SetFont("ixSmallFont")
	self.ApplicationDescription:SetExpensiveShadow(1)
	self.ApplicationDescription:SetWrap(true)
	self.ApplicationDescription:SetAutoStretchVertical(true)
	self.ComboBox = self:Add("DComboBox")
	self.ComboBox:Dock(TOP)
	self.ComboBox:SetText("Select an option.")
	self.ComboBox:AddChoice("Rogue Metropolice")
	self.ComboBox:AddChoice("Overwatch Transhuman Arm")
	self.ComboBox:AddChoice("Vortigaunt")
	self.ConfirmButton = self:Add("DButton")
	self.ConfirmButton:Dock(BOTTOM)
	self.ConfirmButton:SetText("Confirm Choice")

	function self.ConfirmButton:DoClick()
		if ix.gui.cpapp.ComboBox:GetText() == "Rogue Metropolice" then
			vgui.Create("CPApplicationSend")
		else
			LocalPlayer():Notify("Out of character applications for this Faction are currently unavailable.")
		end
	end
end

vgui.Register("CPApplicationIntro", PANEL, "DFrame")
--vgui.Create("CPApplicationIntro")
--[[-------------------------------------------------------------------------
CP Application
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
	ix.gui.cpappsubmit = self
	self:SetSize(ScrW() / 2, ScrH() / 2)
	self:Center()
	self:MakePopup()
	self.PanelList = self:Add("DPanelList")
	self.PanelList:Dock(FILL)
	self.PanelList:EnableVerticalScrollbar(true)
	self.ApplicationTitle = self:Add("DLabel")
	self.ApplicationTitle:Dock(TOP)
	self.ApplicationTitle:SetText("Your whitelist application.")
	self.ApplicationTitle:SetContentAlignment(5)
	self.ApplicationTitle:SetFont("ixSmallFont")
	self.ApplicationTitle:SetExpensiveShadow(1)
	self.ApplicationTitle:SetZPos(1)
	self.PanelList:AddItem(self.ApplicationTitle)
	self.ApplicationDescription = self:Add("DLabel")
	self.ApplicationDescription:Dock(TOP)
	self.ApplicationDescription:SetText("\nSo you made your choice of whitelist to apply for. Please fill the out following boxes with proper details for selection.")
	self.ApplicationDescription:SetFont("ixSmallFont")
	self.ApplicationDescription:SetWrap(true)
	self.ApplicationDescription:SetAutoStretchVertical(true)
	self.ApplicationDescription:SetZPos(2)
	self.PanelList:AddItem(self.ApplicationDescription)
	--[[-------------------------------------------------------------------------
	Form 1: Name
	---------------------------------------------------------------------------]]
	self.text = self:Add("DLabel")
	self.text:Dock(TOP)
	self.text:SetText("Character Name(s)")
	self.text:SetFont("ixSmallFont")
	self.text:SetZPos(3)
	self.PanelList:AddItem(self.text)
	self.ApplicationForm1 = self:Add("DTextEntry")
	self.ApplicationForm1:Dock(TOP)
	self.ApplicationForm1:SetText(LocalPlayer():Name())
	self.ApplicationForm1:SetZPos(3)
	self.PanelList:AddItem(self.ApplicationForm1)
	--[[-------------------------------------------------------------------------
	Form 2: CID
	---------------------------------------------------------------------------]]
	self.ApplicationForm2Title = self:Add("DLabel")
	self.ApplicationForm2Title:Dock(TOP)
	self.ApplicationForm2Title:SetText("SteamID")
	self.ApplicationForm2Title:SetFont("ixSmallFont")
	self.ApplicationForm2Title:SetZPos(4)
	self.PanelList:AddItem(self.ApplicationForm2Title)
	self.ApplicationForm2 = self:Add("DTextEntry")
	self.ApplicationForm2:Dock(TOP)
	self.ApplicationForm2:SetZPos(5)
	self.ApplicationForm2:SetText("SteamID")
	--self.ApplicationForm2:SetMultiline(true)
	self.PanelList:AddItem(self.ApplicationForm2)
	--[[-------------------------------------------------------------------------
	Form 3: Referral
	---------------------------------------------------------------------------]]
	self.ApplicationForm3Title = self:Add("DLabel")
	self.ApplicationForm3Title:Dock(TOP)
	self.ApplicationForm3Title:SetText("How long have you been roleplaying?")
	self.ApplicationForm3Title:SetFont("ixSmallFont")
	self.ApplicationForm3Title:SetZPos(6)
	self.PanelList:AddItem(self.ApplicationForm3Title)
	self.ApplicationForm3 = self:Add("DTextEntry")
	self.ApplicationForm3:Dock(TOP)
	self.ApplicationForm3:SetText("How long have you been roleplaying?")
	self.ApplicationForm3:SetZPos(7)
	self.PanelList:AddItem(self.ApplicationForm3)
	--[[-------------------------------------------------------------------------
	Form 4: Why
	---------------------------------------------------------------------------]]
	self.ApplicationForm4Title = self:Add("DLabel")
	self.ApplicationForm4Title:Dock(TOP)
	self.ApplicationForm4Title:SetText("Provide a detailed RP scenario in which you find a rebel stealing RCP gear. (600 characters max)")
	self.ApplicationForm4Title:SetFont("ixSmallFont")
	self.ApplicationForm4Title:SetZPos(8)
	self.PanelList:AddItem(self.ApplicationForm4Title)
	self.ApplicationForm4 = self:Add("DTextEntry")
	self.ApplicationForm4:Dock(TOP)
	self.ApplicationForm4:SetMultiline(true)
	self.ApplicationForm4:SetText("Provide a detailed RP scenario in which you find a rebel stealing RCP gear. (600 characters max)")
	self.ApplicationForm4:SetZPos(9)
	local w, h = self.ApplicationForm4:GetSize()
	self.ApplicationForm4:SetSize(w, 100)
	self.PanelList:AddItem(self.ApplicationForm4)
	--[[-------------------------------------------------------------------------
	Form 5: Story
	---------------------------------------------------------------------------]]
	self.ApplicationForm5Title = self:Add("DLabel")
	self.ApplicationForm5Title:Dock(TOP)
	self.ApplicationForm5Title:SetText("Provide a detailed RP scenario in which you are out on patrol and a refugee attempts to mug you.(1500 characters max)")
	self.ApplicationForm5Title:SetFont("ixSmallFont")
	self.ApplicationForm5Title:SetZPos(10)
	self.PanelList:AddItem(self.ApplicationForm5Title)
	self.ApplicationForm5 = self:Add("DTextEntry")
	self.ApplicationForm5:Dock(TOP)
	self.ApplicationForm5:SetText("Provide a detailed RP scenario in which you are out on patrol and a refugee attempts to mug you. You are with a fellow unit. (1500 characters max)")
	self.ApplicationForm5:SetMultiline(true)
	self.ApplicationForm5:SetZPos(11)
	local w, h = self.ApplicationForm5:GetSize()
	self.ApplicationForm5:SetSize(w, 200)
	self.PanelList:AddItem(self.ApplicationForm5)
	--[[-------------------------------------------------------------------------
	Form 6: Skills
	---------------------------------------------------------------------------]]
	self.ApplicationForm6Title = self:Add("DLabel")
	self.ApplicationForm6Title:Dock(TOP)
	self.ApplicationForm6Title:SetText("What is passive RP and how is it properly conducting? (300 characters max)")
	self.ApplicationForm6Title:SetFont("ixSmallFont")
	self.ApplicationForm6Title:SetZPos(12)
	self.PanelList:AddItem(self.ApplicationForm6Title)
	self.ApplicationForm6 = self:Add("DTextEntry")
	self.ApplicationForm6:Dock(TOP)
	self.ApplicationForm6:SetMultiline(true)
	self.ApplicationForm6:SetZPos(13)
	self.ApplicationForm6:SetText("What is passive RP and how is it properly conducting? (300 characters max)")
	local w, h = self.ApplicationForm6:GetSize()
	self.ApplicationForm6:SetSize(w, 100)
	self.PanelList:AddItem(self.ApplicationForm6)
	--[[-------------------------------------------------------------------------
	Form 7: Relocation History
	---------------------------------------------------------------------------]]
	self.ApplicationForm7Title = self:Add("DLabel")
	self.ApplicationForm7Title:Dock(TOP)
	self.ApplicationForm7Title:SetText("Do you realize if you deploy without a group and commanding officer's blessing you may lose your whitelist?")
	self.ApplicationForm7Title:SetFont("ixSmallFont")
	self.ApplicationForm7Title:SetZPos(14)
	self.PanelList:AddItem(self.ApplicationForm7Title)
	self.ApplicationForm7 = self:Add("DTextEntry")
	self.ApplicationForm7:Dock(TOP)
	self.ApplicationForm7:SetMultiline(true)
	self.ApplicationForm7:SetZPos(15)
	self.ApplicationForm7:SetText("Do you realize if you deploy without a group and commanding officer's blessing you may lose your whitelist?")
	local w, h = self.ApplicationForm7:GetSize()
	self.ApplicationForm7:SetSize(w, 100)
	self.PanelList:AddItem(self.ApplicationForm7)
	--[[-------------------------------------------------------------------------
	Form 8: Family
	---------------------------------------------------------------------------]]
	self.ApplicationForm8Title = self:Add("DLabel")
	self.ApplicationForm8Title:Dock(TOP)
	self.ApplicationForm8Title:SetText("Do you know how to RP as a OTA or RCP? :")
	self.ApplicationForm8Title:SetFont("ixSmallFont")
	self.ApplicationForm8Title:SetWrap(true)
	self.ApplicationForm8Title:SetAutoStretchVertical(true)
	self.ApplicationForm8Title:SetZPos(16)
	self.PanelList:AddItem(self.ApplicationForm8Title)
	self.ApplicationForm8 = self:Add("DTextEntry")
	self.ApplicationForm8:Dock(TOP)
	self.ApplicationForm8:SetZPos(17)
	self.ApplicationForm8:SetMultiline(true)
	self.ApplicationForm8:SetText("Do you know how to RP as a OTA or RCP? :")
	local w, h = self.ApplicationForm8:GetSize()
	self.ApplicationForm8:SetSize(w, 100)
	self.PanelList:AddItem(self.ApplicationForm8)
	--[[-------------------------------------------------------------------------
	Form 9: Employment History
	---------------------------------------------------------------------------]]
	self.ApplicationForm9Title = self:Add("DLabel")
	self.ApplicationForm9Title:Dock(TOP)
	self.ApplicationForm9Title:SetText("Do you understand the rogue RCP faction is for people interested in a slower passed RP vs a action oriented RP?")
	self.ApplicationForm9Title:SetFont("ixSmallFont")
	self.ApplicationForm9Title:SetZPos(18)
	self.PanelList:AddItem(self.ApplicationForm9Title)
	self.ApplicationForm9 = self:Add("DTextEntry")
	self.ApplicationForm9:Dock(TOP)
	self.ApplicationForm9:SetZPos(19)
	self.ApplicationForm9:SetMultiline(true)
	self.ApplicationForm9:SetText("Do you understand the rogue RCP faction is for people interested in a slower passed RP vs a action oriented RP?")
	local w, h = self.ApplicationForm9:GetSize()
	self.ApplicationForm9:SetSize(w, 100)
	self.PanelList:AddItem(self.ApplicationForm9)
	--[[-------------------------------------------------------------------------
	Submit Button
	---------------------------------------------------------------------------]]
	self.WarningText = self:Add("DLabel")
	self.WarningText:Dock(TOP)
	self.WarningText:SetText("Before submitting your application ensure you have everything you have written here saved! This window will close when you click the button!")
	self.WarningText:SetFont("ixSmallFont")
	self.WarningText:SetWrap(true)
	self.WarningText:SetZPos(20)
	self.WarningText:SetContentAlignment(5)
	self.WarningText:SetAutoStretchVertical(true)
	self.PanelList:AddItem(self.WarningText)
	self.PanelList:AddItem(self.ApplicationForm9Title)
	self.ApplicationSubmit = self:Add("DButton")
	self.ApplicationSubmit:Dock(BOTTOM)
	self.ApplicationSubmit:SetText("Submit Application")
	self.ApplicationSubmit:SetZPos(21)
	self.PanelList:AddItem(self.ApplicationSubmit)
	local w, h = self.ApplicationSubmit:GetSize()
	self.ApplicationSubmit:SetSize(w, 50)

	function self.ApplicationSubmit:DoClick()
		local Timestamp = os.time()
		local TimeString = os.date("%H:%M:%S - %d/%m/%Y", Timestamp)
		netstream.Start("SubmitApplication", {ix.gui.cpappsubmit.ApplicationForm1:GetText(), ix.gui.cpappsubmit.ApplicationForm2:GetText(), ix.gui.cpappsubmit.ApplicationForm3:GetText(), ix.gui.cpappsubmit.ApplicationForm4:GetText(), ix.gui.cpappsubmit.ApplicationForm5:GetText(), ix.gui.cpappsubmit.ApplicationForm6:GetText(), ix.gui.cpappsubmit.ApplicationForm7:GetText(), ix.gui.cpappsubmit.ApplicationForm8:GetText(), ix.gui.cpappsubmit.ApplicationForm9:GetText(), "cp", TimeString, LocalPlayer():SteamID64(), LocalPlayer():GetCharacter():GetID()})
		ix.gui.cpappsubmit:Close()
	end
end

vgui.Register("CPApplicationSend", PANEL, "DFrame")
--vgui.Create("CPApplicationSend")
local PANEL = {}

function PANEL:Init()
	self:SetSize(ScrW() / 2, ScrH() / 2)
	self:Center()
	self:MakePopup()
end

vgui.Register("DAApplicationSend", PANEL, "DFrame")
--vgui.Create("DAApplicationSend")
local PANEL = {}

function PANEL:Init()
	self:SetSize(ScrW() / 2, ScrH() / 2)
	self:Center()
	self:MakePopup()
end

vgui.Register("CWApplicationSend", PANEL, "DFrame")
--vgui.Create("CWApplicationSend")