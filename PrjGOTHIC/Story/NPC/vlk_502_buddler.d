
instance VLK_502_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 4;
	id = 502;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",68,4,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itmilute);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_502;
};


func void rtn_start_502()
{
	ta_sleep(22,0,7,0,"OCR_HUT_10");
	ta_cook(7,0,17,0,"OCR_COOK_AT_HUT_10");
	ta_playtune(17,0,22,0,"OCR_OUTSIDE_HUT_10");
};

