
instance SLD_729_KHARIM(NPC_DEFAULT)
{
	name[0] = "Карим";
	npctype = NPCTYPE_MAIN;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_NONE;
	level = 11;
	voice = 9;
	id = 729;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	//EquipItem(self,itmw_1h_mace_02);
	EquipItem(self,itmw_kharim);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,19);
	CreateInvItems(self,itfo_potion_health_01,10);
	//CreateInvItem(self,itmi_stuff_oldcoin_01);
	daily_routine = rtn_start_729;
};


func void rtn_start_729()
{
	ta_sleep(0,0,7,30,"OCR_HUT_31");
	ta_standaround(7,30,11,0,"OCR_CAMPFIRE_I_2");
	ta_smith_sharp(11,0,14,0,"OCR_ARENABATTLE_ROOM_01");
	ta_practicesword(14,0,15,0,"OCR_ARENABATTLE");
	ta_standaround(15,0,17,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_sitcampfire(17,0,19,0,"OCR_CAMPFIRE_I_2");
	ta_boss(19,0,19,10,"OCR_ARENABATTLE");
	ta_arenafight(19,10,20,18,"OCR_ARENABATTLE");
	ta_boss(20,18,21,40,"OCR_ARENABATTLE");
	ta_arenafight(21,40,22,58,"OCR_ARENABATTLE");
	ta_boss(22,58,23,0,"OCR_ARENABATTLE");
	ta_sitcampfire(23,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void rtn_guide_729()
{
	ta_guidepc(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	ta_guidepc(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_729()
{
	ta_sleep(0,0,7,30,"OCR_HUT_31");
	ta_standaround(7,30,11,0,"OCR_CAMPFIRE_I_2");
	ta_smith_sharp(11,0,14,0,"OCR_ARENABATTLE_ROOM_01");
	ta_standaround(14,0,17,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_sitcampfire(17,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void rtn_dead_729()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_4");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_4");
};

func void rtn_wait_729()
{
	ta_boss(8,0,20,0,"OCR_ARENABATTLE");
	ta_boss(20,0,8,0,"OCR_ARENABATTLE");
};

