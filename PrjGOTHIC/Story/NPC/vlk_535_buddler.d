
instance VLK_535_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 3;
	id = 535;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Bald",73,2,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_535;
};


func void rtn_start_535()
{
	ta_sleep(22,30,6,45,"OCR_HUT_71");
	ta_sitaround(6,45,8,0,"OCR_OUTSIDE_HUT_71");
	ta_standaround(8,0,11,0,"OCR_OUTSIDE_HUT_71");
	ta_washself(11,0,11,30,"OCR_WASH_2");
	ta_sitaround(11,30,16,30,"OCR_OUTSIDE_HUT_71");
	ta_sitcampfire(16,30,22,30,"OCR_OUTSIDE_HUT_71");
};

