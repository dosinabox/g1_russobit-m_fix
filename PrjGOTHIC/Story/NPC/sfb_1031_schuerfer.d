
instance SFB_1031_SCHUERFER(NPC_DEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 3;
	voice = 2;
	id = 1031;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",44,3,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itminugget,5);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_fmcstart_1031;
};


func void rtn_fmcstart_1031()
{
	ta_pickore(1,0,13,0,"FMC_ORE_03");
	ta_pickore(13,0,1,0,"FMC_ORE_03");
};

