
prototype MST_DEFAULT_WOLF(C_NPC)
{
	name[0] = "Волк";
	guild = GIL_WOLF;
	aivar[AIV_IMPORTANT] = ID_WOLF;
	level = 9;
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
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 500;
	aivar[AIV_HAS_ERPRESSED] = 3;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
};

func void set_wolf_visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WOLF(MST_DEFAULT_WOLF)
{
	set_wolf_visuals();
	Npc_SetToFistMode(self);
};

