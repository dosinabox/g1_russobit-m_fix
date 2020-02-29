
instance GRD_271_ULBERT(NPC_DEFAULT)
{
	name[0] = "׃כüבונע";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 271;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",100,3,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	EquipItem(self,itrw_crossbow_01);
	fight_tactic = FAI_HUMAN_STRONG;
	daily_routine = rtn_start_271;
};


func void rtn_start_271()
{
	ta_guard(0,0,12,0,"OM_014B");
	ta_guard(12,0,24,0,"OM_014B");
};

func void rtn_away_271()
{
	ta_guard(0,0,12,0,"OM_CAVE1_49");
	ta_guard(12,0,24,0,"OM_CAVE1_49");
};

