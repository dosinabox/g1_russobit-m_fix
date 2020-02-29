
instance GRD_272_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 272;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",4,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	EquipItem(self,itrw_crossbow_01);
	daily_routine = rtn_start_272;
};


func void rtn_start_272()
{
	ta_guard(0,0,12,0,"OM_203");
	ta_guard(12,0,24,0,"OM_203");
};

