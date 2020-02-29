
instance STT_306_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 7;
	voice = 12;
	id = 306;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",12,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,10);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itfoapple);
	CreateInvItem(self,itkelockpick);
	daily_routine = rtn_start_306;
};


func void rtn_start_306()
{
	ta_sleep(23,0,8,5,"OCR_HUT_27");
	ta_smalltalk(8,5,17,0,"OCR_OUTSIDE_HUT_27_MOVEMENT");
	ta_sitaround(17,0,19,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_07");
};

func void rtn_noarena_306()
{
	ta_sleep(23,0,8,5,"OCR_HUT_27");
	ta_smalltalk(8,5,17,0,"OCR_OUTSIDE_HUT_27_MOVEMENT");
	ta_sitaround(17,0,23,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
};

