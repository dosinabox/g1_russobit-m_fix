
prototype MST_DEFAULT_ORCSCOUT(C_NPC)
{
	name[0] = "Орк-охотник";
	guild = GIL_ORCSCOUT;
	npctype = NPCTYPE_GUARD;
	voice = 17;
	level = 20;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2500;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_guardpatrol;
};

func void set_orcscout_visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyScout",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance ORCSCOUT(MST_DEFAULT_ORCSCOUT)
{
	set_orcscout_visuals();
	EquipItem(self,itmw2horcsword01);
};

instance ORCPEASANTEATANDDRINK(MST_DEFAULT_ORCSCOUT)
{
	guild = GIL_ORCSCOUT;
	name[0] = "Орк";
	set_orcscout_visuals();
	CreateInvItem(self,itmw2horcsword01);
	start_aistate = zs_orc_eatanddrink;
};

instance ORCSCOUTGYD(MST_DEFAULT_ORCSCOUT)
{
	name[0] = "Орк-разведчик";
	level = 18;
	attribute[ATR_STRENGTH] = 30;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
	set_orcscout_visuals();
	EquipItem(self,itmw2horcsword01);
};

