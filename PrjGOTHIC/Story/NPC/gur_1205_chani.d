
instance GUR_1205_CHANI(NPC_DEFAULT)
{
	name[0] = "ерэш";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 1205;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 52;
	attribute[ATR_HITPOINTS] = 52;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,3,"Bab_Head_Hair1",0,DEFAULT,-1);
	daily_routine = rtn_start_1205;
};


func void rtn_start_1205()
{
	ta_babe_sitaround(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_sitaround(6,0,7,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(7,0,8,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(8,0,9,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(9,0,10,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(10,0,11,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(11,0,12,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(12,0,13,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(13,0,14,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(14,0,15,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(15,0,16,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(16,0,17,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(17,0,18,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(18,0,19,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(19,0,20,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(20,0,21,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(21,0,22,0,"PSI_TEMPLE_ROOMS_05");
	ta_babe_sitaround(22,0,23,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_fan(23,0,0,0,"PSI_TEMPLE_ROOMS_05");
};

func void rtn_dead_1205()
{
	ta_babe_sitaround(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_babe_sitaround(6,0,0,0,"PSI_TEMPLE_ROOMS_IN_02");
};

