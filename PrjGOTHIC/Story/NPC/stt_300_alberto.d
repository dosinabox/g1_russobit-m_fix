
instance STT_300_ALBERTO(NPC_DEFAULT)
{
	name[0] = "Альберто";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 13;
	voice = 12;
	id = 300;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 196;
	attribute[ATR_HITPOINTS] = 196;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",55,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	b_give_albertochapter1crap();
	EquipItem(self,itmw_1h_sword_01);
	EquipItem(self,itrw_bow_small_04);
	daily_routine = rtn_start_300;
};


func void rtn_start_300()
{
	ta_stay(0,0,18,0,"OM_203");
	ta_stay(18,3,0,0,"OM_203");
};

