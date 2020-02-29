
instance SLD_720_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 720;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfoloaf,6);
	CreateInvItems(self,itfomutton,6);
	CreateInvItems(self,itminugget,16);
	CreateInvItems(self,itfobooze,6);
	CreateInvItems(self,itlstorch,6);
	CreateInvItems(self,itfo_potion_health_02,6);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_start_720;
};


func void rtn_start_720()
{
	ta_sleep(0,30,8,0,"NC_HUT07_IN");
	ta_roastscavenger(8,0,22,0,"NC_PLACE03_MOVEMENT");
	ta_sitaround(22,0,0,30,"NC_PLACE03_MOVEMENT");
};

func void rtn_fmtaken_720()
{
	ta_practicesword(0,30,8,0,"NC_PATH62");
	ta_practicesword(8,0,0,30,"NC_PATH62");
};

