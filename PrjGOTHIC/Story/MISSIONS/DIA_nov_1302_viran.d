
instance DIA_VIRAN_EXIT(C_INFO)
{
	npc = nov_1302_viran;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_viran_exit_condition()
{
	return 1;
};

func void dia_viran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VIRAN_WHAT(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_what_condition;
	information = dia_viran_what_info;
	permanent = 0;
	description = "Что у тебя за работа?";
};


func int dia_viran_what_condition()
{
	return 1;
};

func void dia_viran_what_info()
{
	AI_Output(other,self,"DIA_Viran_What_15_00");	//Что у тебя за работа?
	AI_Output(self,other,"DIA_Viran_What_07_01");	//Собираю болотник. Другие братья обработают его должным образом, и его можно будет курить.
	AI_Output(self,other,"DIA_Viran_What_07_02");	//Болота очень опасны, здесь водятся твари, убивающие всех без разбора, но болотник растет только здесь. Но это только к лучшему.
	AI_Output(other,self,"DIA_Viran_What_15_03");	//Почему?
	AI_Output(self,other,"DIA_Viran_What_07_04");	//Потому что никто из двух других лагерей сюда не заглядывает. Из всех людей в колонии только мы можем добывать болотник.
	AI_Output(self,other,"DIA_Viran_What_07_05");	//Мы продаем его другим лагерям, и сами назначаем цены.
};


instance DIA_VIRAN_FETCHWEED(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_fetchweed_condition;
	information = dia_viran_fetchweed_info;
	permanent = 0;
	description = "Я от Идола Орана. Я должен доставить Кор Галому урожай болотника.";
};


func int dia_viran_fetchweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_viran_fetchweed_info()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00");	//Меня прислал Идол Оран. Я должен доставить Кор Галому урожай болотника.
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01");	//Ты думаешь, все так просто, да?
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02");	//Так может любой прийти и сказать: 'Меня прислал Идол Оран', а потом не найдешь ни его, ни болотника.
	Info_ClearChoices(dia_viran_fetchweed);
	Info_AddChoice(dia_viran_fetchweed,"Ну сходи и спроси у него сам, если мне не веришь!",dia_viran_fetchweed_gotohim);
	Info_AddChoice(dia_viran_fetchweed,"Но меня действительно послал Идол Оран!",dia_viran_fetchweed_really);
};

func void dia_viran_fetchweed_really()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00");	//Но меня действительно послал Идол Оран!
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//Ну да, как же.
};

func void dia_viran_fetchweed_gotohim()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00");	//Ну сходи и спроси у него сам, если мне не веришь!
	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01");	//У меня есть идея получше. Ты докажешь, что работаешь на нас, если выполнишь одно маленькое задание!
	Info_ClearChoices(dia_viran_fetchweed);
};


var int viran_bloodflies;

instance DIA_VIRAN_BLOODFLIES(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_bloodflies_condition;
	information = dia_viran_bloodflies_info;
	permanent = 0;
	description = "И что я должен сделать?";
};


func int dia_viran_bloodflies_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_fetchweed))
	{
		return 1;
	};
};

func void dia_viran_bloodflies_info()
{
	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01");	//Все очень просто. Как я уже говорил, здесь опасно работать. Но вот чертовы шершни нас совсем извели.
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02");	//Без них нам было бы гораздо лучше! Теперь тебе все понятно?
	VIRAN_BLOODFLIES = LOG_RUNNING;
	b_logentry(CH1_DELIVERWEED,"Вайран отдаст мне урожай болотника после того, как я убью всех шершней в округе.");
};


var int viran_botenday;

instance DIA_VIRAN_RUNNING(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_running_condition;
	information = dia_viran_running_info;
	permanent = 1;
	description = "Но я не вижу здесь никаких шершней.";
};


func int dia_viran_running_condition()
{
	if(VIRAN_BLOODFLIES == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_viran_running_info()
{
	AI_Output(other,self,"DIA_Viran_Running_15_00");	//Но я не вижу здесь никаких шершней.
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,bloodfly,zs_mm_rtn_wusel,-1) && (Npc_GetDistToNpc(self,other) < 2000))
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_00");	//Ну, они летают в десятке метров от нас. Сам посмотри!
		AI_Output(self,hero,"DIA_Viran_Running_07_01");	//Просто так ты не отделаешься!
	}
	else
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_02");	//О, шершней больше нигде не видно. Хорошая работа!
		AI_Output(self,hero,"DIA_Viran_Running_07_03");	//Ее смог бы сделать либо полный идиот, либо один из нас.
		AI_Output(self,hero,"DIA_Viran_Running_07_04");	//А идиоту не хватит ума, чтобы обмануть меня, я прав?
		AI_Output(self,hero,"DIA_Viran_Running_07_05");	//Вот, возьми урожай и отнеси его Кор Галому.
		b_printtrademsg1("Получен болотник (50).");
		AI_Output(self,hero,"DIA_Viran_Running_07_06");	//Если он скажет, что этого слишком мало, предложи ему самому попробовать поработать здесь, тогда-то он узнает, как нам достается болотник.
		b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
		if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
		{
			b_logentry(CH1_DELIVERWEED,"Вайран отдал мне вторую половину урожая болотника. Посмотрим, что скажет на это Кор Галом.");
		}
		else
		{
			b_logentry(CH1_DELIVERWEED,"Вайран дал мне урожай болотника. Его оказалось слишком мало. Мне кажется, он дал мне только половину.");
		};
		b_givexp(XP_WEEDFROMVIRAN);
		VIRAN_BLOODFLIES = LOG_SUCCESS;
		VIRAN_BOTENDAY = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};


instance DIA_VIRAN_PERM(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_perm_condition;
	information = dia_viran_perm_info;
	permanent = 1;
	description = "Как идет сбор урожая?";
};


func int dia_viran_perm_condition()
{
	if(VIRAN_BLOODFLIES == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_viran_perm_info()
{
	AI_Output(other,self,"DIA_Viran_Perm_15_00");	//Как идет сбор урожая?
	AI_Output(self,other,"DIA_Viran_Perm_07_01");	//Да, да, посмейся. Уверен, что Гуру поручают тебе работу получше, чем у нас.
	AI_Output(self,other,"DIA_Viran_Perm_07_02");	//Ну, я-то все равно не сам здесь гну спину. Для этого есть 'пехота'.
};


instance DIA_VIRAN_RIPOFF(C_INFO)
{
	npc = nov_1302_viran;
	nr = 5;
	condition = dia_viran_ripoff_condition;
	information = dia_viran_ripoff_info;
	permanent = 0;
	description = "Я снова пришел за урожаем для Кор Галома.";
};


func int dia_viran_ripoff_condition()
{
	if((VIRAN_BOTENDAY <= (Wld_GetDay() - 2)) && (VIRAN_BLOODFLIES == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_viran_ripoff_info()
{
	AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//Я снова пришел за урожаем для Кор Галома.
	AI_Output(self,other,"DIA_Viran_RipOff_07_01");	//Как, опять?
	AI_Output(other,self,"DIA_Viran_RipOff_15_02");	//Только не говори мне, что теперь нужно поубивать всех болотожоров в округе, чтобы доказать тебе, что это правда. У меня нет времени.
	AI_Output(self,other,"DIA_Viran_RipOff_07_03");	//Да, ладно! Забирай уж этот чертов болотник!
	b_printtrademsg1("Получен болотник (50).");
	CreateInvItems(self,itmi_plants_swampherb_01,50);
	b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
};

