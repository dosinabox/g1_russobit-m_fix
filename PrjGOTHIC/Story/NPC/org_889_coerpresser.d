
instance ORG_889_COERPRESSER(NPC_DEFAULT)
{
	name[0] = "Разбойник";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NONE;
	level = 11;
	voice = 7;
	id = 889;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",9,1,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,12);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itfoloaf);
	EquipItem(self,itmw_1h_mace_war_01);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_889;
};


func void rtn_start_889()
{
	ta_sitaround(22,0,6,0,"OW_PATH_056");
	ta_sitaround(6,0,22,0,"OW_PATH_056");
};

