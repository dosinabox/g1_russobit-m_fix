
instance VLK_565_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 4;
	voice = 1;
	id = 565;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",69,3,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_565;
};


func void rtn_start_565()
{
	ta_sleep(23,0,7,30,"OCR_HUT_52");
	ta_standaround(7,30,23,0,"OCR_OUTSIDE_HUT_52");
};

