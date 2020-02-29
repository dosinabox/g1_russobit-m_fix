
instance SFB_1037_SWINEY(NPC_DEFAULT)
{
	name[0] = "�����";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 9;
	id = 1037;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",41,2,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfoloaf,4);
	CreateInvItems(self,itfomutton,2);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_fmcstart_1037;
};


func void rtn_fmcstart_1037()
{
	ta_boss(7,0,23,0,"FMC_HUT11_OUT");
	ta_sleep(23,0,7,0,"FMC_HUT11_IN");
};

func void rtn_dead_1037()
{
	ta_stay(7,0,23,0,"FMC_HUT11_IN");
	ta_stay(23,0,7,0,"FMC_HUT11_IN");
};

