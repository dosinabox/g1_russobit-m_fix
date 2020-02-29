
instance STT_331_FINGERS(NPC_DEFAULT)
{
	name[0] = "Фингерс";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 7;
	voice = 5;
	id = 331;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 28;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",56,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,18);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itfobeer,2);
	daily_routine = rtn_start_331;
};


func void rtn_start_331()
{
	ta_sleep(23,0,7,0,"OCR_HUT_20");
	ta_boss(7,0,23,0,"OCR_OUTSIDE_HUT_20");
};

