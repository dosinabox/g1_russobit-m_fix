
instance BAU_929_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_BAU;
	level = 2;
	voice = 2;
	id = 929;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Bald",2,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_sickle_01);
	CreateInvItems(self,itforice,2);
	daily_routine = rtn_start_929;
};


func void rtn_start_929()
{
	ta_sitcampfire(20,30,8,30,"NC_PATH_PEASANT_OUTSIDE9");
	ta_pickrice(8,30,20,30,"NC_PATH80");
};

func void rtn_repair_929()
{
	ta_sitcampfire(20,30,8,0,"NC_PATH_PEASANT_OUTSIDE9");
	ta_repairhut(8,0,20,30,"NC_DAM_BOTTOM_REPAIR");
};

