
prototype MST_DEFAULT_UNDEADORCWARRIOR(C_NPC)
{
	name[0] = "Страж храма";
	guild = GIL_UNDEADORC;
	aivar[AIV_IMPORTANT] = ID_UNDEADORCWARRIOR;
	level = 25;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
};

func void set_undeadorcwarrior_visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UNDEADORCWARRIOR(MST_DEFAULT_UNDEADORCWARRIOR)
{
	set_undeadorcwarrior_visuals();
	EquipItem(self,itmw2horcmace01);
};

instance UNDEADOWH(MST_DEFAULT_UNDEADORCWARRIOR)
{
	name[0] = "Верховный страж храма";
	level = 40;
	attribute[ATR_STRENGTH] = 120;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 70;
	set_undeadorcwarrior_visuals();
	EquipItem(self,itmw2horcmace01);
};

