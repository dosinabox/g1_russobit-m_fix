
instance VLK_578_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 4;
	voice = 2;
	id = 578;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",67,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_578;
};


func void rtn_start_578()
{
	ta_sleep(23,0,6,30,"OCR_HUT_70");
	ta_smalltalk(6,30,12,0,"OCR_OUTSIDE_HUT_68_BENCH");
	ta_cook(12,0,17,30,"OCR_OUTSIDE_HUT_68");
	ta_sitcampfire(17,30,23,0,"OCR_OUTSIDE_CAMPFIRE_D_3");
};

