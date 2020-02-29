
instance GRD_210_SCATTY(NPC_DEFAULT)
{
	name[0] = "Скатти";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 15;
	voice = 1;
	id = 210;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,2,stt_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,2);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_210;
};


func void rtn_start_210()
{
	ta_sleep(0,0,8,0,"OCR_HUT_19");
	ta_sitaround(8,0,10,0,"OCR_ARENABATTLE_BENCH");
	ta_smalltalk(10,0,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_stand(16,0,18,45,"OCR_STAND_WETT");
	ta_sitaround(18,45,23,0,"OCR_ARENA_BARONS_HUT_ROOFTOP");
	ta_sitaround(23,0,0,0,"OCR_ARENABATTLE_BENCH");
};

