
instance ORG_826_MORDRAG(NPC_DEFAULT)
{
	name[0] = "Мордраг";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 10;
	voice = 11;
	id = 826;
	attribute[ATR_STRENGTH] = 36;
	attribute[ATR_DEXTERITY] = 36;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,11);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_02);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,10);
	daily_routine = rtn_prestart_826;
};


func void rtn_prestart_826()
{
	ta_smalltalk(10,0,22,0,"OCR_OUTSIDE_HUT_44");
	ta_stand(22,0,10,0,"OCR_OUTSIDE_HUT_44");
};

func void rtn_guide_826()
{
	ta_guidepc(8,0,20,0,"OW_PATH_07_21");
	ta_guidepc(20,0,8,0,"OW_PATH_07_21");
};

func void rtn_start_826()
{
	ta_stand(8,0,23,0,"NC_TAVERN_BAR");
	ta_stand(23,0,8,0,"NC_TAVERN_BAR");
};

