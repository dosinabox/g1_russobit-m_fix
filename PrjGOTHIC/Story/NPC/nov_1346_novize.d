
instance NOV_1346_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 3;
	id = 1346;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",26,2,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1346;
};


func void rtn_start_1346()
{
	ta_smalltalk(8,0,23,0,"PSI_PATH_TEMPLE_9_MOVEMENT");
	ta_sleep(23,0,8,0,"PSI_15_HUT_IN");
};

func void rtn_ritual_1346()
{
	ta_meditate(0,0,8,0,"PSI_TEMPLE_NOVIZE_PR2");
	ta_meditate(8,0,24,0,"PSI_TEMPLE_NOVIZE_PR2");
};

