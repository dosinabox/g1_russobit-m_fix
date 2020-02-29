
instance SLD_736_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 11;
	voice = 11;
	id = 736;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,5,"Hum_Head_FatBald",48,1,sld_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_war_02);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,6);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,9);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_start_736;
};


func void rtn_start_736()
{
	ta_sleep(20,50,7,10,"NC_HUT08_IN");
	ta_practicesword(7,10,20,50,"NC_WATERFALL_TOP02");
};

func void rtn_fmtaken_736()
{
	ta_stay(0,0,23,0,"OW_PATH_075_GUARD");
	ta_stay(23,0,24,0,"OW_PATH_075_GUARD");
};

func void rtn_fmtakenback_736()
{
	ta_stayneutral(5,0,17,0,"FMC_ENTRANCE");
	ta_stayneutral(17,0,5,0,"FMC_ENTRANCE");
};

