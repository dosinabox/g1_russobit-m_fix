
prototype MST_DEFAULT_HARPIE(C_NPC)
{
	name[0] = "Γΰποθÿ";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_HARPIE;
	level = 20;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 85;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2500;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 3;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_harpie_visuals()
{
	Mdl_SetVisual(self,"Harpie.mds");
	Mdl_SetVisualBody(self,"Har_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance HARPIE(MST_DEFAULT_HARPIE)
{
	set_harpie_visuals();
	Npc_SetToFistMode(self);
};

