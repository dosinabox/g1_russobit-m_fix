
instance GUR_1211_BAALLUKOR(NPC_DEFAULT)
{
	name[0] = "Идол Люкор";
	npctype = NPCTYPE_FRIEND;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 1211;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itmw_1h_sword_02);
	daily_routine = rtn_start_1211;
	fight_tactic = FAI_HUMAN_STRONG;
};


func void rtn_start_1211()
{
	ta_guard(23,0,16,0,"GRYD_025");
	ta_guard(16,0,23,0,"GRYD_025");
};

func void rtn_follow_1211()
{
	ta_followpc(23,0,16,0,"GRYD_025");
	ta_followpc(16,0,23,0,"GRYD_025");
};

func void rtn_waitinsidetunnelone_1211()
{
	ta_stay(23,0,16,0,"GRYD_040");
	ta_stay(16,0,23,0,"GRYD_040");
};

func void rtn_waitinsidetunneltwo_1211()
{
	ta_stay(23,0,16,0,"GRYD_047");
	ta_stay(16,0,23,0,"GRYD_047");
};

func void rtn_door_1211()
{
	ta_stay(23,0,16,0,"GRYD_060");
	ta_stay(16,0,23,0,"GRYD_060");
};

func void rtn_teleport_1211()
{
	ta_followpc(23,0,16,0,"GRYD_060");
	ta_followpc(16,0,23,0,"GRYD_060");
};

func void rtn_meditate_1211()
{
	ta_meditate(23,0,16,0,"GRYD_082");
	ta_meditate(16,0,23,0,"GRYD_082");
};

instance GUR_999_BAALLUKOR(NPC_DEFAULT)
{
	name[0] = "Идол Люкор";
	npctype = NPCTYPE_MAIN;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 999;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itmw_1h_sword_02);
	daily_routine = rtn_start_999;
	fight_tactic = FAI_HUMAN_STRONG;
};

func void rtn_start_999()
{
	ta_stay(6,0,23,30,"PSI_VIEWPOINT");
	ta_sitaround(23,30,6,0,"PSI_34_HUT_IN");
};

func void rtn_remove_999()
{
	ta_stay(23,0,16,0,"WP_INTRO01");
	ta_stay(16,0,23,0,"WP_INTRO01");
};

instance INFO_LUKOR_PSI_EXIT(C_INFO)
{
	npc = gur_999_baallukor;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_LUKOR_PSI_HI(C_INFO)
{
	npc = gur_999_baallukor;
	condition = info_lukor_psi_hi_condition;
	information = info_lukor_psi_hi_info;
	important = 0;
	permanent = 0;
	description = "Пробудись!";
};

func int info_lukor_psi_hi_condition()
{
	return 1;
};

func void info_lukor_psi_hi_info()
{
	AI_Output(hero,self,"SVM_15_SectGreetings");	//Пробудись!
	if(Npc_GetTrueGuild(hero) != GIL_NOV && Npc_GetTrueGuild(hero) != GIL_TPL)
	{
		AI_Output(self,hero,"SVM_13_WhatDoYouWant");	//Что тебе от меня нужно?
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"SVM_13_FriendlyGreetings");	//У тебя все в порядке?
	};
};

