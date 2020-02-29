
instance GRD_203_BULLIT(NPC_DEFAULT)
{
	name[0] = "Буллит";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 203;
	attribute[ATR_STRENGTH] = 42;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Thief",57,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_long_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,25);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_203;
	fight_tactic = FAI_HUMAN_STRONG;
};


func void rtn_start_203()
{
	ta_sitaround(0,0,21,0,"OCC_MERCS_RIGHT_ROOM_BACK");
	ta_sitaround(21,0,24,0,"OCC_MERCS_RIGHT_ROOM_BACK");
};

func void rtn_ot_203()
{
	ta_guard(7,0,20,0,"OCC_MERCS_DOWNSTAIRS_2");
	ta_guard(20,0,7,0,"OCC_MERCS_DOWNSTAIRS_2");
};

