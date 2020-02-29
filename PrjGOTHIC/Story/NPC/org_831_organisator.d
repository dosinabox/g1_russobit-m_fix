
instance ORG_831_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_ORG;
	level = 4;
	voice = 6;
	id = 831;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",10,1,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,11);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfobooze,1);
	CreateInvItems(self,itlstorch,1);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_claws_01);
	daily_routine = rtn_start_831;
};


func void rtn_start_831()
{
	ta_smalltalk(20,0,8,0,"OW_PATH_067");
	ta_smalltalk(8,0,20,0,"OW_PATH_067");
};

