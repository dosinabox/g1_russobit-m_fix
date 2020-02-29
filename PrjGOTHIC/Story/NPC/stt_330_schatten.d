
instance STT_330_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 7;
	voice = 10;
	id = 330;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",2,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,10);
	CreateInvItem(self,itkelockpick);
	CreateInvItems(self,itfobeer,2);
	daily_routine = rtn_prestart_330;
};


func void rtn_prestart_330()
{
	ta_smalltalk(8,0,20,0,"OCR_OUTSIDE_HUT_44");
	ta_smalltalk(20,0,8,0,"OCR_OUTSIDE_HUT_44");
};

func void rtn_start_330()
{
	ta_sleep(23,0,7,30,"OCR_HUT_44");
	ta_sitaround(7,30,10,0,"OCR_OUTSIDE_HUT_44");
	ta_cookforme(10,0,17,0,"OCR_OUTSIDE_HUT_44");
	ta_sitaround(17,0,23,0,"OCR_OUTSIDE_HUT_44");
};

