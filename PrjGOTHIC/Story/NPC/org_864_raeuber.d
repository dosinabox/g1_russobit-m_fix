
instance ORG_864_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 12;
	voice = 6;
	id = 864;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",9,1,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itfoloaf);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_864;
};


func void rtn_start_864()
{
	ta_standaround(8,0,23,0,"LOCATION_11_14");
	ta_sleep(23,0,8,0,"LOCATION_11_12_03");
};

instance INFO_RAEUBER4_EXIT(C_INFO)
{
	npc = org_864_raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance ORG_864_RAEUBER_ALERT(C_INFO)
{
	npc = org_864_raeuber;
	nr = 1;
	condition = org_864_raeuber_alert_condition;
	information = org_864_raeuber_alert_info;
	permanent = 0;
	important = 1;
};

func int org_864_raeuber_alert_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void org_864_raeuber_alert_info()
{
	AI_Output(self,hero,"SVM_6_YouViolatedForbiddenTerritory");	//Эй! Откуда ты пришел?
	AI_Output(self,hero,"SVM_6_IntruderAlert");	//Тревога!
	b_setorg2hostile();
	AI_StopProcessInfos(self);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"Я нашел лагерь грабителей Квентина, которые скрывались в горах. Все пошло не совсем так, как я планировал: они сразу набросились на меня.");
	};
};
