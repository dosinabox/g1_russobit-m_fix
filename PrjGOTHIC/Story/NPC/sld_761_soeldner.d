
instance SLD_761_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_MINE_GUARD;
	guild = GIL_SLD;
	level = 18;
	voice = 3;
	id = 761;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",107,1,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,9);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,1);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_03,2);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_fmcstart_761;
};


func void rtn_fmcstart_761()
{
	ta_guardpassage(1,0,13,0,"FMC_PATH27");
	ta_guardpassage(13,0,1,0,"FMC_PATH27");
};

