
instance ORG_804_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 15;
	voice = 6;
	id = 804;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",10,1,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,12);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itlstorch,1);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_war_02);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_804;
};


func void rtn_start_804()
{
	ta_guardpassage(20,0,8,0,"NC_HUT23_OUT_GUARD");
	ta_guardpassage(8,0,20,0,"NC_HUT23_OUT_GUARD");
};

