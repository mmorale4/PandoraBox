local PLUGIN = PLUGIN;

ITEM.name = "Scavenging Kit";
ITEM.model = Model( "models/props_junk/cardboard_box004a.mdl" );
ITEM.width = 1;
ITEM.height = 1;
ITEM.description = "A kit containing multiple tools and alike to aid in scavenging.";

function ITEM:GetName()
	return self.name;
end

function ITEM:GetDescription()
	return self.description;
end