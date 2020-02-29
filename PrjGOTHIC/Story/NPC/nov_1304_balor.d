
instance NOV_1304_BALOR(NPC_DEFAULT)
{
	name[0] = "Бэлор";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 15;
	voice = 1;
	id = 1304;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_hatchet_01);
	CreateInvItems(self,itmi_plants_swampherb_01,50);
	CreateInvItems(self,itminugget,7);
	CreateInvItems(self,itforice,3);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itmijoint_1,4);
	daily_routine = rtn_start_1304;
};


func void rtn_start_1304()
{
	ta_boss(6,0,21,0,"PATH_TAKE_HERB_06");
	ta_sitcampfire(21,0,6,0,"PATH_TAKE_HERB_07");
};

