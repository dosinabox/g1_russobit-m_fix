
instance BAU_930_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 4;
	id = 930;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmw_1h_sickle_01);
	daily_routine = rtn_start_930;
};


func void rtn_start_930()
{
	ta_sitcampfire(20,35,8,35,"NC_PATH_PEASANT_OUTSIDE11");
	ta_pickrice(8,35,20,35,"NC_PATH79");
};

