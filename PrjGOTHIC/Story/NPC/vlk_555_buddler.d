
instance VLK_555_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 3;
	id = 555;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_Psionic",0,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	daily_routine = rtn_start_555;
};


func void rtn_start_555()
{
	ta_sleep(22,45,7,30,"OCR_HUT_29");
	ta_sitaround(7,30,11,0,"OCR_OUTSIDE_HUT_29");
	ta_repairhut(11,0,17,0,"OCR_OUTSIDE_HUT_29");
	ta_sitaround(17,0,22,45,"OCR_OUTSIDE_HUT_29");
};

