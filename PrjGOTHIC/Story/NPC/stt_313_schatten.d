
instance STT_313_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 313;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",58,3,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_03);
	EquipItem(self,itrw_bow_small_03);
	CreateInvItems(self,itamarrow,12);
	CreateInvItem(self,itkelockpick);
	daily_routine = rtn_start_313;
};


func void rtn_start_313()
{
	ta_sleep(23,0,7,30,"OCR_HUT_36");
	ta_sitaround(7,30,11,0,"OCR_OUTSIDE_HUT_36");
	ta_repairhut(11,0,17,0,"OCR_OUTSIDE_HUT_36");
	ta_sitaround(17,0,23,0,"OCR_OUTSIDE_HUT_36");
};

