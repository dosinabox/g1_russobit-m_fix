
instance ORG_834_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_GUARD;
	guild = GIL_ORG;
	level = 4;
	voice = 13;
	id = 834;
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
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,14);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,3);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_claws_01);
	daily_routine = rtn_start_834;
};


func void rtn_start_834()
{
	ta_guardwheelopen(23,30,8,0,"OW_PATH_067_WHEEL");
	ta_guardwheelopen(8,0,23,30,"OW_PATH_067_WHEEL");
};

func void rtn_fmtaken_834()
{
	ta_guardwheelclosed(23,30,8,0,"OW_PATH_067_WHEEL");
	ta_guardwheelclosed(8,0,23,30,"OW_PATH_067_WHEEL");
};

