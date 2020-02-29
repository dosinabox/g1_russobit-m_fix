
instance DIA_GHORIM_EXIT(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 999;
	condition = dia_ghorim_exit_condition;
	information = dia_ghorim_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_ghorim_exit_condition()
{
	return 1;
};

func void dia_ghorim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GHORIM_MISSINGHARLOK(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 1;
	condition = dia_ghorim_missingharlok_condition;
	information = dia_ghorim_missingharlok_info;
	permanent = 0;
	description = "Привет! Как дела?";
};


func int dia_ghorim_missingharlok_condition()
{
	return 1;
};

func void dia_ghorim_missingharlok_info()
{
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//Привет! Как дела?
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_01");	//Устал я, парень, прямо с ног валюсь. Работаю уже два дня - и ни минуты отдыха.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_02");	//Харлок давным-давно должен был заступить на смену. С этим парнем всегда так.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_03");	//Небось, дрыхнет сейчас у себя дома!
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_04");	//А почему ты сам не можешь сходить к нему и привести сюда?
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_05");	//Я не могу уйти. Тут работа прежде всего.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_06");	//Может, ты сходишь вместо меня? Он живет под лабораторией Кор Галома, у Фортуно.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_07");	//Скажи ему, чтобы он немедленно тащил свою задницу сюда.
	Log_CreateTopic(CH1_GHORIMSRELIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_GHORIMSRELIEF,LOG_RUNNING);
	b_logentry(CH1_GHORIMSRELIEF,"Послушник Горим попросил меня позвать лентяя Харлока, который сможет его заменить. Я смогу найти его недалеко от дома Фортуно.");
	GHORIM_KICKHARLOK = LOG_RUNNING;
};


instance DIA_GHORIM_SUCCESS(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 1;
	condition = dia_ghorim_success_condition;
	information = dia_ghorim_success_info;
	permanent = 1;
	description = "Ну? Теперь ты свободен?";
};


func int dia_ghorim_success_condition()
{
	if(GHORIM_KICKHARLOK == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_ghorim_success_info()
{
	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00");	//Ну? Теперь ты свободен?
	AI_Output(self,other,"DIA_Ghorim_SUCCESS_02_01");	//Да, наконец-то я могу поспать. Спасибо, дружище!
};

