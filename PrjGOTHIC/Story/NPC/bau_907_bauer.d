
instance BAU_907_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 9;
	id = 907;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",99,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itforice);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_907;
};


func void rtn_start_907()
{
	ta_sleep(20,10,7,10,"NC_PATH_PEASANT3");
	ta_pickrice(7,10,20,10,"NC_PATH82");
};

