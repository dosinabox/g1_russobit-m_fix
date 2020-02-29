
instance BAU_915_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 4;
	id = 915;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",84,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,4);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_915;
};


func void rtn_start_915()
{
	ta_sleep(20,25,7,25,"NC_PATH_PEASANT2");
	ta_pickrice(7,25,20,25,"NC_PATH80");
};

