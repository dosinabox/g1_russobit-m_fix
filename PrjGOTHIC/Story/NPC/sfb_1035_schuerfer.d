
instance SFB_1035_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 5;
	id = 1035;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_FatBald",11,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,3);
	CreateInvItems(self,itminugget,9);
	CreateInvItem(self,itmi_stuff_cup_01);
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_fmcstart_1035;
};


func void rtn_fmcstart_1035()
{
	ta_pickore(1,0,13,0,"FMC_ORE_07");
	ta_pickore(13,0,1,0,"FMC_ORE_07");
};

