
instance STT_315_SLY(NPC_DEFAULT)
{
	name[0] = "Слай";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 315;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",55,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_02);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,16);
	CreateInvItems(self,itkelockpick,2);
	daily_routine = rtn_start_315;
};


func void rtn_start_315()
{
	ta_sleep(0,0,7,0,"OCR_HUT_73");
	ta_boss(7,0,7,30,"OCR_OUTSIDE_HUT_73");
	ta_smalltalk(7,30,12,0,"OCR_OUTSIDE_HUT_73");
	ta_sitaround(12,0,0,0,"OCR_OUTSIDE_HUT_73");
};

