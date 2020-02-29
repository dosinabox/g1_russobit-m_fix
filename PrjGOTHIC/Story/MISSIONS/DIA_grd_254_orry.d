
instance DIA_ORRY_PREEXIT(C_INFO)
{
	npc = grd_254_orry;
	nr = 999;
	condition = dia_orry_preexit_condition;
	information = dia_orry_preexit_info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int dia_orry_preexit_condition()
{
	return 1;
};

func void dia_orry_preexit_info()
{
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Orry_PreExit_06_00");	//Постарайся добраться до Старого лагеря живым!
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORRY_EXIT(C_INFO)
{
	npc = grd_254_orry;
	nr = 999;
	condition = dia_orry_exit_condition;
	information = dia_orry_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_orry_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_preexit) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORRY_GUARDGATE(C_INFO)
{
	npc = grd_254_orry;
	nr = 2;
	condition = dia_orry_guardgate_condition;
	information = dia_orry_guardgate_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_orry_guardgate_condition()
{
	return 1;
};

func void dia_orry_guardgate_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_01");	//Контролирую, чтобы никто не подошел к месту обмена. В особенности эти головорезы из Нового лагеря.
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Orry_GuardGate_06_02");	//Ты новенький, не так ли? Тебя ведь только сегодня забросили к нам?
		AI_Output(other,self,"DIA_Orry_GuardGate_15_03");	//Да, все так и есть.
		AI_Output(self,other,"DIA_Orry_GuardGate_06_04");	//Держись подальше от парней из Нового лагеря!
		AI_Output(self,other,"DIA_Orry_GuardGate_06_05");	//Я, да и все остальные, кого ты видел в месте обмена, работаем на Старый лагерь.
		AI_Output(self,other,"DIA_Orry_GuardGate_06_06");	//С Диего... ты уже говорил с ним?
		Info_ClearChoices(dia_orry_guardgate);
		Info_AddChoice(dia_orry_guardgate,"Еще нет.",dia_orry_guardgate_no);
		Info_AddChoice(dia_orry_guardgate,"Да, поговорил.",dia_orry_guardgate_yes);
	};
};

func void dia_orry_guardgate_no()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//Еще нет.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01");	//Тогда сделай это! Он у нас единственный, кто занимается новичками.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02");	//Много знает о колонии, а это полезные знания для такого новичка, как ты.
	Info_ClearChoices(dia_orry_guardgate);
};

func void dia_orry_guardgate_yes()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00");	//Да, поговорил.
	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01");	//Хорошо. Тогда ты уже знаешь, что здесь к чему.
	Info_ClearChoices(dia_orry_guardgate);
};


instance DIA_ORRY_NEWCAMP(C_INFO)
{
	npc = grd_254_orry;
	nr = 1;
	condition = dia_orry_newcamp_condition;
	information = dia_orry_newcamp_info;
	permanent = 0;
	description = "Почему ты советуешь держаться подальше от людей из Нового лагеря?";
};


func int dia_orry_newcamp_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_newcamp_info()
{
	AI_Output(other,self,"DIA_Orry_NewCamp_15_00");	//Почему ты советуешь мне держаться подальше от людей из Нового лагеря?
	AI_Output(self,other,"DIA_Orry_NewCamp_06_01");	//Новый лагерь - это тебе не Старый, где тихо и безопасно.
	AI_Output(self,other,"DIA_Orry_NewCamp_06_02");	//Новый лагерь не получает товары из внешнего мира, поэтому все что им нужно, они просто крадут.
};


instance DIA_ORRY_OLDCAMP(C_INFO)
{
	npc = grd_254_orry;
	nr = 2;
	condition = dia_orry_oldcamp_condition;
	information = dia_orry_oldcamp_info;
	permanent = 0;
	description = "А Старый лагерь?";
};


func int dia_orry_oldcamp_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_oldcamp_info()
{
	AI_Output(other,self,"DIA_Orry_OldCamp_15_00");	//А Старый лагерь?
	AI_Output(self,other,"DIA_Orry_OldCamp_06_01");	//Здесь всем заправляют Бароны. Следом за ними идет Стража и Призраки. Ну, а рудокопы в самом низу этой цепочки.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_02");	//Каждый, кто прибывает сюда, сначала работает рудокопом. Если хочет чего-то больше, то ему придется потрудиться, чтобы потом стать Призраком.
};


instance DIA_ORRY_SHORE(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_shore_condition;
	information = dia_orry_shore_info;
	permanent = 0;
	description = "Когда я вышел на берег, один из типов встретил меня кулаком...";
};


func int dia_orry_shore_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_shore_info()
{
	AI_Output(other,self,"DIA_Orry_Shore_15_00");	//Когда я вышел на берег, один из типов встретил меня кулаком...
	AI_Output(self,other,"DIA_Orry_Shore_06_01");	//Так со всеми новенькими, своего рода 'боевое крещение'.
	AI_Output(other,self,"DIA_Orry_Shore_15_02");	//А в Старом лагере много еще таких людей?
	AI_Output(self,other,"DIA_Orry_Shore_06_03");	//Конечно, всегда можно встретить какого-нибудь негодяя, но если ты платишь за свою защиту, тебя не тронут.
};


instance DIA_ORRY_WOMAN(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_woman_condition;
	information = dia_orry_woman_info;
	permanent = 0;
	description = "Я видел, как сюда вместе с товарами отправили какую-то женщину.";
};


func int dia_orry_woman_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate))
	{
		return 1;
	};
};

func void dia_orry_woman_info()
{
	AI_Output(other,self,"DIA_Orry_Woman_15_00");	//Я видел, как сюда вместе с товарами отправили какую-то женщину.
	AI_Output(self,other,"DIA_Orry_Woman_06_01");	//Да, Бароны получают все, что хотят.
	AI_Output(other,self,"DIA_Orry_Woman_15_02");	//Ты хочешь сказать, что за руду король присылает сюда женщин?
	AI_Output(self,other,"DIA_Orry_Woman_06_03");	//Они такие же преступницы, как и все мы здесь. Они нужны Гомезу, а потому не сидят в тюремных стенах там.
	AI_Output(self,other,"DIA_Orry_Woman_06_04");	//Хотя, не знаю, что хуже...
};


instance DIA_ORRY_WAFFE(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_waffe_condition;
	information = dia_orry_waffe_info;
	permanent = 0;
	description = "Где здесь можно найти оружие?";
};


func int dia_orry_waffe_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 2)
	{
		return 1;
	};
};

func void dia_orry_waffe_info()
{
	AI_Output(other,self,"DIA_Orry_Waffe_15_00");	//Где здесь можно найти оружие?
	AI_Output(self,other,"DIA_Orry_Waffe_06_01");	//Возле Заброшенной шахты, может, что-нибудь найдешь, это немного дальше вниз по тропе.
	AI_Output(self,other,"DIA_Orry_Waffe_06_02");	//Но лучше в драку не лезть с какой-нибудь ржавой киркой в руках. Такие вещи тяжелые и неудобные, да и оружием не назовешь.
	AI_Output(self,other,"DIA_Orry_Waffe_06_03");	//Неопытному бойцу лучше таким оружием не драться, ну разве что в крайней необходимости.
};

