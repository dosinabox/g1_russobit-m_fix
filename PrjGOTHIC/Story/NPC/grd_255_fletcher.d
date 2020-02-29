
instance GRD_255_FLETCHER(NPC_DEFAULT)
{
	name[0] = "Ôכועקונ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 255;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",1,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
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
	daily_routine = rtn_start_255;
};


func void rtn_start_255()
{
	ta_guard(6,0,7,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(7,0,8,0,"OCR_LADDER_TOP_01");
	ta_guard(8,0,9,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(9,0,10,0,"OCR_BEHIND_HUT_17");
	ta_guard(10,0,11,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(11,0,12,0,"OCR_LADDER_TOP_01");
	ta_guard(12,0,13,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(13,0,14,0,"OCR_BEHIND_HUT_17");
	ta_guard(14,0,15,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(15,0,16,0,"OCR_LADDER_TOP_01");
	ta_guard(16,0,17,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(17,0,18,0,"OCR_BEHIND_HUT_17");
	ta_guard(18,0,19,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(19,0,20,0,"OCR_LADDER_TOP_01");
	ta_guard(20,0,21,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(21,0,22,0,"OCR_BEHIND_HUT_17");
	ta_guard(22,0,23,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(23,0,0,0,"OCR_LADDER_TOP_01");
	ta_guard(0,0,1,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(1,0,2,0,"OCR_BEHIND_HUT_17");
	ta_guard(2,0,3,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(3,0,4,0,"OCR_LADDER_TOP_01");
	ta_guard(4,0,5,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	ta_guard(5,0,6,0,"OCR_BEHIND_HUT_17");
};

func void rtn_fmtaken_255()
{
	ta_stayneutral(7,0,20,0,"OC1");
	ta_stayneutral(20,0,7,0,"OC1");
};

func void rtn_fmtaken2_255()
{
	ta_stay(7,0,20,0,"OC1");
	ta_stay(20,0,7,0,"OC1");
};

