
instance TPL_1422_GORHANIS(NPC_DEFAULT)
{
	name[0] = "Гор Ханис";
	npctype = NPCTYPE_MAIN;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_NONE;
	level = 20;
	voice = 8;
	id = 1422;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	//EquipItem(self,itmw_2h_sword_light_01);
	EquipItem(self,itmw_gorhanis);
	EquipItem(self,itmi_amulet_psi_01);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	CreateInvItems(self,itfo_potion_health_01,10);
	//CreateInvItem(self,itmi_stuff_oldcoin_01);
	daily_routine = rtn_start_1422;
};


func void rtn_start_1422()
{
	ta_sleep(23,45,7,45,"OCR_HUT_32");
	ta_standaround(7,45,10,5,"OCR_CAMPFIRE_I_1");
	ta_smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_practicesword(16,0,17,15,"OCR_ARENABATTLE");
	ta_sitcampfire(17,15,19,0,"OCR_CAMPFIRE_I_1");
	ta_boss(19,0,20,18,"OCR_ARENABATTLE_TRAIN");
	ta_arenafight(20,18,21,38,"OCR_ARENABATTLE_TRAIN");
	ta_boss(21,38,21,40,"OCR_ARENABATTLE_TRAIN");
	ta_arenafight(21,40,22,58,"OCR_ARENABATTLE_TRAIN");
	ta_boss(22,58,23,0,"OCR_ARENABATTLE_TRAIN");
	ta_sitcampfire(23,0,23,45,"OCR_CAMPFIRE_I_1");
};

func void rtn_guide_1422()
{
	ta_guidepc(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	ta_guidepc(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_1422()
{
	ta_sleep(23,45,7,45,"OCR_HUT_32");
	ta_standaround(7,45,10,5,"OCR_CAMPFIRE_I_1");
	ta_smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_standaround(16,0,17,15,"OCR_CAMPFIRE_I_1");
	ta_sitcampfire(17,15,23,45,"OCR_CAMPFIRE_I_1");
};

func void rtn_dead_1422()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_3");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_3");
};

func void rtn_wait_1422()
{
	ta_boss(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	ta_boss(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

