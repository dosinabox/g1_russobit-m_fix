
instance SFB_1033_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 1;
	id = 1033;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",40,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	daily_routine = rtn_fmcstart_1033;
};


func void rtn_fmcstart_1033()
{
	ta_pickore(6,0,23,0,"FMC_ORE_05");
	ta_sleep(23,0,6,0,"FMC_HUT16_IN");
};

func void rtn_dead_1033()
{
	ta_stay(6,0,23,0,"FMC_HUT16_IN");
	ta_stay(23,0,6,0,"FMC_HUT16_IN");
};

