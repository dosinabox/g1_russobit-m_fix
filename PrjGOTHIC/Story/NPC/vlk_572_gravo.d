
instance VLK_572_GRAVO(NPC_DEFAULT)
{
	name[0] = "Граво";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 4;
	voice = 4;
	id = 572;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_Psionic",0,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItems(self,itminugget,5);
	daily_routine = rtn_start_572;
};


func void rtn_start_572()
{
	ta_sleep(22,30,6,0,"OCR_HUT_4");
	ta_sitaround(6,0,11,0,"OCR_AUDIENCE_01");
	ta_cookforme(11,0,15,0,"OCR_OUTSIDE_HUT_4_INSERT");
	ta_standaround(15,0,17,0,"OCR_OUTSIDE_HUT_4_INSERT");
	ta_sitaround(17,0,22,30,"OCR_AUDIENCE_01");
};

func void rtn_watch_572()
{
	ta_boss(22,30,6,0,"OCR_AUDIENCE_01");
	ta_boss(6,0,22,30,"OCR_AUDIENCE_01");
};

