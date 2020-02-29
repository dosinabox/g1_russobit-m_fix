
instance STT_316_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 316;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",56,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_01);
	EquipItem(self,itrw_bow_small_05);
	CreateInvItems(self,itamarrow,15);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItems(self,itfobeer,2);
	daily_routine = rtn_start_316;
};


func void rtn_start_316()
{
	ta_sleep(23,0,8,0,"OCR_HUT_18");
	ta_smalltalk(8,0,19,0,"OCR_OUTSIDE_HUT_18");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_09");
};

func void rtn_noarena_316()
{
	ta_sleep(23,0,8,0,"OCR_HUT_18");
	ta_smalltalk(8,0,23,0,"OCR_OUTSIDE_HUT_18");
};

