
instance SLD_726_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 726;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",53,1,sld_armor_h);
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
	CreateInvItems(self,itminugget,25);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,10);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_start_726;
};


func void rtn_start_726()
{
	ta_guardpassage(23,0,7,0,"NC_PATH40_GUARD2");
	ta_guardpassage(7,0,23,0,"NC_PATH40_GUARD2");
};

func void rtn_loadsword_726()
{
	ta_guard(23,0,7,0,"NC_PLACE02");
	ta_guard(7,0,23,0,"NC_PLACE02");
};

