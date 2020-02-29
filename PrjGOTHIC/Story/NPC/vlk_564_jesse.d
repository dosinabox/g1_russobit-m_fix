
instance VLK_564_JESSE(NPC_DEFAULT)
{
	name[0] = "Джесс";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 4;
	voice = 3;
	id = 564;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",71,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_564;
};


func void rtn_start_564()
{
	ta_sleep(23,0,6,45,"OCR_HUT_63");
	ta_cookforme(6,45,12,0,"OCR_OUTSIDE_HUT_63_COOK");
	ta_smalltalk(12,0,17,0,"OCR_OUTSIDE_HUT_63_COOK");
	ta_sitcampfire(17,0,23,0,"OCR_CAMPFIRE_E_2_MOVEMENT");
};

