
instance ORG_860_RENYU(NPC_DEFAULT)
{
	name[0] = "Πενθ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 8;
	voice = 14;
	id = 860;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itminugget,40);
	CreateInvItems(self,itfo_potion_health_01,2);
	EquipItem(self,itmw_1h_mace_03);
	daily_routine = rtn_start_860;
};


func void rtn_start_860()
{
	ta_smoke(0,0,8,0,"LOCATION_23_CAVE_1_IN");
	ta_smoke(8,0,24,0,"LOCATION_23_CAVE_1_IN");
};

func void rtn_arbeitslos_860()
{
	ta_standaround(20,0,8,0,"LOCATION_11_08");
	ta_standaround(8,0,20,0,"LOCATION_11_08");
};

