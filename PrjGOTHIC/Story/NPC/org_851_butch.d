
instance ORG_851_BUTCH(NPC_DEFAULT)
{
	name[0] = "Áóò÷";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 15;
	voice = 13;
	id = 851;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",36,1,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,13);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_war_02);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_851;
};


func void rtn_start_851()
{
	ta_sleep(1,0,7,30,"NC_HUT15_IN");
	ta_standaround(7,30,1,0,"NC_HUT16_OUT");
};

