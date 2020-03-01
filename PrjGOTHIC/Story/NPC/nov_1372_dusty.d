
instance NOV_1372_DUSTY(NPC_DEFAULT)
{
	name[0] = "Дасти";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_NOV;
	level = 15;
	voice = 3;
	id = 1372;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",68,0,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_1372;
};


func void rtn_start_1372()
{
	ta_sleep(23,0,7,45,"PSI_25_HUT_IN");
	ta_listen(7,45,23,0,"PSI_12_HUT_EX_TEACH");
};

