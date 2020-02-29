
instance STT_302_VIPER(NPC_DEFAULT)
{
	name[0] = "Βΰιοεπ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 7;
	voice = 11;
	id = 302;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_Body_CookSmith",1,1,"Hum_Head_Pony",58,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	CreateInvItems(self,itminugget,750);
	CreateInvItem(self,itmw_1h_sword_short_04);
	daily_routine = rtn_start_302;
};


func void rtn_start_302()
{
	ta_minebellows(8,0,18,0,"OM_CAVE1_82");
	ta_minebellows(18,0,8,0,"OM_CAVE1_82");
};

