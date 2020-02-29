
instance DIA_SKIP_EXIT(C_INFO)
{
	npc = grd_211_skip;
	nr = 999;
	condition = dia_skip_exit_condition;
	information = dia_skip_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_skip_exit_condition()
{
	return 1;
};

func void dia_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


var int skip_tradefree;

instance DIA_SKIP_FIRST(C_INFO)
{
	npc = grd_211_skip;
	nr = 1;
	condition = dia_skip_first_condition;
	information = dia_skip_first_info;
	permanent = 0;
	description = "Что ты делаешь?";
};


func int dia_skip_first_condition()
{
	if(!(Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF))
	{
		return 1;
	};
};

func void dia_skip_first_info()
{
	AI_Output(other,self,"DIA_Skip_First_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Skip_First_12_01");	//Моя работа - это оружие для стражников.
	AI_Output(other,self,"DIA_Skip_First_15_02");	//Ты продаешь оружие?
	AI_Output(self,other,"DIA_Skip_First_12_03");	//Да, Гомезу и его людям.
	if(!Npc_KnowsInfo(hero,dia_raven_equipment))
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"Стражник Скип во внутреннем дворе замка продает оружие. Но купить его могут только люди Гомеза.");
	};
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"Понятно. До встречи!",dia_skip_first_back);
	Info_AddChoice(dia_skip_first,"Торус сказал, что ты сможешь подобрать мне оружие.",dia_skip_first_thorus);
	Info_AddChoice(dia_skip_first,"Гомез прислал меня к тебе. Я должен подобрать себе снаряжение.",dia_skip_first_gomez);
};

func void dia_skip_first_gomez()
{
	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00");	//Гомез прислал меня к тебе. Я должен подобрать себе снаряжение.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01");	//Как обычно, да? Новые доспехи и лучшее оружие из того, что у меня есть.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02");	//Убирайся отсюда, пока я не разозлился!
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00");	//Торус отправил меня к тебе. Сказал, что ты сможешь подобрать мне оружие.
	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01");	//Даже так?
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"А ты сам у него спроси.",dia_skip_first_thorus_askhim);
	Info_AddChoice(dia_skip_first,"Он сказал, что если ты не выдашь мне оружие, я могу у тебя его отобрать.",dia_skip_first_thorus_kickass);
	Info_AddChoice(dia_skip_first,"Я должен выполнить одно его задание...",dia_skip_first_thorus_stranger);
};

func void dia_skip_first_back()
{
	AI_Output(other,self,"DIA_Skip_First_BACK_15_00");	//Понятно. До встречи!
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_stranger()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00");	//Я должен выполнить одно его задание. Никто из вас не сможет его сделать.
	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01");	//Да? И он первым делом решил отправить тебя ко мне, верно?
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"А ты сам у него спроси.",dia_skip_first_thorus_askhim);
	Info_AddChoice(dia_skip_first,"Он велел пинать твою задницу, пока ты не выдашь мне оружие.",dia_skip_first_thorus_kickassagain);
};

func void dia_skip_first_thorus_kickass()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00");	//Он велел пинать твою тощую задницу до тех пор, пока ты не выдашь мне оружие.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01");	//В самом деле? Мне кажется, если ты не уберешься отсюда достаточно быстро, то я буду пинать твою задницу.
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_askhim()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00");	//А ты сам у него спроси.
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01");	//Именно это я и сделаю, только попозже. Уверен, что он захочет услышать все, что ты говорил о нем.
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02");	//Не знаю, кто тебя впустил, но на твоем месте я бы поскорее убрался отсюда!
	};
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_kickassagain()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00");	//Он сказал, что если ты не выдашь мне оружие, я могу у тебя его отобрать.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01");	//Хорошо, приятель. Что тебе нужно?
	Info_ClearChoices(dia_skip_first);
	SKIP_TRADEFREE = TRUE;
};


instance DIA_SKIP_VERPATZT(C_INFO)
{
	npc = grd_211_skip;
	nr = 1;
	condition = dia_skip_verpatzt_condition;
	information = dia_skip_verpatzt_info;
	permanent = 1;
	description = "Я подумал, что неплохо было поговорить с тобой о снаряжении.";
};


func int dia_skip_verpatzt_condition()
{
	if(!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)) && (Npc_KnowsInfo(hero,dia_skip_first) && (SKIP_TRADEFREE == FALSE)))
	{
		return 1;
	};
};

func void dia_skip_verpatzt_info()
{
	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00");	//Я просто подумал, что неплохо было бы поговорить с тобой о снаряжении.
	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01");	//Убирайся отсюда!
};


instance GRD_211_SKIP_TRADE(C_INFO)
{
	npc = grd_211_skip;
	condition = grd_211_skip_trade_condition;
	information = grd_211_skip_trade_info;
	permanent = 1;
	description = "Я подумал, что неплохо было поговорить с тобой о снаряжении.";
	trade = 1;
};


func int grd_211_skip_trade_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF) || (SKIP_TRADEFREE == TRUE))
	{
		return TRUE;
	};
};

func void grd_211_skip_trade_info()
{
	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01");	//Я просто подумал, что неплохо было бы поговорить с тобой о снаряжении.
	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02");	//Если надо, могу кое-что продать.
};


instance GRD_211_SKIP_WELCOME(C_INFO)
{
	npc = grd_211_skip;
	condition = grd_211_skip_welcome_condition;
	information = grd_211_skip_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_211_skip_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_211_skip_welcome_info()
{
	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01");	//Эй, ты не плохо тут разошелся для новичка.
};

