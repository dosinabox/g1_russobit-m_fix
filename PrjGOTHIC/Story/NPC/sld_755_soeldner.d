
instance SLD_755_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 755;
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
	daily_routine = rtn_fmcstart_755;
};


func void rtn_fmcstart_755()
{
	ta_guardpalisade(5,0,0,0,"FMC_HUT12_OUT");
	ta_sleep(0,0,5,0,"FMC_HUT12_IN");
};

func void rtn_saved_755()
{
	ta_guard(5,0,0,0,"OW_PATH_081_N4");
	ta_sleep(0,0,5,0,"OW_PATH_081_H2");
};

