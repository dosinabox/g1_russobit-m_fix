
instance GRD_298_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	guild = GIL_GRD;
	npctype = NPCTYPE_GUARD;
	level = 30;
	voice = 6;
	id = 298;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",1,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_02);
	CreateInvItems(self,itambolt,45);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	EquipItem(self,itrw_crossbow_01);
	daily_routine = rtn_fmstart_298;
};


func void rtn_fmstart_298()
{
	ta_guardpalisade(0,0,13,0,"FM_07");
	ta_guardpalisade(13,0,0,0,"FM_07");
};

