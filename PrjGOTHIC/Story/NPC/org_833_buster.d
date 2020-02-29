
instance ORG_833_BUSTER(NPC_DEFAULT)
{
	name[0] = "Бустер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 4;
	voice = 2;
	id = 833;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",39,2,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,13);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfobooze,4);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_02);
	EquipItem(self,itrw_bow_small_01);
	CreateInvItems(self,itamarrow,10);
	daily_routine = rtn_start_833;
};


func void rtn_start_833()
{
	ta_sleep(1,0,7,30,"NC_HUT30_IN");
	ta_sitaround(7,30,1,0,"NC_HUT30_OUT");
};

