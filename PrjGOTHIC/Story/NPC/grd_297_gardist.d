
instance GRD_297_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	guild = GIL_GRD;
	npctype = NPCTYPE_GUARD;
	level = 20;
	voice = 7;
	id = 297;
	aivar[43] = TRUE;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itambolt,30);
	EquipItem(self,itrw_crossbow_01);
	daily_routine = rtn_fmstart_297;
};


func void rtn_fmstart_297()
{
	ta_guardpalisade(0,0,13,0,"FM_14");
	ta_guardpalisade(13,0,0,0,"FM_14");
};

