
instance BAU_912_JEREMIAH(NPC_DEFAULT)
{
	name[0] = "Джереми";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 7;
	voice = 4;
	id = 912;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 13;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Bald",80,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itforice,7);
	CreateInvItem(self,itmi_alchemy_alcohol_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	EquipItem(self,itmw_1h_sword_short_01);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,5);
	daily_routine = rtn_start_912;
};


func void rtn_start_912()
{
	ta_sleep(22,0,8,0,"NC_TAVERN_BACKROOM05");
	ta_potionalchemy(8,0,22,0,"NC_TAVERN_BACKROOM01");
};

