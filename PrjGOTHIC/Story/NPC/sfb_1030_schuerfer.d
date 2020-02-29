
instance SFB_1030_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 3;
	voice = 1;
	id = 1030;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Psionic",42,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,2);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itmw_1h_nailmace_01);
	daily_routine = rtn_fmcstart_1030;
};


func void rtn_fmcstart_1030()
{
	ta_pickore(6,0,23,0,"FMC_ORE_02");
	ta_sleep(23,0,6,0,"FMC_HUT14_IN");
};

func void rtn_dead_1030()
{
	ta_stay(6,0,23,0,"FMC_HUT14_IN");
	ta_stay(23,0,6,0,"FMC_HUT14_IN");
};

