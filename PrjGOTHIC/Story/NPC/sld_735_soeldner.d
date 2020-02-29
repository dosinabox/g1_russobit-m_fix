
instance SLD_735_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 11;
	voice = 11;
	id = 735;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",13,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_war_02);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itminugget,20);
	CreateInvItems(self,itfobooze,7);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_02,6);
	daily_routine = rtn_start_735;
};


func void rtn_start_735()
{
	ta_sleep(20,55,7,5,"NC_HUT08_IN");
	ta_practicesword(7,5,20,55,"NC_WATERFALL_TOP01");
};

func void rtn_fmtaken_735()
{
	ta_stay(0,0,23,0,"OW_PATH_075_GUARD2");
	ta_stay(23,0,24,0,"OW_PATH_075_GUARD2");
};

func void rtn_fmtakenback_735()
{
	ta_stayneutral(5,0,17,0,"FMC_PATH03");
	ta_stayneutral(17,0,5,0,"FMC_PATH03");	
};