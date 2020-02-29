
instance SLD_753_BALORO(NPC_DEFAULT)
{
	name[0] = "Балоро";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 753;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,2,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfoloaf,8);
	CreateInvItems(self,itfomutton,6);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,6);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,7);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_fmcstart_753;
};


func void rtn_fmcstart_753()
{
	ta_guardpalisade(1,0,13,0,"FMC_HUT07_OUT");
	ta_guardpalisade(13,0,1,0,"FMC_HUT07_OUT");
};

