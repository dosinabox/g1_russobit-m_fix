
instance VLK_560_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 560;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",67,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_560;
};


func void rtn_start_560()
{
	ta_sleep(23,0,6,30,"OCR_HUT_16");
	ta_standaround(6,30,11,0,"OCR_OUTSIDE_HUT_16");
	ta_washself(11,0,11,20,"OCR_TO_HUT_17");
	ta_sitcampfire(11,20,23,0,"OCR_OUTSIDE_HUT_16");
};

