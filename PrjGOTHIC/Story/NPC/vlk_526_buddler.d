
instance VLK_526_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 526;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Pony",74,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_526;
};


func void rtn_start_526()
{
	ta_sleep(23,30,6,30,"OCR_HUT_67");
	ta_boss(6,30,7,30,"OCR_OUTSIDE_HUT_67");
	ta_standaround(7,30,17,0,"OCR_CAMPFIRE_E_1_MOVEMENT");
	ta_sitaround(17,0,18,0,"OCR_HUT_67");
	ta_sitcampfire(18,0,23,30,"OCR_CAMPFIRE_E_1_MOVEMENT");
};

