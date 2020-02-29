
instance ORG_891_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_ORG;
	level = 8;
	voice = 6;
	id = 891;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itfoloaf);
	EquipItem(self,itmw_1h_mace_03);
	daily_routine = rtn_fmcstart_891;
};


func void rtn_fmcstart_891()
{
	ta_sitaround(6,0,12,0,"FMC_HUT06_IN");
	ta_standaround(12,0,13,0,"FMC_HUT06_OUT");
	ta_sitaround(13,0,22,0,"FMC_HUT06_IN");
	ta_sleep(22,0,6,0,"FMC_HUT06_IN");
};

func void rtn_dead_891()
{
	ta_stay(6,0,22,0,"FMC_HUT06_OUT");
	ta_stay(22,0,6,0,"FMC_HUT06_OUT");
};

