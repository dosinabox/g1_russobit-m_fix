
instance GRD_283_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	guild = GIL_GRD;
	npctype = NPCTYPE_GUARD;
	level = 30;
	voice = 14;
	id = 283;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",13,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_broad_04);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,15);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_fmtaken_283;
};


func void rtn_fmtaken_283()
{
	ta_stayneutral(1,0,13,0,"FMC_PATH27");
	ta_stayneutral(13,0,1,0,"FMC_PATH27");
};

func void rtn_fmtaken2_283()
{
	ta_stay(1,0,13,0,"FMC_PATH27");
	ta_stay(13,0,1,0,"FMC_PATH27");
};

