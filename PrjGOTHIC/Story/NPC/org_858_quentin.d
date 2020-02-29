
instance ORG_858_QUENTIN(NPC_DEFAULT)
{
	name[0] = " вентин";
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 12;
	voice = 7;
	id = 858;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",8,1,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_war_01);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_858;
};


func void rtn_start_858()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};

func void rtn_omfull_858()
{
	ta_standaround(13,0,14,0,"LOCATION_11_13");
	ta_standaround(14,0,13,0,"LOCATION_11_13");
};

