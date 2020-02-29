
instance STT_322_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 7;
	voice = 12;
	id = 322;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",57,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,15);
	daily_routine = rtn_start_322;
};


func void rtn_start_322()
{
	ta_sleep(23,2,6,45,"OCR_HUT_3");
	ta_standaround(6,45,10,0,"OCR_CAMPFIRE_A_MOVEMENT3");
	ta_washself(10,0,10,30,"OCR_LAKE_1");
	ta_standaround(10,30,12,30,"OCR_CAMPFIRE_A_MOVEMENT2");
	ta_smalltalk(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3");
	ta_sitaround(15,30,16,0,"OCR_HUT_3");
	ta_smalltalk(16,0,18,1,"OCR_CAMPFIRE_A_MOVEMENT3");
	ta_sitcampfire(18,1,23,2,"OCR_CAMPFIRE_A_MOVEMENT3");
};

func void rtn_omfull_322()
{
	ta_sleep(23,0,7,0,"OCR_HUT_3");
	ta_standaround(7,0,23,0,"OCR_TO_MAINGATE");
};

func void rtn_fmtaken_322()
{
	ta_pickore(8,0,13,0,"FMC_FM_ENTRANCE");
	ta_washself(14,0,15,0,"OCR_WASH_5");
	ta_smoke(18,0,23,0,"OCR_OUTSIDE_HUT_54");
	ta_sleep(23,0,8,0,"OCR_HUT_3");
};

func void rtn_orcassault_322()
{
};

