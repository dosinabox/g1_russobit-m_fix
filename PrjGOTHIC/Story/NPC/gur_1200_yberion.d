
instance GUR_1200_YBERION(NPC_DEFAULT)
{
	name[0] = "ёберион";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	voice = 12;
	id = 1200;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	//Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",83,0,gur_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrunepyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	CreateInvItem(self,itmi_amulet_psi_01);
	CreateInvItem(self,itke_yberion);
	daily_routine = rtn_start_1200;
};


func void rtn_start_1200()
{
	ta_sitaround(5,0,1,0,"PSI_TEMPLE_SITTING_PRIEST");
	ta_readbook(1,0,5,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_callsleeper_1200()
{
	ta_stay(23,0,21,0,"PSI_TEMPLE_STAIRS_02");
	ta_stay(21,0,23,0,"PSI_TEMPLE_STAIRS_02");
};

func void rtn_dead_1200()
{
	ta_sleep_yberion(23,0,21,0,"PSI_TEST");
	ta_sleep_yberion(21,0,23,0,"PSI_TEST");
};

