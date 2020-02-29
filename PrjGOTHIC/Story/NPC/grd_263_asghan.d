
instance GRD_263_ASGHAN(NPC_DEFAULT)
{
	name[0] = "¿Ò„ı‡Ì";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 263;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",15,1,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfomutton);
	CreateInvItems(self,itminugget,20);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_263;
	npc_setpermattitude(self,ATT_NEUTRAL);
};


func void rtn_start_263()
{
	ta_stay(0,0,12,0,"OM_CAVE3_21");
	ta_stay(12,0,24,0,"OM_CAVE3_21");
};

func void rtn_opengate_263()
{
	ta_stay(0,0,12,0,"OM_CAVE3_18");
	ta_stay(12,0,24,0,"OM_CAVE3_18");
};

