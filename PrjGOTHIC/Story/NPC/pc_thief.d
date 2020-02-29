
instance PC_THIEF(NPC_DEFAULT)
{
	name[0] = "Диего";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_STT;
	level = 999;
	voice = 11;
	id = 1;
	flags = NPC_FLAG_IMMORTAL;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",15,4,stt_armor_h);
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	protection[PROT_FIRE] = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,diegos_bogen);
	EquipItem(self,itmw_1h_sword_04);
	CreateInvItems(self,itamarrow,100);
	daily_routine = rtn_prestart_1;
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_IMPORTANT] = TRUE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_prestart_1()
{
	ta_position(0,0,12,0,"WP_INTRO_FALL3");
	ta_position(12,0,0,0,"WP_INTRO_FALL3");
};

func void rtn_start_1()
{
	ta_sleep(23,0,7,0,"OCR_HUT_1");
	//ta_sitaround(3,0,5,30,"OCR_HUT_Z5_SIT3");
	//ta_sleep(5,30,7,0,"OCR_HUT_1");
	ta_sitaround(7,0,10,0,"OCR_CAULDRON_1");
	ta_smalltalk(10,0,12,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	ta_sitaround(12,0,16,0,"OCR_CAULDRON_1");
	ta_smalltalk(16,0,18,0,"OCR_CAMPFIRE_A_MOVEMENT3");
	ta_sitcampfire(18,0,23,0,"OCR_CAMPFIRE_A_MOVEMENT1");
};

func void rtn_ocwait_1()
{
	ta_stay(0,0,12,0,"OC_ROUND_13");
	ta_stay(12,0,0,0,"OC_ROUND_13");
};

func void rtn_trollwait_1()
{
	ta_stay(0,0,23,0,"OW_PATH_190");
	ta_stay(23,0,0,0,"OW_PATH_190");
};

func void rtn_guidetroll_1()
{
	ta_guidepc(0,0,12,0,"LOCATION_12_01");
	ta_guidepc(12,0,0,0,"LOCATION_12_01");
};

func void rtn_waitatwheel_1()
{
	ta_stay(0,0,12,0,"LOCATION_12_14_WHEEL");
	ta_stay(12,0,24,0,"LOCATION_12_14_WHEEL");
};

func void rtn_waitatfocus_1()
{
	ta_guidepc(0,0,12,0,"LOCATION_12_03");
	ta_guidepc(12,0,24,0,"LOCATION_12_03");
};

func void rtn_omfull_1()
{
};

func void rtn_fmtaken_1()
{
};

func void rtn_orcassault_1()
{
};

func void rtn_reunion_1()
{
	ta_guard(8,0,16,5,"LOCATION_02_03");
	ta_sleep(16,5,0,5,"LOCATION_02_07");
	ta_sitaround(0,5,8,0,"LOCATION_02_04");
};

