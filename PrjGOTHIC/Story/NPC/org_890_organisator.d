
instance ORG_890_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 890;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itfo_potion_health_02,2);
	EquipItem(self,itmw_1h_mace_03);
	daily_routine = rtn_fmcstart_890;
};


func void rtn_fmcstart_890()
{
	ta_sitaround(7,0,13,0,"FMC_HUT06_IN");
	ta_smoke(13,0,14,0,"FMC_HUT06_OUT");
	ta_sitaround(14,0,23,0,"FMC_HUT06_IN");
	ta_sleep(23,0,7,0,"FMC_HUT06_IN");
};

func void rtn_dead_890()
{
	ta_stay(7,0,23,0,"FMC_HUT06_IN");
	ta_stay(23,0,7,0,"FMC_HUT06_IN");
};

