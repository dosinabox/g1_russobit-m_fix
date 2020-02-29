
instance ORG_861_KILLIAN(NPC_DEFAULT)
{
	name[0] = "Киллиан";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 8;
	voice = 13;
	id = 861;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",38,4,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,5);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itmijoint_1,15);
	CreateInvItem(self,itmistomper);
	CreateInvItems(self,itfo_potion_health_01,2);
	EquipItem(self,itmw_1h_mace_02);
	daily_routine = rtn_start_861;
};


func void rtn_start_861()
{
	ta_herbalchemy(0,0,8,0,"LOCATION_23_CAVE_1_02");
	ta_herbalchemy(8,0,24,0,"LOCATION_23_CAVE_1_02");
};

func void rtn_arbeitslos_861()
{
	ta_standaround(20,0,8,0,"LOCATION_11_08");
	ta_standaround(8,0,20,0,"LOCATION_11_08");
};

