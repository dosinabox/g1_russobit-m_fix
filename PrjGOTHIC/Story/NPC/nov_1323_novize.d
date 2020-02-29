
instance NOV_1323_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 3;
	id = 1323;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",34,2,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1323;
};


func void rtn_start_1323()
{
	ta_sleep(1,0,8,0,"PSI_29_HUT_IN");
	ta_sitcampfire(8,0,1,0,"PSI_PATH_4_CAMPFIRE_A");
};

func void rtn_ritual_1323()
{
	ta_stay(8,0,13,0,"PSI_CEREMONY_NEW4");
	ta_stay(13,0,8,0,"PSI_CEREMONY_NEW4");
};

