
instance GUR_1202_CORANGAR(NPC_DEFAULT)
{
	name[0] = "Кор Ангар";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_TPL;
	level = 50;
	flags = NPC_FLAG_IMMORTAL;
	voice = 8;
	id = 1202;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_Bald",11,0,tpl_armor_h);
	b_scale(self);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrune_5_2_sleep);
	CreateInvItem(self,roter_wind);
	CreateInvItem(self,itmi_amulet_psi_01);
	daily_routine = rtn_start_1202;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1202()
{
	ta_sleep(1,0,5,0,"PSI_17_HUT_IN");
	ta_boss(5,0,1,0,"PSI_TRAINING_TEACHER");
};

func void rtn_callsleeper_1202()
{
	ta_stay(23,0,21,0,"PSI_TEMPLE_STAIRS_LEFT");
	ta_stay(21,0,23,0,"PSI_TEMPLE_STAIRS_LEFT");
};

func void rtn_care_1202()
{
	ta_guard(23,0,21,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_guard(21,0,23,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_after_1202()
{
	ta_meditate_corangar(23,0,21,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_meditate_corangar(21,0,23,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_wait_1202()
{
	ta_stay(1,0,5,0,"PSI_TEMPLE_ROOMS_04");
	ta_stay(5,0,1,0,"PSI_TEMPLE_ROOMS_04");
};

func void rtn_guru_1202()
{
	ta_readbook(8,0,13,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_sitaround(13,0,19,0,"PSI_TEMPLE_SITTING_PRIEST");
	ta_stay(19,0,22,0,"PSI_TEMPLE_STAIRS_02");
	ta_sitaround(22,0,8,0,"PSI_TEMPLE_ROOMS_IN_02");
};

