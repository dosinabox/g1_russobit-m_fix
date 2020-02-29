
prototype MST_DEFAULT_DEMONLORD(C_NPC)
{
	name[0] = "Демон-лорд";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMONLORD;
	level = 100;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 4000;
	aivar[AIV_BEENATTACKED] = 4000;
	aivar[AIV_HIGHWAYMEN] = 3500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
};

func void set_demonlord_visuals()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DEMONLORD(MST_DEFAULT_DEMONLORD)
{
	set_demonlord_visuals();
	Npc_SetToFistMode(self);
};

