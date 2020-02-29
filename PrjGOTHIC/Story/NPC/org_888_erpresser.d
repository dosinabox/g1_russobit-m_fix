
instance ORG_888_ERPRESSER(NPC_DEFAULT)
{
	name[0] = "Разбойник";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 15;
	voice = 13;
	id = 888;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	//aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fatbald",35,2,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	CreateInvItem(self,quentinnote);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itminugget,20);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	EquipItem(self,itmw_1h_mace_war_02);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	start_aistate = zs_erpresser;
	daily_routine = rtn_start_888;
};


func void rtn_start_888()
{
	ta_boss(22,0,6,0,"OW_PATH_056");
	ta_boss(6,0,22,0,"OW_PATH_056");
};

