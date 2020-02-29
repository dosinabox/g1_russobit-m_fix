
instance STT_311_FISK(NPC_DEFAULT)
{
	name[0] = "Фиск";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 7;
	voice = 12;
	id = 311;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Bald",10,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,tr_m_fisk);
	b_give_fiskchapter1weapons();
	CreateInvItems(self,itkelockpick,10);
	daily_routine = rtn_start_311;
};


func void rtn_start_311()
{
	ta_sleep(22,30,7,30,"OCR_HUT_49");
	ta_sitaround(7,30,22,30,"OCR_OUTSIDE_HUT_49");
};

func void rtn_flee_311()
{
	ta_stay(23,0,7,45,"WP_INTRO01");
	ta_stay(7,45,23,0,"WP_INTRO01");
};

