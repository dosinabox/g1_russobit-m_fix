
instance VLK_521_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 521;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",67,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_521;
};


func void rtn_start_521()
{
	ta_sleep(22,30,7,0,"OCR_HUT_45");
	ta_smalltalk(7,0,11,0,"OCR_OUTSIDE_HUT_47_SMALT2");
	ta_repairhut(11,0,13,0,"OCR_OUTSIDE_HUT_45");
	ta_smalltalk(13,0,16,0,"OCR_OUTSIDE_HUT_47_SMALT2");
	ta_playtune(16,0,22,30,"OCR_OUTSIDE_HUT_48");
};

