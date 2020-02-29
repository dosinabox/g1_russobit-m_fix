
prototype MST_DEFAULT_MINECRAWLERQUEEN(C_NPC)
{
	name[0] = "Королева ползунов";
	guild = GIL_MINECRAWLER;
	aivar[AIV_IMPORTANT] = ID_MINECRAWLERQUEEN;
	level = 200;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLERQUEEN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 1;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
};

func void set_minecrawlerqueen_visuals()
{
	Mdl_SetVisual(self,"CrwQueen.mds");
	Mdl_SetVisualBody(self,"CrQ_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MINECRAWLERQUEEN(MST_DEFAULT_MINECRAWLERQUEEN)
{
	set_minecrawlerqueen_visuals();
	Npc_SetToFistMode(self);
};

