
instance ORG_846_SCHLAEGER(NPC_DEFAULT)
{
	name[0] = NAME_SCHLAEGER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 4;
	voice = 7;
	id = 846;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itforice,9);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,1);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_teeth_01);
	daily_routine = rtn_start_846;
};


func void rtn_start_846()
{
	ta_sitcampfire(20,15,8,15,"NC_PATH86_MOVEMENT");
	ta_smalltalk(8,15,20,15,"NC_PATH53");
};

