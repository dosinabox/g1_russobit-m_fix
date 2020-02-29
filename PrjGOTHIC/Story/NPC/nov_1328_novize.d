
instance NOV_1328_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 3;
	id = 1328;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1328;
};


func void rtn_start_1328()
{
	ta_pickrice(7,0,19,0,"PATH_TAKE_HERB_2_1");
	ta_pickrice(19,0,7,0,"PATH_TAKE_HERB_2_1");
};

