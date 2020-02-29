
instance SFB_1042_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 1;
	id = 1042;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",43,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itmi_stuff_cup_01);
	EquipItem(self,itmwpickaxe);
	daily_routine = rtn_fmcstart_1042;
};


func void rtn_fmcstart_1042()
{
	ta_smoke(1,0,13,0,"FMC_HUT04_OUT");
	ta_smoke(1,0,13,0,"FMC_HUT04_OUT");
};

