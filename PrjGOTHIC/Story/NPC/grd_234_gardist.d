
instance GRD_234_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 234;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",3,2,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_234;
};


func void rtn_start_234()
{
	ta_guard(21,0,6,0,"OM_CAVE1_85");
	ta_guard(6,0,21,0,"OM_CAVE1_85");
};

