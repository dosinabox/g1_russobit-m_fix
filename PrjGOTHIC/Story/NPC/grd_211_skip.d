
instance GRD_211_SKIP(NPC_DEFAULT)
{
	name[0] = "Скип";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 12;
	id = 211;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	//EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,tr_m_skip);
	CreateInvItems(self,itminugget,400);
	daily_routine = rtn_start_211;
};


func void rtn_start_211()
{
	ta_sleep(0,0,7,0,"OCC_MERCS_UPPER_LEFT_ROOM_BED4");
	ta_stand(7,0,23,0,"OCC_STABLE_BACK");
	ta_standaround(23,0,1,0,"OCC_WELL_RIGHT_MOVEMENT");
};

func void rtn_remove_211()
{
	ta_stay(23,0,7,45,"WP_INTRO01");
	ta_stay(7,45,23,0,"WP_INTRO01");
};

instance GRD_599_SKIP(NPC_DEFAULT)
{
	name[0] = "Скип";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 12;
	id = 599;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,tr_m_skip);
	CreateInvItems(self,itminugget,116);
	daily_routine = rtn_start_599;
};


func void rtn_start_599()
{
	ta_standaround(7,0,20,0,"OCC_STABLE_BACK");
	ta_standaround(20,0,7,0,"OCC_STABLE_BACK");
};

