
instance NOV_1336_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1336;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 7;
	attribute[ATR_MANA] = 7;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",28,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1336;
};


func void rtn_start_1336()
{
	ta_sleep(2,0,8,0,"PSI_24_HUT_IN_BED");
	ta_listen(8,0,2,0,"PSI_TEACH_CADAR");
};

