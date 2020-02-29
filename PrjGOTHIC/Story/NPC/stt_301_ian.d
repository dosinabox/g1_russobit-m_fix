
instance STT_301_IAN(NPC_DEFAULT)
{
	name[0] = "ян";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 13;
	flags = NPC_FLAG_IMMORTAL;
	voice = 13;
	id = 301;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 196;
	attribute[ATR_HITPOINTS] = 196;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",14,1,stt_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	EquipItem(self,itmw_1h_sword_04);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,25);
	CreateInvItem(self,thelist);
	daily_routine = rtn_start_301;
};


func void rtn_start_301()
{
	ta_standaround(8,0,10,0,"OM_CAVE1_47_IAN");
	ta_standaround(10,0,12,0,"OM_CAVE1_45");
	ta_standaround(12,0,14,0,"OM_CAVE1_47_IAN");
	ta_standaround(14,0,16,0,"OM_CAVE1_45");
	ta_standaround(16,0,18,0,"OM_CAVE1_47_IAN");
	ta_standaround(18,0,20,0,"OM_CAVE1_45");
	ta_standaround(20,0,22,0,"OM_CAVE1_47_IAN");
	ta_standaround(0,0,2,0,"OM_CAVE1_45");
	ta_standaround(2,0,6,0,"OM_CAVE1_47_IAN");
	ta_standaround(6,0,8,0,"OM_CAVE1_45");
};

func void rtn_kapitel2_301()
{
	ta_standaround(8,0,18,0,"OM_CAVE3_19");
	ta_standaround(18,0,8,0,"OM_CAVE3_19");
};

