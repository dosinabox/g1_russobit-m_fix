
instance SLD_705_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 705;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",50,2,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,12);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,8);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	daily_routine = rtn_start_705;
};


func void rtn_start_705()
{
	ta_smith_sharp(8,0,0,0,"NC_HUT03_OUT_MOVEMENT");
	ta_sleep(0,0,8,0,"NC_HUT03_IN");
};

