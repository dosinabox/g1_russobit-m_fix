
instance VLK_557_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 1;
	id = 557;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",71,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_557;
};


func void rtn_start_557()
{
	ta_sleep(23,15,6,30,"OCR_HUT_75");
	ta_washself(6,30,7,6,"OCR_LAKE_4");
	ta_standaround(7,6,12,0,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
	ta_sitaround(12,0,13,0,"OCR_OUTSIDE_HUT_75");
	ta_cook(13,0,14,0,"OCR_OUTSIDE_HUT_75");
	ta_standaround(14,0,16,0,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
	ta_sitaround(16,0,17,55,"OCR_OUTSIDE_HUT_75");
	ta_sitcampfire(17,55,23,15,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
};

