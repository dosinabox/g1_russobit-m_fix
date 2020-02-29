
prototype MST_DEFAULT_SWAMPSHARK(C_NPC)
{
	name[0] = "Болотожор";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_IMPORTANT] = ID_SWAMPSHARK;
	level = 40;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
};

func void set_swampshark_visuals()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPSHARK(MST_DEFAULT_SWAMPSHARK)
{
	set_swampshark_visuals();
	Npc_SetToFistMode(self);
};

instance HURTSWAMPSHARK(MST_DEFAULT_SWAMPSHARK)
{
	name[0] = "Раненый болотожор";
	attribute[ATR_HITPOINTS] = 20;
	set_swampshark_visuals();
	Npc_SetToFistMode(self);
};

