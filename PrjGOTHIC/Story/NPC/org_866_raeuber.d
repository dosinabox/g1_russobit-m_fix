
instance ORG_866_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 12;
	voice = 6;
	id = 866;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,13);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_866;
};


func void rtn_start_866()
{
	ta_practicebow(13,0,14,0,"LOCATION_11_14");
	ta_practicebow(14,0,13,0,"LOCATION_11_14");
};

func void rtn_omfull_866()
{
	ta_practicebow(13,0,14,0,"LOCATION_11_14");
	ta_practicebow(14,0,13,0,"LOCATION_11_14");
};

