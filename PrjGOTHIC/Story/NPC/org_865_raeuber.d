
instance ORG_865_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 12;
	voice = 10;
	id = 865;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",34,2,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfoloaf);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_865;
};


func void rtn_start_865()
{
	ta_smalltalk(8,0,23,0,"LOCATION_11_07");
	ta_guard(23,0,8,0,"LOCATION_11_07");
};

instance INFO_RAEUBER5_EXIT(C_INFO)
{
	npc = org_865_raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance ORG_865_RAEUBER_ALERT(C_INFO)
{
	npc = org_865_raeuber;
	nr = 1;
	condition = org_865_raeuber_alert_condition;
	information = org_865_raeuber_alert_info;
	permanent = 0;
	important = 1;
};

func int org_865_raeuber_alert_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void org_865_raeuber_alert_info()
{
	AI_Output(self,hero,"SVM_10_YouViolatedForbiddenTerritory");	//Эй! А ты откуда здесь взялся?
	AI_Output(self,hero,"SVM_10_IntruderAlert");	//Тревога! Чужой!
	b_setorg2hostile();
	AI_StopProcessInfos(self);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"Я нашел лагерь грабителей Квентина, которые скрывались в горах. Все пошло не совсем так, как я планировал: они сразу набросились на меня.");
	};
};

instance ORG2_AMULET_CHEER(C_INFO)
{
	npc = org_865_raeuber;
	nr = 1;
	condition = org2_amulet_cheer_condition;
	information = org2_amulet_cheer_info;
	permanent = 0;
	important = 1;
};

func int org2_amulet_cheer_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia3))
	{
		return 1;
	};
};

func void org2_amulet_cheer_info()
{
	AI_Output(self,hero,"SVM_10_StoleFromMage");	//Так ты украл у магов что-то ценное, да?
	AI_Output(self,hero,"DIA_Roscoe_BringList_10_01");	//Неплохо. Как ты его достал?
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//Так, стараюсь...
	AI_Output(self,hero,"GUR_1201_CorKalom_JoinPSI_10_11");	//Добро пожаловать!
	AI_StopProcessInfos(self);
};

