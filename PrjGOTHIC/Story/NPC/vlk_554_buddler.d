
instance VLK_554_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 554;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
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
	daily_routine = rtn_start_554;
};


func void rtn_start_554()
{
	ta_sleep(22,15,6,15,"OCR_HUT_72");
	ta_boss(6,15,7,15,"OCR_OUTSIDE_HUT_72");
	ta_washself(7,15,7,45,"OCR_WASH_2");
	ta_standaround(7,45,11,0,"OCR_OUTSIDE_HUT_72");
	ta_repairhut(11,0,13,0,"OCR_OUTSIDE_HUT_72");
	ta_smalltalk(13,0,16,0,"OCR_OUTSIDE_HUT_68_BENCH");
	ta_sitcampfire(16,0,22,15,"OCR_OUTSIDE_HUT_72");
};

