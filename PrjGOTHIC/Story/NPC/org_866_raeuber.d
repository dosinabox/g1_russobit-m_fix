
instance ORG_866_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 12;
	voice = 9;
	id = 866;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",35,2,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itfomutton);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_866;
};


func void rtn_start_866()
{
	ta_smalltalk(8,0,23,0,"LOCATION_11_13");
	ta_guard(23,0,8,0,"LOCATION_11_13");
};

instance INFO_RAEUBER6_EXIT(C_INFO)
{
	npc = org_866_raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance ORG_866_RAEUBER_ALERT(C_INFO)
{
	npc = org_866_raeuber;
	nr = 1;
	condition = org_866_raeuber_alert_condition;
	information = org_866_raeuber_alert_info;
	permanent = 0;
	important = 1;
};

func int org_866_raeuber_alert_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void org_866_raeuber_alert_info()
{
	AI_Output(self,hero,"SVM_9_WhatsThisSupposedToBe");	//Эй, ты! Что ты здесь бродишь?
	AI_Output(self,hero,"SVM_9_IntruderAlert");	//Тревога! Чужой!
	b_setorg2hostile();
	AI_StopProcessInfos(self);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"Я нашел лагерь грабителей Квентина, которые скрывались в горах. Все пошло не совсем так, как я планировал: они сразу набросились на меня.");
	};
};
