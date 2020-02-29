
instance SLD_708_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SLD;
	level = 8;
	voice = 11;
	id = 708;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itminugget,15);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_708;
};


func void rtn_start_708()
{
	ta_sleep(0,0,7,30,"NC_HUT07_IN");
	ta_washself(7,30,8,0,"NC_WASH_03");
	ta_sitaround(8,0,0,0,"NC_PLACE03");
};

func void rtn_fmtaken_708()
{
	ta_guardpassage(0,0,8,0,"NC_PATH44");
	ta_guardpassage(8,0,0,0,"NC_PATH44");
};

