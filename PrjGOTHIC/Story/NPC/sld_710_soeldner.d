
instance SLD_710_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 710;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",9,2,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itminugget,18);
	CreateInvItems(self,itfo_potion_health_02,8);
	daily_routine = rtn_start_710;
};


func void rtn_start_710()
{
	ta_sleep(22,55,7,35,"NC_HUT09_IN");
	ta_smalltalk(7,35,22,55,"NC_HUT10_OUT");
};

func void rtn_fmtaken_710()
{
	ta_smalltalk(22,55,7,35,"OW_PATH_069");
	ta_smalltalk(7,35,22,55,"OW_PATH_069");
};

