
instance VLK_514_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 514;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",0,2,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_514;
};


func void rtn_start_514()
{
	ta_sleep(23,0,8,0,"OCR_HUT_17");
	ta_smalltalk(8,0,19,0,"OCR_OUTSIDE_HUT_17");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_09");
};

func void rtn_noarena_514()
{
	ta_sleep(23,0,8,0,"OCR_HUT_17");
	ta_smalltalk(8,0,23,0,"OCR_OUTSIDE_HUT_17");
};

