
instance STT_318_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 7;
	voice = 12;
	id = 318;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",108,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_04);
	EquipItem(self,itrw_bow_small_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItem(self,itkelockpick);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_318;
};


func void rtn_start_318()
{
	ta_sleep(23,0,7,0,"OCR_HUT_60");
	ta_boss(7,0,7,30,"OCR_OUTSIDE_HUT_60");
	ta_standaround(7,30,15,0,"OCR_CAMPFIRE_F_1");
	ta_repairhut(15,0,17,0,"OCR_OUTSIDE_HUT_60");
	ta_standaround(17,25,23,0,"OCR_CAMPFIRE_F_2");
};

