
instance GUR_1204_BAALNAMIB(NPC_DEFAULT)
{
	name[0] = "Идол Намиб";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 29;
	flags = NPC_FLAG_IMMORTAL;
	voice = 2;
	id = 1204;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrune_5_2_sleep);
	EquipItem(self,namibs_keule);
	daily_routine = rtn_start_1204;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1204()
{
	ta_smalltalk(8,0,20,0,"PSI_PATH_1");
	ta_smalltalk(20,0,8,0,"PSI_PATH_1");
};

func void rtn_startch2_1204()
{
	ta_smalltalk(8,0,23,0,"PSI_PATH_1");
	ta_sleep(23,0,8,0,"PSI_GUARD_TREE_IN");
};

func void rtn_wait_1204()
{
	ta_stay(8,0,20,0,"PSI_TEMPLE_IN_1");
	ta_stay(20,0,8,0,"PSI_TEMPLE_IN_1");
};

func void rtn_yberion_1204()
{
	ta_sitaround(8,0,13,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_readbook(13,0,8,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_ritual_1204()
{
	ta_stay(8,0,13,0,"PSI_CEREMONY_NEW6");
	ta_stay(13,0,8,0,"PSI_CEREMONY_NEW6");
};

