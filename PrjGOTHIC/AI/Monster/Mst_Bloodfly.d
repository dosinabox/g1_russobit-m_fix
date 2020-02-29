
prototype MST_DEFAULT_BLOODFLY(C_NPC)
{
	name[0] = "Ўершень";
	guild = GIL_BLOODFLY;
	aivar[AIV_IMPORTANT] = ID_BLOODFLY;
	level = 7;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_ITEMSTATUS] = ONLYROUTINE;
};

func void set_bloodfly_visuals()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BLOODFLY(MST_DEFAULT_BLOODFLY)
{
	set_bloodfly_visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_bloodfly_01,2);
};

instance HELPBROTHERS_BLOODFLY(MST_DEFAULT_BLOODFLY)
{
	set_bloodfly_visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_bloodfly_01,2);
	name[0] = "«лобный шершень";
};

