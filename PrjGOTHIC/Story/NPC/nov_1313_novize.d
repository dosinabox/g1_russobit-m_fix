
instance NOV_1313_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1313;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",30,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1313;
};


func void rtn_start_1313()
{
	ta_sleep(23,55,8,5,"PSI_12_HUT_IN_BED2");
	ta_listen(8,5,23,55,"PSI_12_HUT_EX_TEACH2");
};

func void rtn_remove_1313()
{
	ta_stay(23,0,7,45,"WP_INTRO01");
	ta_stay(7,45,23,0,"WP_INTRO01");
};

