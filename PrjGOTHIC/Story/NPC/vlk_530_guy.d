
instance VLK_530_GUY(NPC_DEFAULT)
{
	name[0] = "√‡È";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 530;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Psionic",72,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmwpickaxe);
	CreateInvItems(self,itminugget,2);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_530;
};


func void rtn_start_530()
{
	ta_sleep(23,0,7,0,"OCR_HUT_25");
	ta_sitaround(7,0,8,0,"OCR_OUTSIDE_HUT_25");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_27");
	ta_sitaround(17,0,19,0,"OCR_OUTSIDE_ARENA_BENCH_2");
	ta_arenaspectator(19,0,23,0,"OCR_ARENA_07");
};

func void rtn_noarena_530()
{
	ta_sleep(23,0,7,0,"OCR_HUT_25");
	ta_sitaround(7,0,8,0,"OCR_OUTSIDE_HUT_25");
	ta_smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_27");
	ta_sitaround(17,0,23,0,"OCR_OUTSIDE_ARENA_BENCH_2");
};

