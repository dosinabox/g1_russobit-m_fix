
instance NOV_1355_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	flags = 0;
	voice = 3;
	id = 1355;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",28,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1355;
};


func void rtn_start_1355()
{
	ta_sleep(2,5,7,30,"PSI_19_HUT_IN");
	ta_smalltalk(7,30,2,5,"PSI_TEACH_1");
};

func void rtn_ritual_1355()
{
	ta_stay(8,0,13,0,"PSI_CEREMONY_NEW3");
	ta_stay(13,0,8,0,"PSI_CEREMONY_NEW3");
};

