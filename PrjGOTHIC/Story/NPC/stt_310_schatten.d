
instance STT_310_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 310;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_02);
	EquipItem(self,itrw_bow_small_03);
	CreateInvItems(self,itamarrow,10);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_310;
};


func void rtn_start_310()
{
	ta_sleep(22,0,7,0,"OCR_HUT_8");
	ta_smalltalk(7,0,11,0,"OCR_OUTSIDE_HUT_7");
	ta_standaround(11,0,20,5,"OCR_COOK_AT_HUT_10");
	ta_smalltalk(20,5,22,0,"OCR_OUTSIDE_HUT_7");
};

