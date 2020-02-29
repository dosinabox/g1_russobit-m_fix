
instance ORC_2001_SKLAVE(NPC_DEFAULT)
{
	name[0] = "ќрк-раб";
	slot = "ќрк-раб";
	guild = GIL_ORCSLAVE;
	level = 3;
	flags = 0;
	voice = 17;
	id = 2001;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 7;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_ORC;
	senses_range = 2000;
	daily_routine = rtn_nothing_2001;
};


func void rtn_nothing_2001()
{
	ta_orc_sitonfloor(0,0,12,0,"OM_CAVE3_15");
	ta_orc_sitonfloor(12,0,0,0,"OM_CAVE3_15");
};

func void rtn_stomper_2001()
{
	ta_orc_stomper(0,0,12,0,"OM_CAVE3_15");
	ta_orc_stomper(12,0,0,0,"OM_CAVE3_15");
};


instance ORC_2002_SKLAVE(NPC_DEFAULT)
{
	name[0] = "ќрк-раб";
	slot = "Orc Slave";
	guild = GIL_ORCSLAVE;
	level = 3;
	flags = 0;
	voice = 17;
	id = 2002;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 7;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_ORC;
	senses_range = 2000;
	daily_routine = rtn_stonemill_2002;
};


func void rtn_stonemill_2002()
{
	ta_orc_stonemill(0,0,12,0,"OM_CAVE1_BELLOWS");
	ta_orc_stonemill(12,0,0,0,"OM_CAVE1_BELLOWS");
};

