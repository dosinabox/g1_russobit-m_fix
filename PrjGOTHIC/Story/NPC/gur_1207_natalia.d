
instance GUR_1207_NATALIA(NPC_DEFAULT)
{
	name[0] = "Наталия";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 1207;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 52;
	attribute[ATR_HITPOINTS] = 52;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,0,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_1421;
};


func void rtn_start_1421()
{
	ta_babe_sitaround(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(6,0,7,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(7,0,8,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(8,0,9,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(9,0,10,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(10,0,11,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(11,0,12,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(12,0,13,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(13,0,14,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(14,0,15,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(15,0,16,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(16,0,17,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(17,0,18,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(18,0,19,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(19,0,20,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(20,0,21,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(21,0,22,0,"PSI_TEMPLE_ROOMS_IN");
	ta_babe_fan(22,0,23,0,"PSI_TEMPLE_ROOMS_03");
	ta_babe_sitaround(23,0,0,0,"PSI_TEMPLE_ROOMS_IN");
};

func void rtn_dead_1421()
{
	ta_babe_sitaround(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_sitaround(6,0,0,0,"PSI_TEMPLE_ROOMS_IN_03");
};

