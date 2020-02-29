
instance SLD_723_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 723;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",48,1,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,6);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,22);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,7);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	daily_routine = rtn_start_723;
};


func void rtn_start_723()
{
	ta_guardpassage(8,0,22,0,"NC_GUARD_MAGES_LEFT");
	ta_guardpassage(22,0,8,0,"NC_GUARD_MAGES_LEFT");
};

