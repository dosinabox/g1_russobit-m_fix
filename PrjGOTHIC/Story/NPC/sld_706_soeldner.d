
instance SLD_706_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 706;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",49,1,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,6);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,18);
	CreateInvItems(self,itfobooze,4);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,9);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	daily_routine = rtn_start_706;
};


func void rtn_start_706()
{
	ta_standaround(7,30,0,0,"NC_HUT02_OUT");
	ta_sleep(0,0,7,30,"NC_HUT02_IN");
};

