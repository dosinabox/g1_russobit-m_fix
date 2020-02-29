
instance ORG_874_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 12;
	voice = 2;
	id = 874;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",38,4,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,11);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_874;
};


func void rtn_start_874()
{
	ta_smalltalk(8,0,23,0,"LOCATION_11_07");
	ta_sleep(23,0,8,0,"LOCATION_11_11");
};

instance INFO_RAEUBER10_EXIT(C_INFO)
{
	npc = org_874_raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

