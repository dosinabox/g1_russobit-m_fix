
instance BAU_904_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 9;
	id = 904;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",5,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_904;
};


func void rtn_start_904()
{
	ta_sleep(20,0,7,0,"NC_PATH_PEASANT3");
	ta_washself(7,0,7,20,"NC_PATH_PEASANT5");
	ta_pickrice(7,20,20,0,"NC_DAM_BOTTOM");
};

