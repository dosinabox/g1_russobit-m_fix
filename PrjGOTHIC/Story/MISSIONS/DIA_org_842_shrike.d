
instance DIA_SHRIKE_EXIT(C_INFO)
{
	npc = org_842_shrike;
	nr = 999;
	condition = dia_shrike_exit_condition;
	information = dia_shrike_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_shrike_exit_condition()
{
	return 1;
};

func void dia_shrike_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRIKE_HELLO(C_INFO)
{
	npc = org_842_shrike;
	nr = 1;
	condition = dia_shrike_hello_condition;
	information = dia_shrike_hello_info;
	important = 0;
	description = "Как дела?";
};


func int dia_shrike_hello_condition()
{
	return 1;
};

func void dia_shrike_hello_info()
{
	AI_Output(other,self,"DIA_Shrike_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Shrike_Hello_07_01");	//Уйди от меня!
	AI_StopProcessInfos(self);
};


instance DIA_SHRIKE_GETLOST(C_INFO)
{
	npc = org_842_shrike;
	nr = 1;
	condition = dia_shrike_getlost_condition;
	information = dia_shrike_getlost_info;
	important = 0;
	description = "Убирайся.";
};


func int dia_shrike_getlost_condition()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC])
	{
		return 1;
	};
};

func void dia_shrike_getlost_info()
{
	AI_Output(other,self,"DIA_Shrike_GetLost_15_00");	//Убирайся.
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01");	//Мы еще поговорим об этом!
	Log_CreateTopic(CH1_SHRIKESHUT,LOG_MISSION);
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_RUNNING);
	b_logentry(CH1_SHRIKESHUT,"Я 'убедил' Шрайка найти другой дом. Интересно, что на это скажет Горн.");
	b_givexp(XP_KICKEDSHRIKE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"start");
};

