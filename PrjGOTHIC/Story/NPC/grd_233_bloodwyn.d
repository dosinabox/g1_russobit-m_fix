
instance GRD_233_BLOODWYN(NPC_DEFAULT)
{
	name[0] = "Бладвин";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 8;
	id = 233;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",18,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_1h_sword_04);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_233;
};


func void rtn_start_233()
{
	ta_guard(6,0,7,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(7,0,8,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(8,0,9,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(9,0,10,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(10,0,11,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(11,0,12,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(12,0,13,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(13,0,14,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(14,0,15,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(15,0,16,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(16,0,17,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(17,0,18,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(18,0,19,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(19,0,20,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(20,0,21,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(21,0,22,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(22,0,23,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(23,0,0,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(0,0,1,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(1,0,2,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(2,0,3,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(3,0,4,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(4,0,5,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(5,0,6,0,"OCR_OUTSIDE_HUT_63");
};

func void rtn_fmtaken_233()
{
	ta_stayneutral(7,0,20,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	ta_stayneutral(20,0,7,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

func void rtn_fmtaken2_233()
{
	ta_stay(7,0,20,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	ta_stay(20,0,7,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

func void rtn_flee_233()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");	
};

