
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
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itmi_stuff_cup_01);
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itmw_1h_nailmace_01);
	daily_routine = rtn_fmcstart_1041;
};


func void rtn_fmcstart_1041()
{
	ta_sitaround(1,0,13,0,"FMC_HUT01_OUT");
	ta_sitaround(13,0,1,0,"FMC_HUT01_OUT");
};

