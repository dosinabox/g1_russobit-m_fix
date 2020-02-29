
instance NON_1500_GILBERT(NPC_DEFAULT)
{
	name[0] = "Гилберт";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 4;
	id = 1500;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA] = 0;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_HITPOINTS] = 148;
	attribute[ATR_HITPOINTS_MAX] = 148;
	protection[PROT_FLY] = 9999;
	protection[PROT_FALL] = 9999;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Thief",16,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItem(self,itke_gilbert);
	daily_routine = rtn_start_1500;
};


func void rtn_start_1500()
{
	ta_standaround(22,0,5,0,"LOCATION_01_07");
	ta_standaround(5,0,22,0,"LOCATION_01_07");
};

func void rtn_start2_1500()
{
	ta_sleep(22,0,8,0,"LOCATION_01_07");
	ta_sit(8,0,22,0,"LOCATION_01_07");
};

func void rtn_hide_1500()
{
	ta_sit(22,0,8,0,"FMC_HUT02_IN");
	ta_sit(8,0,22,0,"FMC_HUT02_IN");
};

