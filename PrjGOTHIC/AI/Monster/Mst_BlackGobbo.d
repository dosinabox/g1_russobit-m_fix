
prototype MST_DEFAULT_BLACKGOBBO(C_NPC)
{
	name[0] = "Черный гоблин";
	guild = GIL_GOBBO;
	aivar[AIV_IMPORTANT] = ID_BLACKGOBBO;
	level = 12;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_blackgobbo_visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BLACKGOBBOMACE(MST_DEFAULT_BLACKGOBBO)
{
	set_blackgobbo_visuals();
	Npc_SetToFightMode(self,itmw_1h_nailmace_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 35;
};

instance BLACKGOBBOWARRIOR(MST_DEFAULT_BLACKGOBBO)
{
	level = 15;
	set_blackgobbo_visuals();
	Npc_SetToFightMode(self,itmw_1h_mace_01);
	attribute[ATR_STRENGTH] = 60 + 30;
	attribute[ATR_HITPOINTS_MAX] = 105;
	attribute[ATR_HITPOINTS] = 105;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	name[0] = "Гоблин-воин";
};

