
instance TPL_1402_GORNATOTH(NPC_DEFAULT)
{
	name[0] = "Гор На Тоф";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 21;
	voice = 11;
	id = 1402;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 292;
	attribute[ATR_HITPOINTS] = 292;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",86,1,tpl_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	CreateInvItem(self,itmw_2h_sword_old_01);
	CreateInvItem(self,itmw_2h_sword_light_01);
	CreateInvItem(self,itmw_2h_sword_light_02);
	daily_routine = rtn_start_1402;
};


func void rtn_start_1402()
{
	ta_sleep(1,0,5,0,"PSI_33_HUT_IN");
	ta_boss(5,0,1,0,"PSI_MEETING_BRIDGE_MOVEMENT");
};

