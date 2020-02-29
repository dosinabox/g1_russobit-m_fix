
instance DIA_SNAF_EXIT(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 999;
	condition = dia_snaf_exit_condition;
	information = dia_snaf_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_snaf_exit_condition()
{
	return 1;
};

func void dia_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNAF_HELLO(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_hello_condition;
	information = dia_snaf_hello_info;
	permanent = 0;
	description = "Как у тебя дела?";
};


func int dia_snaf_hello_condition()
{
	return 1;
};

func void dia_snaf_hello_info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Неплохо. Если умеешь хорошо готовить, друзья к тебе сами придут.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Хочешь попробовать тушеный рис? Вот возьми, и сам убедись, как это вкусно.
	b_printtrademsg1("Получен рис.");
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Спасибо.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//А ты мог бы мне помочь.
	CreateInvItem(self,itforice);
	b_giveinvitems(self,other,itforice,1);
};

instance DIA_SNAF_ZUTATEN(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_zutaten_condition;
	information = dia_snaf_zutaten_info;
	permanent = 0;
	description = "Что тебе нужно?";
};


func int dia_snaf_zutaten_condition()
{
	if(Npc_KnowsInfo(hero,dia_snaf_hello))
	{
		return 1;
	};
};

func void dia_snaf_zutaten_info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Думаю, ты любишь вкусно поесть. Я придумал новое блюдо: рагу из мясных жуков а-ля Снэф с рисом и грибами.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Я дам тебе столько рагу, сколько захочешь, но для его приготовления мне нужно три жука и немного грибов. Пяти должно быть достаточно.
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//Когда ты выйдешь через южные ворота - там, где разрушенная башня, - ты сразу увидишь поляну, на которой они растут.
	Info_ClearChoices(dia_snaf_zutaten);
	Info_AddChoice(dia_snaf_zutaten,"Ты хочешь меня отравить?",dia_snaf_zutaten_kotz);
	Info_AddChoice(dia_snaf_zutaten,"Мне нравится идея с рагу.",dia_snaf_zutaten_doit);
};

func void dia_snaf_zutaten_kotz()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Ты хочешь меня отравить?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Если не хочешь есть, не ешь. Никто не заставляет. Но может быть, ты все же попробуешь? Если достанешь все, что мне нужно, приходи.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Я уже просил кого-то сходить за грибами, но он так и не вернулся. Наверное, ушел в Новый лагерь.
	SNAF_ZUTATEN = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAFSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_RUNNING);
	b_logentry(CH1_SNAFSRECIPE,"Повар Снэф из Старого лагеря попросил меня найти для него трех мясных жуков и пять адских грибов. Он хочет приготовить новое блюдо.");
	Info_ClearChoices(dia_snaf_zutaten);
};

func void dia_snaf_zutaten_doit()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//Мне нравится идея с рагу.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Тогда постарайся достать мне нужные ингредиенты.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Тот, кого я в последний раз отправлял за ними, так и не вернулся. Наверное, ушел в Новый лагерь.
	SNAF_ZUTATEN = LOG_RUNNING;
	SNAF_FREEMBRAGOUT = TRUE;
	Log_CreateTopic(CH1_SNAFSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_RUNNING);
	b_logentry(CH1_SNAFSRECIPE,"Повар Снэф из Старого лагеря попросил меня найти для него трех мясных жуков и пять адских грибов. Он хочет приготовить новое блюдо. Я тоже смогу его попробовать.");
	Info_ClearChoices(dia_snaf_zutaten);
};


instance DIA_SNAF_ZUTATENSUCCESS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_zutatensuccess_condition;
	information = dia_snaf_zutatensuccess_info;
	permanent = 0;
	description = "Я достал все ингредиенты, посмотри.";
};


func int dia_snaf_zutatensuccess_condition()
{
	if((SNAF_ZUTATEN == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_mushroom_01) >= 5) && (Npc_HasItems(other,itat_meatbug_01) >= 3))
	{
		return 1;
	};
};

var int snaf_ragoutday;

