
instance STT_304_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 304;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",14,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_02);
	EquipItem(self,itrw_bow_small_01);
	CreateInvItems(self,itamarrow,14);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itkelockpick,2);
	daily_routine = rtn_start_304;
};


func void rtn_start_304()
{
	ta_sleep(0,0,8,0,"OCR_HUT_6");
	ta_smalltalk(8,0,24,0,"OCR_TO_HUT_6");
};

