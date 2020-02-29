
instance STT_328_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 328;
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
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_328;
};


func void rtn_start_328()
{
	ta_sleep(23,5,7,0,"OCR_HUT_22");
	ta_sitaround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_roastscavenger(11,0,17,30,"OCR_OUTSIDE_ARENA_01");
	ta_sitaround(17,30,19,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_arenaspectator(19,0,23,5,"OCR_ARENA_05");
};

