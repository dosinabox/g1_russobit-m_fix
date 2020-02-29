
instance VLK_580_GRIM(NPC_DEFAULT)
{
	name[0] = "Грим";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 6;
	id = 580;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",72,2,vlk_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_580;
};


func void rtn_start_580()
{
	ta_sleep(23,1,6,30,"OCR_HUT_2");
	ta_washself(6,30,7,0,"OCR_LAKE_1");
	ta_standaround(7,0,10,0,"OCR_CAMPFIRE_A_MOVEMENT2");
	ta_smalltalk(10,0,12,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	ta_cook(12,0,12,30,"OCR_AT_HUT_2");
	ta_smalltalk(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3");
	ta_cook(15,30,18,5,"OCR_AT_HUT_2");
	ta_sitcampfire(18,5,23,1,"OCR_CAMPFIRE_A_MOVEMENT2");
};

func void rtn_guide_580()
{
	ta_guidepc(10,0,22,0,"OC_ROUND_22_CF_2_MOVEMENT");
	ta_guidepc(22,0,10,0,"OC_ROUND_22_CF_2_MOVEMENT");
};

func void rtn_inextremo_580()
{
	ta_watchinextremo(10,0,22,0,"OCR_AUDIENCE_01");
	ta_watchinextremo(22,0,10,0,"OCR_AUDIENCE_01");
};

func void rtn_remove_580()
{
	ta_stay(10,0,22,0,"WP_INTRO01");
	ta_stay(22,0,10,0,"WP_INTRO01");
};

