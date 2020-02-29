
instance GUR_1202_CORANGAR(NPC_DEFAULT)
{
	name[0] = "Кор Ангар";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_TPL;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	voice = 8;
	id = 1202;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_Bald",11,0,tpl_armor_h);
	b_scale(self);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itarrunesleep);
	CreateInvItem(self,roter_wind);
	daily_routine = rtn_start_1202;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1202()
{
	ta_sleep(1,0,5,0,"PSI_17_HUT_IN");
	ta_teaching(5,0,1,0,"PSI_TRAINING_TEACHER");
};

func void rtn_callsleeper_1202()
{
	ta_stay(23,0,21,0,"PSI_TEMPLE_STAIRS_LEFT");
	ta_stay(21,0,23,0,"PSI_TEMPLE_STAIRS_LEFT");
};

