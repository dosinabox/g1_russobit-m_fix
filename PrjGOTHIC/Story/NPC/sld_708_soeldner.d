
instance SLD_708_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SLD;
	level = 8;
	voice = 11;
	id = 856;
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
	CreateInvItems(self,itforice,9);
	CreateInvItems(self,itfobooze,7);
	CreateInvItems(self,itlstorch,3);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_708;
};


func void rtn_start_708()
{
	ta_sleep(0,0,8,0,"NC_HUT07_IN");
	ta_sitaround(8,0,0,0,"NC_PLACE03");
};

