
instance SFB_1043_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 2;
	id = 1043;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",43,4,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmwpickaxe);
	EquipItem(self,itmw_1h_sword_short_01);
	daily_routine = rtn_fmcstart_1043;
};


func void rtn_fmcstart_1043()
{
	ta_smoke(8,0,0,0,"FMC_HUT04_OUT");
	ta_sleep(0,0,8,0,"FMC_HUT04_IN");
};

func void rtn_dead_1043()
{
	ta_stay(8,0,0,0,"FMC_HUT04_IN");
	ta_stay(0,0,8,0,"FMC_HUT04_IN");
};

