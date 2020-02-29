
prototype MST_DEFAULT_ORCSLAVE(C_NPC)
{
	name[0] = "ќрк-раб";
	guild = GIL_ORCSLAVE;
	level = 15;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
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
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
};

func void set_orcslave_visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave",DEFAULT,DEFAULT,-1);
};


instance ORCSLAVE(MST_DEFAULT_ORCSLAVE)
{
	guild = gil_orcslave;
	set_orcslave_visuals();
};

instance ORCPEASANTDANCE(MST_DEFAULT_ORCSLAVE)
{
	guild = GIL_ORCWARRIOR;
	name[0] = "ќрк";
	set_orcslave_visuals();
	CreateInvItem(self,itmw2horcsword01);
	start_aistate = zs_orc_dance;
};

instance ORCPEASANTDRUM(MST_DEFAULT_ORCSLAVE)
{
	guild = GIL_ORCWARRIOR;
	name[0] = "ќрк";
	set_orcslave_visuals();
	CreateInvItem(self,itmw2horcsword01);
	start_aistate = zs_orc_drum;
};

