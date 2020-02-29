
instance VLK_504_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 504;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Thief",74,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_504;
};


func void rtn_start_504()
{
	ta_sleep(22,0,6,30,"OCR_HUT_12");
	ta_sitaround(6,30,10,30,"OCR_HUT_12");
	ta_repairhut(10,30,17,30,"OCR_OUTSIDE_HUT_12");
	ta_sitaround(17,30,22,0,"OCR_HUT_12");
};

