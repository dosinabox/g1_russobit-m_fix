
instance PC_PSIONIC(NPC_DEFAULT)
{
	name[0] = "Лестер";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_NOV;
	level = 999;
	voice = 5;
	id = 4;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	protection[PROT_FIRE] = 1000;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Bald",17,2,nov_armor_m);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,streitschlichter);
	CreateInvItem(self,itfosoup);
	daily_routine = rtn_start_4;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;
};


func void rtn_start_4()
{
	ta_smalltalk(8,0,23,0,"PSI_GUARD_TREE_EX");
	ta_smalltalk(23,0,8,0,"PSI_GUARD_TREE_EX");
};

func void rtn_fortresswait_4()
{
	ta_stay(0,0,23,0,"LOCATION_19_01");
	ta_stay(23,0,24,0,"LOCATION_19_01");
};

func void rtn_fortressfollow_4()
{
	ta_followpc(0,0,23,0,"LOCATION_19_01");
	ta_followpc(23,0,24,0,"LOCATION_19_01");
};

func void rtn_balkon_4()
{
	ta_stay(0,0,23,0,"LOCATION_19_03_SECOND_ETAGE_BALCON");
	ta_stay(23,0,24,0,"LOCATION_19_03_SECOND_ETAGE_BALCON");
};

func void rtn_waitatfocus_4()
{
	ta_stay(0,0,23,0,"LOCATION_19_03_PATH_RUIN7");
	ta_stay(23,0,24,0,"LOCATION_19_03_PATH_RUIN7");
};

func void rtn_book_4()
{
	ta_readbook(0,0,23,0,"LOCATION_19_03_ROOM6_BARRELCHAMBER");
	ta_readbook(23,0,24,0,"LOCATION_19_03_ROOM6_BARRELCHAMBER");
};

func void rtn_guidetosmith_4()
{
	ta_guidepc(8,0,23,0,"PSI_SMITH_IN");
	ta_guidepc(23,0,8,0,"PSI_SMITH_IN");
};

func void rtn_guidetotempel_4()
{
	ta_guidepc(8,0,23,0,"PSI_TEMPLE_NOVIZE_PR");
	ta_guidepc(23,0,8,0,"PSI_TEMPLE_NOVIZE_PR");
};

func void rtn_guidetotrain_4()
{
	ta_guidepc(8,0,23,0,"PSI_PATH_9_4");
	ta_guidepc(23,0,8,0,"PSI_PATH_9_4");
};

func void rtn_guidetoherb_4()
{
	ta_guidepc(8,0,23,0,"PSI_WALK_06");
	ta_guidepc(23,0,8,0,"PSI_WALK_06");
};

