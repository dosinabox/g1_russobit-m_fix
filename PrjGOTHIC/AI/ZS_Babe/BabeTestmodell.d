
prototype TESTBABE(C_NPC)
{
	name[0] = "Женщина";
	guild = GIL_NONE;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 4000;
};

instance ABABETESTMODELL(TESTBABE)
{
	name[0] = "ATestmodell";
	guild = GIL_NONE;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,DEFAULT,"Bab_Head_Hair1",DEFAULT,DEFAULT,-1);
	Npc_SetAttitude(self,ATT_HOSTILE);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = a_ff;
};


func void a_ff()
{
};

