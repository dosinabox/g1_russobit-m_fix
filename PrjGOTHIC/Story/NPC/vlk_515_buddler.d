
instance VLK_515_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 515;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_FatBald",0,0,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_515;
};


func void rtn_start_515()
{
	ta_sleep(23,0,6,15,"OCR_HUT_23");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_24");
	ta_sitaround(17,0,19,0,"OCR_HUT_23");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_06");
};

func void rtn_noarena_515()
{
	ta_sleep(23,0,6,15,"OCR_HUT_23");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_24");
	ta_sitaround(17,0,23,0,"OCR_HUT_23");
};

