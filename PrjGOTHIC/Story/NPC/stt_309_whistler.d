
instance STT_309_WHISTLER(NPC_DEFAULT)
{
	name[0] = "Уистлер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 5;
	voice = 11;
	id = 309;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",97,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_02);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,10);
	CreateInvItems(self,itkelockpick,2);
	daily_routine = rtn_start_309;
};


func void rtn_start_309()
{
	ta_sleep(23,30,8,0,"OCR_HUT_65");
	ta_sitaround(8,0,11,30,"OCR_OUTSIDE_HUT_65");
	ta_repairhut(11,30,13,0,"OCR_OUTSIDE_HUT_65");
	ta_sitaround(13,0,23,30,"OCR_OUTSIDE_HUT_65");
};

