
instance STT_314_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 314;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",54,3,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,15);
	daily_routine = rtn_start_314;
};


func void rtn_start_314()
{
	ta_sleep(22,45,7,45,"OCR_HUT_38");
	ta_standaround(7,45,15,30,"OCR_OUTSIDE_HUT_39");
	ta_sitaround(15,30,17,0,"OCR_HUT_38");
	ta_sitcampfire(17,0,22,45,"OCR_OUTSIDE_HUT_39");
};

