
prototype MST_DEFAULT_ORCWARRIOR(C_NPC)
{
	name[0] = "Орк-солдат";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_GUARD;
	voice = 17;
	level = 25;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 55;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_guard;
};

func void set_orcwarrior_visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance ORCWARRIOR1(MST_DEFAULT_ORCWARRIOR)
{
	name[0] = "Орк-боец";
	level = 25;
	set_orcwarrior_visuals();
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_HITPOINTS_MAX] = 210;
	attribute[ATR_HITPOINTS] = 210;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	EquipItem(self,itmw2horcaxe01);
};

instance ORCWARRIOR2(MST_DEFAULT_ORCWARRIOR)
{
	name[0] = "Орк-солдат";
	level = 30;
	set_orcwarrior_visuals();
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_HITPOINTS_MAX] = 230;
	attribute[ATR_HITPOINTS] = 230;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 35;
	EquipItem(self,itmw2horcaxe02);
};

instance ORCWARRIOR3(MST_DEFAULT_ORCWARRIOR)
{
	name[0] = "Орк-воин клана";
	level = 35;
	set_orcwarrior_visuals();
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	EquipItem(self,itmw2horcaxe03);
};

instance ORCWARRIOR4(MST_DEFAULT_ORCWARRIOR)
{
	name[0] = "Орк-страж";
	level = 40;
	set_orcwarrior_visuals();
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 45;
	EquipItem(self,itmw2horcaxe04);
};

