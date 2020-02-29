
prototype MST_DEFAULT_WARAN(C_NPC)
{
	name[0] = "ящерица";
	guild = GIL_WARAN;
	aivar[AIV_IMPORTANT] = ID_WARAN;
	level = 8;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1100;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 2;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
};

func void set_waran_visuals()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WARAN(MST_DEFAULT_WARAN)
{
	set_waran_visuals();
	Npc_SetToFistMode(self);
};

