
instance PC_MAGE(NPC_DEFAULT)
{
	name[0] = "Мильтен";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_KDF;
	level = 999;
	voice = 2;
	id = 2;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 150;
	attribute[ATR_MANA] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_FIRE] = 1000;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",76,1,kdf_armor_l);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,3);
	CreateInvItem(self,itarrunefireball);
	CreateInvItems(self,itfowine,3);
	CreateInvItems(self,itfo_potion_health_02,3);
	CreateInvItems(self,itfo_potion_mana_02,10);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	daily_routine = rtn_start_2;
};


func void rtn_start_2()
{
	ta_sleep(0,0,8,0,"OCC_CHAPEL_LEFT_ROOM");
	ta_stand(8,0,0,0,"OCC_CHAPEL_ENTRANCE");
};

func void rtn_shwait_2()
{
	ta_stay(0,0,23,0,"OW_PATH_274");
	ta_stay(23,0,24,0,"OW_PATH_274");
};

func void rtn_shguide_2()
{
	ta_guidepc(0,0,23,0,"OW_PATH_3_STONES");
	ta_guidepc(23,0,24,0,"OW_PATH_3_STONES");
};

func void rtn_shfollow_2()
{
	ta_followpc(0,0,23,0,"OW_PATH_3_STONES");
	ta_followpc(23,0,24,0,"OW_PATH_3_STONES");
};

func void rtn_returntooc_2()
{
	ta_sitaround(0,0,12,0,"LOCATION_02_04");
	ta_sitaround(12,0,24,0,"LOCATION_02_04");
};

func void rtn_ocwait_2()
{
	ta_stay(0,0,12,0,"PATH_OC_NC");
	ta_stay(12,0,24,0,"PATH_OC_NC");
};

func void rtn_lswait_2()
{
	ta_stay(0,0,12,0,"NC_KDW_CAVE_STAIRS");
	ta_stay(12,0,24,0,"NC_KDW_CAVE_STAIRS");
};

func void rtn_lsaway_2()
{
	ta_guidepc(0,0,12,0,"NC_KDW04_IN");
	ta_guidepc(12,0,24,0,"NC_KDW04_IN");
};

func void rtn_lsoreheap_2()
{
	ta_guidepc(0,0,12,0,"NC_PATH34");
	ta_guidepc(12,0,24,0,"NC_PATH34");
};

func void rtn_lsoreheap_justincase_2()
{
	ta_stay(0,0,12,0,"NC_PATH35");
	ta_stay(12,0,24,0,"NC_PATH35");
};

func void rtn_lsoreheap2_2()
{
	ta_guidepc(0,0,12,0,"NC_PATH41");
	ta_guidepc(12,0,24,0,"NC_PATH41");
};

func void rtn_reunion_2()
{
	ta_sleep(0,5,8,5,"LOCATION_02_07");
	ta_smalltalk(8,5,16,5,"LOCATION_02_04");
	ta_sitaround(16,5,20,5,"LOCATION_02_05");
	ta_practicemagic(20,5,0,5,"LOCATION_02_08");
};
