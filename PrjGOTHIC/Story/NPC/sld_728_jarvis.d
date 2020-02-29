
instance SLD_728_JARVIS(NPC_DEFAULT)
{
	name[0] = "ярвис";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 16;
	flags = NPC_FLAG_IMMORTAL;
	voice = 8;
	id = 728;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",104,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,6);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_start_728;
};


func void rtn_start_728()
{
	ta_guard(8,0,20,0,"NC_PATH_JARVIS");
	ta_guard(20,0,8,0,"NC_PATH_JARVIS");
};

