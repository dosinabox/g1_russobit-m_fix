
instance NOV_1343_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 9;
	voice = 5;
	id = 1343;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	daily_routine = rtn_start_1343;
};


func void rtn_start_1343()
{
	ta_meditate(6,27,23,52,"PSI_TEMPLE_COURT_3_MOVEMENT");
	ta_sleep(23,52,6,27,"PSI_14_HUT_IN");
};

func void rtn_ritual_1343()
{
	ta_stay(0,0,8,0,"PSI_TEMPLE_NOVIZE_PR");
	ta_stay(8,0,24,0,"PSI_TEMPLE_NOVIZE_PR");
};

