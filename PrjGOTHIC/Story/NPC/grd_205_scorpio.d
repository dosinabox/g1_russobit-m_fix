
instance GRD_205_SCORPIO(NPC_DEFAULT)
{
	name[0] = "Скорпио";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 205;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",18,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	//EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,tr_m_scorpio);
	EquipItem(self,itrw_scorpio_crossbow);
	CreateInvItems(self,itambolt,45);
	CreateInvItems(self,itminugget,200);
	CreateInvItems(self,itfo_potion_health_02,5);
	daily_routine = rtn_start_205;
};


func void rtn_start_205()
{
	ta_boss(7,25,15,0,"OCC_CENTER_4");
	ta_practicebow(15,0,20,0,"OCC_RUIN_PRACTICE_LEADER");
	ta_smalltalk(20,0,1,0,"OCC_STABLE_ENTRANCE_INSERT");
	ta_sleep(1,0,7,25,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
};

func void rtn_bannished_205()
{
	ta_stay(7,0,20,0,"OW_CAVALORN_01");
	ta_stay(20,0,7,0,"OW_CAVALORN_01");
};

