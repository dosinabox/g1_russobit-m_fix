
instance BAU_926_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 2;
	id = 926;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Pony",2,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,3);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_sickle_01);
	daily_routine = rtn_start_926;
};


func void rtn_start_926()
{
	ta_smalltalk(8,0,20,0,"OW_PATH_069");
	ta_smalltalk(20,0,8,0,"OW_PATH_069");
};

