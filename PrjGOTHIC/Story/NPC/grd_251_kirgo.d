
instance GRD_251_KIRGO(NPC_DEFAULT)
{
	name[0] = "Кирго";
	npctype = NPCTYPE_MAIN;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_NONE;
	level = 10;
	voice = 5;
	id = 251;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",2,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	//EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,itmw_kirgo);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itfo_potion_health_01,10);
	daily_routine = rtn_start_251;
};


func void rtn_start_251()
{
	ta_sleep(23,45,7,45,"OCR_HUT_21");
	ta_standaround(7,45,10,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_practicesword(10,0,14,5,"OCR_ARENABATTLE");
	ta_smith_sharp(14,5,17,15,"OCR_ARENABATTLE_ROOM_01");
	ta_sitcampfire(17,15,19,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_boss(19,0,19,10,"OCR_ARENABATTLE_TRAIN2");
	ta_arenafight(19,10,20,18,"OCR_ARENABATTLE_TRAIN2");
	ta_boss(20,18,20,20,"OCR_ARENABATTLE_TRAIN2");
	ta_arenafight(20,20,21,40,"OCR_ARENABATTLE_TRAIN2");
	ta_boss(21,40,23,0,"OCR_ARENABATTLE_TRAIN2");
	ta_sitcampfire(23,0,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func void rtn_guide_251()
{
	ta_guidepc(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	ta_guidepc(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_251()
{
	ta_sleep(23,45,7,45,"OCR_HUT_21");
	ta_standaround(7,45,15,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_smith_sharp(15,0,17,15,"OCR_ARENABATTLE_ROOM_01");
	ta_sitcampfire(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func void rtn_dead_251()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_5");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_5");
};

func void rtn_wait_251()
{
	ta_boss(8,0,20,0,"OCR_ARENABATTLE_TRAIN2");
	ta_boss(20,0,8,0,"OCR_ARENABATTLE_TRAIN2");
};

func void rtn_fmtaken_251()
{
	ta_practicesword(8,0,20,0,"OCR_ARENABATTLE_TRAIN2");
	ta_practicesword(20,0,8,0,"OCR_ARENABATTLE_TRAIN2");
};
