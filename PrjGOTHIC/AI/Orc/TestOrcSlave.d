
prototype ORCSLAVE_TESTTYPE(C_NPC)
{
	name[0] = "OrcSlave Prototype";
	guild = GIL_ORCSLAVE;
	level = 1;
	attribute[ATR_STRENGTH] = 8;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
};

instance SLAVE0(ORCSLAVE_TESTTYPE)
{
	name[0] = "Slave0";
	guild = GIL_ORCSLAVE;
	level = 10;
	voice = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orcslavea;
};

instance SLAVE1(ORCSLAVE_TESTTYPE)
{
	name[0] = "Slave1";
	guild = GIL_ORCSLAVE;
	level = 10;
	voice = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orcslaveb;
};

instance SLAVE2(ORCSLAVE_TESTTYPE)
{
	name[0] = "Slave1";
	guild = GIL_ORCSLAVE;
	level = 10;
	voice = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orcslavea;
};


func void rtn_orcslavea()
{
	orcslaveperc();
	ta_orc_sitonfloor(22,30,5,0,"ORC_WAY_SIT_01");
	ta_orc_stonemill(5,0,12,0,"ORC_WAY_09");
	ta_orc_eat(12,0,12,30,"ORC_WAY_09");
	ta_orc_stonemill(12,30,20,0,"ORC_WAY_09");
	ta_orc_eat(20,0,20,30,"ORC_WAY_09");
	ta_orc_stonemill(20,30,22,30,"ORC_WAY_09");
};

func void rtn_orcslaveb()
{
	orcslaveperc();
	ta_orc_sitonfloor(22,30,5,0,"ORC_WAY_LISTEN_01");
	ta_orc_stomper(5,0,12,0,"ORC_WAY_08");
	ta_orc_eat(12,0,12,30,"ORC_WAY_08");
	ta_orc_stomper(12,30,20,0,"ORC_WAY_08");
	ta_orc_eat(20,0,20,30,"ORC_WAY_08");
	ta_orc_stomper(20,30,22,30,"ORC_WAY_08");
};

