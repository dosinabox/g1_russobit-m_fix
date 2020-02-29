
instance VLK_513_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 513;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",72,2,vlk_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_513;
};


func void rtn_start_513()
{
	ta_sleep(23,0,8,0,"OCR_HUT_24");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_24");
	ta_sitaround(17,0,19,0,"OCR_OUTSIDE_ARENA_BENCH1");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_05");
};

func void rtn_noarena_513()
{
	ta_sleep(23,0,8,0,"OCR_HUT_24");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_24");
	ta_sitaround(17,0,23,0,"OCR_OUTSIDE_ARENA_BENCH1");
};

