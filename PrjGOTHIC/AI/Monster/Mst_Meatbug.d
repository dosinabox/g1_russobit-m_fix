
prototype MST_DEFAULT_MEATBUG(C_NPC)
{
	name[0] = "ћ€сной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_IMPORTANT] = ID_MEATBUG;
	level = 1;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = 500;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_ITEMSTATUS] = ONLYROUTINE;
};

func void set_meatbug_visuals()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MEATBUG(MST_DEFAULT_MEATBUG)
{
	set_meatbug_visuals();
	CreateInvItems(self,itat_meatbug_01,1);
};

