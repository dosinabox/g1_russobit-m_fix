
prototype MST_DEFAULT_MINECRAWLER(C_NPC)
{
	name[0] = "Ползун";
	guild = GIL_MINECRAWLER;
	aivar[AIV_IMPORTANT] = ID_MINECRAWLER;
	level = 13;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 2;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_ITEMSTATUS] = ONLYROUTINE;
};

func void set_minecrawler_visuals()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Crw_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MINECRAWLER(MST_DEFAULT_MINECRAWLER)
{
	set_minecrawler_visuals();
	Npc_SetToFistMode(self);
};

instance YMINECRAWLER(MST_DEFAULT_MINECRAWLER)
{
	name[0] = "Молодой ползун";
	level = 4;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 6;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	set_minecrawler_visuals();
	Mdl_SetModelScale(self,0.4,0.4,0.4);
	Npc_SetToFistMode(self);
};

instance MINECRAWLER_OMGATE(MST_DEFAULT_MINECRAWLER)
{
	set_minecrawler_visuals();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_minecrawler_omgate;
};
