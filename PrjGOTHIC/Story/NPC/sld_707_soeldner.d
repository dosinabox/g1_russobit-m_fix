
instance SLD_707_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 707;
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
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,6);
	CreateInvItems(self,itfo_potion_health_02,7);
	daily_routine = rtn_start_707;
};


func void rtn_start_707()
{
	ta_guardpalisade(6,30,22,15,"NC_LO_05");
	ta_guardpalisade(22,15,6,30,"NC_LO_05");
};

