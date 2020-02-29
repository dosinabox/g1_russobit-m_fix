
instance GUR_1203_BAALTONDRAL(NPC_DEFAULT)
{
	name[0] = "Идол Тондрал";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 13;
	id = 1203;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",24,2,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrune_5_5_windfist);
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = rtn_start_1203;
};


func void rtn_start_1203()
{
	ta_sleep(23,0,7,45,"PSI_28_HUT_IN");
	ta_teaching(7,45,23,0,"PSI_PLATFORM_TEACHER");
};

func void rtn_ch3_1203()
{
	ta_sleep(23,30,8,0,"PSI_28_HUT_IN");
	ta_stay(8,0,12,0,"PSI_TRAINING_2");
	ta_smalltalk(12,0,23,30,"PSI_TEACH_CADAR");
};

