
instance SFB_1041_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 5;
	id = 1041;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",43,2,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itmw_1h_nailmace_01);
	daily_routine = rtn_fmcstart_1041;
};


func void rtn_fmcstart_1041()
{
	ta_smalltalk(7,0,22,0,"FMC_HUT03_OUT");
	ta_sleep(22,0,7,0,"FMC_HUT03_IN");
};

func void rtn_saved_1041()
{
	ta_standaround(7,0,22,0,"OW_PATH_081_H3");
	ta_sleep(22,0,7,0,"OW_PATH_081_H2");
};

