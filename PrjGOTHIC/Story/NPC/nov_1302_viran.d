
instance NOV_1302_VIRAN(NPC_DEFAULT)
{
	name[0] = "Вайран";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 15;
	voice = 7;
	id = 1302;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_hatchet_01);
	CreateInvItems(self,itmi_plants_swampherb_01,50);
	CreateInvItems(self,itminugget,5);
	CreateInvItems(self,itforice,2);
	CreateInvItems(self,itfobooze,6);
	daily_routine = rtn_start_1302;
};


func void rtn_start_1302()
{
	ta_boss(6,0,21,0,"PATH_TAKE_HERB_2_1");
	ta_sitcampfire(21,0,6,0,"PATH_TAKE_HERB_2_1");
};

