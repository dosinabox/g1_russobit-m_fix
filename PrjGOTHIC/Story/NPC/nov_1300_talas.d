
instance NOV_1300_TALAS(NPC_DEFAULT)
{
	name[0] = "Талас";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_NOV;
	level = 4;
	flags = NPC_FLAG_IMMORTAL;
	voice = 2;
	id = 1300;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 78;
	attribute[ATR_HITPOINTS] = 78;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",27,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itforice,5);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,2);
	daily_routine = rtn_start_1300;
};


func void rtn_start_1300()
{
	ta_smoke(24,0,6,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
	ta_smoke(6,0,24,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
};

func void rtn_gobbocave_1300()
{
	ta_guidepc(24,0,6,0,"LOCATION_29_02");
	ta_guidepc(6,0,24,0,"LOCATION_29_02");
};

func void rtn_returntocamp_1300()
{
	ta_guidepc(24,0,6,0,"PSI_START");
	ta_guidepc(6,0,24,0,"PSI_START");
};

func void rtn_backincamp_1300()
{
	ta_smoke(24,0,6,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
	ta_smoke(6,0,24,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
};

func void rtn_ogy_1300()
{
	ta_guidepc(24,0,6,0,"OW_PATH_011");
	ta_guidepc(6,0,24,0,"OW_PATH_011");
};

func void rtn_returntocampagain_1300()
{
	ta_smoke(24,0,6,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
	ta_smoke(6,0,24,0,"PSI_PATH_TEMPLE_4_MOVEMENT");
};

