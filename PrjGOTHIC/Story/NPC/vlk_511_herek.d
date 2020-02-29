
instance VLK_511_HEREK(NPC_DEFAULT)
{
	name[0] = "Херек";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 2;
	voice = 1;
	id = 511;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Pony",105,3,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItems(self,itminugget,4);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_511;
};


func void rtn_start_511()
{
	ta_sleep(22,0,7,0,"OCR_HUT_62");
	ta_boss(7,0,8,0,"OCR_OUTSIDE_HUT_62");
	ta_smalltalk(8,0,12,0,"OCR_OUTSIDE_HUT_63_SMALLTALK");
	ta_smith_sharp(12,0,17,0,"OCR_OUTSIDE_HUT_63_SMALLTALK");
	ta_sitaround(17,0,22,0,"OCR_OUTSIDE_HUT_62");
};

