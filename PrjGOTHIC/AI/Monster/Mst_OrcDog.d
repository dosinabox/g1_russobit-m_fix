
prototype MST_DEFAULT_ORCDOG(C_NPC)
{
	name[0] = "Орочья собака";
	guild = GIL_ORCDOG;
	aivar[AIV_IMPORTANT] = ID_BLACKWOLF;
	level = 12;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORCDOG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1800;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 15;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_orcdog_visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Dog_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance ORCDOG(MST_DEFAULT_ORCDOG)
{
	set_orcdog_visuals();
	Npc_SetToFistMode(self);
};

