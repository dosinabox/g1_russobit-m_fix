
instance ORG_829_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 4;
	voice = 6;
	id = 829;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",13,1,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itat_teeth_01);
	daily_routine = rtn_start_829;
};


func void rtn_start_829()
{
	ta_guardpassage(8,0,20,0,"OW_PATH_07_21_GUARD_RIGHT");
	ta_guardpassage(20,0,8,0,"OW_PATH_07_21_GUARD_RIGHT");
};

