
instance ORG_850_WEDGE(NPC_DEFAULT)
{
	name[0] = "Ведж";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 11;
	voice = 5;
	id = 850;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fatbald",37,1,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,14);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_war_01);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_850;
};


func void rtn_start_850()
{
	ta_sleep(0,0,8,0,"NC_HUT17_IN");
	ta_smalltalk(8,0,0,0,"NC_PATH06");
};

