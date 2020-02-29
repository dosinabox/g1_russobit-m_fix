
instance SLD_758_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_SLD;
	level = 12;
	voice = 11;
	id = 758;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",53,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,6);
	CreateInvItems(self,itfo_potion_health_02,7);
	daily_routine = rtn_fmcstart_758;
};


func void rtn_fmcstart_758()
{
	ta_guardpalisade(6,0,23,0,"FMC_PATH06");
	ta_sleep(23,0,6,0,"FMC_HUT15_IN");
};

func void rtn_dead_758()
{
	ta_stay(6,0,23,0,"FMC_PATH06");
	ta_stay(23,0,6,0,"FMC_PATH06");
};

