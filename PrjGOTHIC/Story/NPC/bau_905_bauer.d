
instance BAU_905_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 2;
	id = 905;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",5,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,5);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_905;
};


func void rtn_start_905()
{
	ta_sleep(20,5,7,5,"NC_PATH_PEASANT3");
	ta_washself(7,5,7,25,"NC_PATH_PEASANT5");
	ta_pickrice(7,25,20,5,"NC_PATH69");
};