func void dia_snaf_zutatensuccess_info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Я достал все ингредиенты, посмотри.
	b_printtrademsg1("Отданы адские грибы и мясо жуков.");
	Npc_RemoveInvItems(hero,itfo_plants_mushroom_01,5);
	Npc_RemoveInvItems(hero,itat_meatbug_01,3);
	if(Wld_IsTime(8,0,22,0) && Npc_GetDistToWP(self,"OCR_CAULDRON_2") < 230)
	{
		AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//Хорошо! Теперь их нужно положить в котел, и рагу будет готово... Вот так...
		AI_UseMob(self,"CAULDRON",1);
		AI_Wait(self,2);
		AI_UseMob(self,"CAULDRON",-1);
		AI_Output(self,other,"DIA_Snaf_Hello_01_02_01");	//Вот возьми, и сам убедись, как это вкусно.
		b_printtrademsg2("Получено рагу из жуков.");
		CreateInvItems(hero,itfomeatbugragout,1);
		SNAF_RAGOUTDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Неплохо. Если умеешь хорошо готовить, друзья к тебе сами придут.
		SNAF_RAGOUTDAY = Wld_GetDay();
	};
	SNAF_ZUTATEN = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_SUCCESS);
	b_logentry(CH1_SNAFSRECIPE,"Снэф остался доволен тем, что я принес ему необходимые ингредиенты.");
	if(SNAF_FREEMBRAGOUT == TRUE)
	{
		b_logentry(CH1_SNAFSRECIPE,"Теперь я смогу каждый день получать у него порцию рагу из мясных жуков.");
	};
	b_givexp(100);
	AI_StopProcessInfos(self);
};

instance DIA_SNAF_AFTERSUCCESS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_aftersuccess_condition;
	information = dia_snaf_aftersuccess_info;
	permanent = 1;
	description = "Ты говорил, что я могу взять столько порций, сколько захочу...";
};


func int dia_snaf_aftersuccess_condition()
{
	if((SNAF_ZUTATEN == LOG_SUCCESS) && (SNAF_FREEMBRAGOUT == TRUE))
	{
		return 1;
	};
};

func void dia_snaf_aftersuccess_info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Ты говорил, что я могу взять столько порций, сколько захочу...
	if(SNAF_RAGOUTDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//Да, так и есть. Вот, возьми три порции.
		b_printtrademsg1("Получено 3 порции рагу из жуков.");
		CreateInvItems(self,itfomeatbugragout,3);
		b_giveinvitems(self,other,itfomeatbugragout,3);
		SNAF_RAGOUTDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Конечно! Но сегодняшнее рагу закончилось. Приходи завтра.
	};
};


instance DIA_SNAF_WHEREMEATBUGS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 3;
	condition = dia_snaf_wheremeatbugs_condition;
	information = dia_snaf_wheremeatbugs_info;
	permanent = 0;
	description = "Ты знаешь, где найти жуков?";
};


func int dia_snaf_wheremeatbugs_condition()
{
	if(SNAF_ZUTATEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_snaf_wheremeatbugs_info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Ты знаешь, где найти жуков?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Там, где много мусора. Возле стен лагеря есть несколько заброшенных домов, может быть, там ты что-нибудь найдешь.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//На первый взгляд они кажутся несъедобными, но это обманчивое впечатление. Из них получается отличное рагу.
	b_logentry(CH1_SNAFSRECIPE,"Мясных жуков можно найти в заброшенных домах у стен замка.");
};


instance DIA_SNAF_WHERENEK(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 5;
	condition = dia_snaf_wherenek_condition;
	information = dia_snaf_wherenek_info;
	permanent = 0;
	description = "А как звали того, кого ты посылал за грибами до меня?";
};


func int dia_snaf_wherenek_condition()
{
	if(SNAF_ZUTATEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_snaf_wherenek_info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//А как звали того, кого ты посылал за грибами до меня?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Нек. Ему здесь не очень нравилось. Думаю, он уже сидит где-нибудь в Новом лагере.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Я посылал его за грибами, но он так и не вернулся...
	if((SLY_LOSTNEK != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"Повар Снэф послал Нека за грибами. После этого он его ни разу не видел.");
	};
};

