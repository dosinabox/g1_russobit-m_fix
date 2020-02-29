
instance STT_319_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 319;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Thief",57,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_03);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,14);
	daily_routine = rtn_start_319;
};


func void rtn_start_319()
{
	ta_sleep(22,30,6,30,"OCR_HUT_9");
	ta_sitaround(6,30,10,30,"OCR_OUTSIDE_HUT_9");
	ta_standaround(10,30,22,30,"OCR_OUTSIDE_HUT_9");
};

