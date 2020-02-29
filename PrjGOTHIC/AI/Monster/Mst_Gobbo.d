
prototype MST_DEFAULT_GREENGOBBO(C_NPC)
{
	name[0] = "Гоблин";
	guild = GIL_GOBBO;
	aivar[AIV_IMPORTANT] = ID_GOBBO;
	level = 6;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_greengobbo_visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GREENGOBBOCLUB(MST_DEFAULT_GREENGOBBO)
{
	set_greengobbo_visuals();
	fight_tactic = FAI_MONSTER_COWARD;
	Npc_SetToFightMode(self,itmw_1h_club_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 5;
};

instance GREENGOBBOSWORD(MST_DEFAULT_GREENGOBBO)
{
	set_greengobbo_visuals();
	Npc_SetToFightMode(self,itmw_1h_sword_old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

