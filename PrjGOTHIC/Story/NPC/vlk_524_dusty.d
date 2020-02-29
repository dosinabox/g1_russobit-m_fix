
instance VLK_524_DUSTY(NPC_DEFAULT)
{
	name[0] = "Дасти";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_VLK;
	level = 10;
	voice = 3;
	id = 524;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Psionic",68,0,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_524;
};


func void rtn_start_524()
{
	ta_sleep(22,0,7,0,"OCR_HUT_58");
	ta_sitaround(7,0,22,0,"OCR_OUTSIDE_HUT_58");
};

func void rtn_follow_524()
{
	ta_followpc_silent(23,0,16,0,"OCR_OUTSIDE_HUT_58");
	ta_followpc_silent(16,0,23,0,"OCR_OUTSIDE_HUT_58");
};

func void rtn_prepareritual_524()
{
	ta_sleep(23,0,7,45,"PSI_25_HUT_IN");
	ta_listen(7,45,23,0,"PSI_PLATFORM_1");
};

func void rtn_remove_524()
{
	ta_stay(23,0,7,45,"WP_INTRO01");
	ta_stay(7,45,23,0,"WP_INTRO01");
};

func void rtn_dead_524()
{
	ta_stay(22,0,7,0,"OCR_HUT_58");
	ta_stay(7,0,22,0,"OCR_HUT_58");
};

func void rtn_prepareritual2_524()
{
	ta_sleep(0,0,8,0,"PSI_25_HUT_IN");
	ta_listen(8,0,0,0,"PSI_12_HUT_EX_TEACH");
};

