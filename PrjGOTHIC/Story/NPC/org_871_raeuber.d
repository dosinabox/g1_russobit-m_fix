
instance ORG_871_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 12;
	voice = 7;
	id = 871;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,11);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfobooze,1);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_871;
};


func void rtn_start_871()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};

func void rtn_omfull_871()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};

func void rtn_fmtaken_871()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};

func void rtn_orcassault_871()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};
