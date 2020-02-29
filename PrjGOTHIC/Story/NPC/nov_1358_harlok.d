
instance NOV_1358_HARLOK(NPC_DEFAULT)
{
	name[0] = "Харлок";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 3;
	voice = 1;
	id = 1358;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 7;
	attribute[ATR_MANA] = 7;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	protection[PROT_FLY] = 9999;
	protection[PROT_FALL] = 9999;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",28,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_prestart_1358;
};


func void rtn_prestart_1358()
{
	ta_smoke(6,0,23,30,"PSI_31_HUT_EX");
	ta_sleep(23,30,6,0,"PSI_31_HUT_IN");
};

func void rtn_start_1358()
{
	ta_herbalchemy(6,55,23,55,"PSI_HERB_PLACE_1");
	ta_herbalchemy(23,55,6,55,"PSI_HERB_PLACE_1");
};

func void rtn_ch2_1358()
{
	ta_herbalchemy(6,0,23,30,"PSI_HERB_PLACE_1");
	ta_sleep(23,30,6,0,"PSI_31_HUT_IN");
};

