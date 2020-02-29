
instance STT_329_DEXTER(NPC_DEFAULT)
{
	name[0] = "Декстер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 7;
	voice = 10;
	id = 329;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",58,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_03);
	CreateInvItems(self,itamarrow,15);
	CreateInvItem(self,itwrworldmap);
	CreateInvItems(self,itkelockpick,20);
	CreateInvItems(self,itminugget,200);
	CreateInvItems(self,itmijoint_1,23);
	CreateInvItems(self,itmijoint_2,15);
	CreateInvItems(self,itmijoint_3,8);
	CreateInvItems(self,itfo_potion_health_01,10);
	CreateInvItems(self,itfo_potion_health_02,5);
	CreateInvItems(self,itfo_potion_mana_01,8);
	daily_routine = rtn_start_329;
};


func void rtn_start_329()
{
	ta_sleep(23,30,7,30,"OCR_HUT_55");
	ta_boss(7,30,8,0,"OCR_OUTSIDE_HUT_55");
	ta_washself(8,0,8,15,"OCR_WASH_8");
	ta_sitaround(8,15,11,0,"OCR_OUTSIDE_HUT_55");
	ta_smalltalk(11,0,17,0,"OCR_OUTSIDE_HUT_47_SMALT1");
	ta_standaround(17,0,23,30,"OCR_MARKETPLACE_SCAVENGER");
};

