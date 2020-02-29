
instance PC_FIGHTER(NPC_DEFAULT)
{
	name[0] = "Горн";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_SLD;
	level = 999;
	voice = 9;
	id = 3;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 22;
	attribute[ATR_HITPOINTS] = 22;
	protection[PROT_FIRE] = 1000;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,sld_armor_m);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IMPORTANT] = TRUE;
	EquipItem(self,gorns_rache);
	b_give_gornchapter1crap();
	daily_routine = rtn_start_3;
};


func void rtn_start_3()
{
	ta_standaround(8,0,1,0,"NC_PLACE03_MOVEMENT2");
	ta_sleep(1,0,8,0,"NC_HUT06_IN");
};

func void rtn_ncwait_3()
{
	ta_stay(0,0,23,0,"NC_PATH52");
	ta_stay(23,0,24,0,"NC_PATH52");
};

func void rtn_ruinwait_3()
{
	ta_stay(0,0,23,0,"OW_PATH_ABYSS_4");
	ta_stay(23,0,24,0,"OW_PATH_ABYSS_4");
};

func void rtn_ruinabyss_3()
{
	ta_guidepc(0,0,23,0,"OW_ABYSS_TO_CAVE_MOVE6");
	ta_guidepc(23,0,24,0,"OW_ABYSS_TO_CAVE_MOVE6");
};

func void rtn_ruinfollow_3()
{
	ta_followpc(0,0,23,0,"OW_PATH_175_GATE1");
	ta_followpc(23,0,24,0,"OW_PATH_175_GATE1");
};

func void rtn_ruinwall_3()
{
	ta_stay(0,0,23,0,"OW_PATH_175_GATE1");
	ta_stay(23,0,24,0,"OW_PATH_175_GATE1");
};

func void rtn_ruinfollowinside_3()
{
	ta_followpc(0,0,23,0,"OW_PATH_176");
	ta_followpc(23,0,24,0,"OW_PATH_176");
};

func void rtn_ruinstay_3()
{
	ta_stay(0,0,23,0,"OW_PATH_176");
	ta_stay(23,0,24,0,"OW_PATH_176");
};

func void rtn_ruinyard_3()
{
	ta_followpc(0,0,23,0,"OW_PATH_176");
	ta_followpc(23,0,24,0,"OW_PATH_176");
};

func void rtn_ncreport_3()
{
	ta_stay(0,0,23,0,"NC_KDW_CAVE_CENTER");
	ta_stay(23,0,24,0,"NC_KDW_CAVE_CENTER");
};

func void rtn_guardnc_3()
{
	ta_stay(0,0,23,0,"OW_PATH_075_GUARD4");
	ta_stay(23,0,24,0,"OW_PATH_075_GUARD4");
};

func void rtn_followtofmc_3()
{
	ta_followpc(0,0,23,0,"FMC_ENTRANCE");
	ta_followpc(23,0,24,0,"FMC_ENTRANCE");
};

func void rtn_waitfmc_3()
{
	ta_stay(0,0,23,0,"FMC_ENTRANCE");
	ta_stay(23,0,24,0,"FMC_ENTRANCE");
};

func void rtn_waitfm_3()
{
	ta_stay(0,0,23,0,"FMC_FM_ENTRANCE");
	ta_stay(23,0,24,0,"FMC_FM_ENTRANCE");
};


func void rtn_reunion_3()
{
	ta_guard(0,0,8,5,"LOCATION_02_03");
	ta_sleep(8,5,16,5,"LOCATION_02_07");
	ta_practicesword(16,5,20,5,"LOCATION_02_04");
	ta_sitaround(20,5,0,0,"LOCATION_02_04");
};


instance PC_FIGHTERFM(NPC_DEFAULT)
{
	name[0] = "Горн";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_SLD;
	level = 15;
	voice = 9;
	id = 5;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 22;
	attribute[ATR_HITPOINTS] = 22;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,sld_armor_m);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IMPORTANT] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	daily_routine = rtn_follow_5;
	EquipItem(self,gorns_rache);
	CreateInvItems(self,itfowine,5);
	CreateInvItems(self,itfo_potion_health_03,10);
	CreateInvItems(self,itfo_potion_mana_01,5);
};


func void rtn_follow_5()
{
	ta_followpc(0,0,23,0,"FM_02");
	ta_followpc(23,0,24,0,"FM_02");
};

func void rtn_wait_5()
{
	ta_stay(0,0,23,0,"FM_02");
	ta_stay(23,0,24,0,"FM_02");
};

func void rtn_remove_5()
{
	ta_stay(0,0,23,0,"NOWHERE");
	ta_stay(23,0,24,0,"NOWHERE");
};

