
instance NOV_1306_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 9;
	voice = 2;
	id = 1306;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",23,3,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_axe_old_01);
	daily_routine = rtn_start_1306;
};


func void rtn_start_1306()
{
	ta_sitcampfire(8,0,1,0,"PSI_PATH_1_3");
	ta_sleep(1,0,8,0,"PSI_1_HUT_IN");
};

