
instance SLD_765_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 11;
	id = 765;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",49,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_fmcstart_765;
};


func void rtn_fmcstart_765()
{
	ta_guardpalisade(7,0,0,0,"FMC_HUT10_OUT");
	ta_sleep(0,0,7,0,"FMC_HUT10_IN");
};

func void rtn_dead_765()
{
	ta_stay(7,0,0,0,"FMC_HUT10_OUT");
	ta_stay(0,0,7,0,"FMC_HUT10_OUT");
};

