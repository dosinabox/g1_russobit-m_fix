
instance NOV_1337_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1337;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 8;
	attribute[ATR_MANA] = 8;
	attribute[ATR_HITPOINTS_MAX] = 208;
	attribute[ATR_HITPOINTS] = 208;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",31,2,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1337;
};


func void rtn_start_1337()
{
	ta_meditate(8,0,10,0,"PSI_TEMPLE_COURT_2_MOVEMENT");
	ta_meditate(10,0,8,0,"PSI_TEMPLE_COURT_2_MOVEMENT");
};

func void rtn_ritual_1337()
{
	ta_stay(8,0,10,0,"PSI_TEMPLE_NOVIZE_PR2");
	ta_stay(10,0,8,0,"PSI_TEMPLE_NOVIZE_PR2");
};

