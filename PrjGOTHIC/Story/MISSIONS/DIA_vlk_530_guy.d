
instance DIA_GUY_EXIT(C_INFO)
{
	npc = vlk_530_guy;
	nr = 999;
	condition = dia_guy_exit_condition;
	information = dia_guy_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_guy_exit_condition()
{
	return 1;
};

func void dia_guy_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GUY_HELLO(C_INFO)
{
	npc = vlk_530_guy;
	nr = 2;
	condition = dia_guy_hello_condition;
	information = dia_guy_hello_info;
	permanent = 0;
	description = "Привет!";
};


func int dia_guy_hello_condition()
{
	if(KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_guy_hello_info()
{
	AI_Output(other,self,"DIA_Guy_Hello_15_00");	//Привет!
	AI_Output(self,other,"DIA_Guy_Hello_03_01");	//Хм? Раньше я тебя здесь не видел. Ты новенький?
	AI_Output(other,self,"DIA_Guy_Hello_15_02");	//Я прибыл сюда недавно...
	AI_Output(self,other,"DIA_Guy_Hello_03_03");	//Уже решил, к какому лагерю лучше присоединиться?
	AI_Output(other,self,"DIA_Guy_Hello_15_04");	//Нет, а ты можешь что-то посоветовать?
	AI_Output(self,other,"DIA_Guy_Hello_03_05");	//Все лагеря разные, каждый может предложить что-то свое.
	AI_Output(self,other,"DIA_Guy_Hello_03_06");	//Пока ты не решил, в каком лагере останешься, ты можешь пожить в этой хижине. Она недавно освободилась.
};


instance DIA_GUY_ADOC(C_INFO)
{
	npc = vlk_530_guy;
	nr = 2;
	condition = dia_guy_adoc_condition;
	information = dia_guy_adoc_info;
	permanent = 1;
	description = "Каковы преимущества Старого лагеря?";
};


func int dia_guy_adoc_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adoc_info()
{
	AI_Output(other,self,"DIA_Guy_AdOC_15_00");	//Каковы преимущества Старого лагеря?
	AI_Output(self,other,"DIA_Guy_AdOC_03_01");	//Если ты будешь платить стражникам, они будут помогать тебе, защищать от всяческих неприятностей. Они быстро разбираются с теми, кто решил напасть на одного из их подопечных.
	AI_Output(self,other,"DIA_Guy_AdOC_03_02");	//Кроме того, в нашем лагере товары из внешнего мира стоят не так дорого, как в других лагерях.
	Info_ClearChoices(dia_guy_adoc);
	Info_AddChoice(dia_guy_adoc,"Ладно, о Старом лагере я уже кое-что знаю...",dia_guy_adoc_back);
	Info_AddChoice(dia_guy_adoc,"Какие товары считаются здесь самыми ценными?",dia_guy_adoc_warez);
	Info_AddChoice(dia_guy_adoc,"А что, если двое, которых защищают, подерутся между собой?",dia_guy_adoc_protection);
};

func void dia_guy_adoc_back()
{
	AI_Output(other,self,"DIA_Guy_AdOC_BACK_15_00");	//Ладно, о Старом лагере я уже кое-что знаю...
	AI_Output(self,other,"DIA_Guy_AdOC_BACK_03_01");	//Лично мне здесь нравится.
	Info_ClearChoices(dia_guy_adoc);
};

func void dia_guy_adoc_warez()
{
	AI_Output(other,self,"DIA_Guy_AdOC_Warez_15_00");	//Какие товары считаются здесь самыми ценными?
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_01");	//Все товары из внешнего мира: хлеб, сыр, ветчина и, конечно же, пиво и вино - настоящая выпивка, в отличие от рисового шнапса, дешевого пойла из Нового лагеря.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_02");	//Оружие у нас продают по хорошей цене, а вот доспехи очень дорогие.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_03");	//Стражники забрали себе все пригодные доспехи, которые раньше носили убитые ими тюремщики.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_04");	//Такие доспехи стали их отличительным знаком, ведь их кому попало не продают. Чужаку их точно не видать.
};

func void dia_guy_adoc_protection()
{
	AI_Output(other,self,"DIA_Guy_AdOC_Protection_15_00");	//А что произойдет, если два человека, которые отдают руду за защиту, подерутся между собой?
	AI_Output(self,other,"DIA_Guy_AdOC_Protection_03_01");	//Стражники не будут вмешиваться в драку. Они просто подождут чем все закончится и потом накажут нарушителей.
};


instance DIA_GUY_ADNC(C_INFO)
{
	npc = vlk_530_guy;
	nr = 3;
	condition = dia_guy_adnc_condition;
	information = dia_guy_adnc_info;
	permanent = 0;
	description = "Каковы преимущества Нового лагеря?";
};


func int dia_guy_adnc_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adnc_info()
{
	AI_Output(other,self,"DIA_Guy_AdNC_15_00");	//Каковы преимущества Нового лагеря?
	AI_Output(self,other,"DIA_Guy_AdNC_03_01");	//Если тебе нравится жить там, где каждый может убить тебя из-за куска хлеба, то тебе там самое место.
	AI_Output(self,other,"DIA_Guy_AdNC_03_02");	//Нет, конечно, там не так уж плохо. Хотя и не так, как здесь.
	AI_Output(self,other,"DIA_Guy_AdNC_03_03");	//В нашем лагере Гомез старается следить за порядком. А там нет никаких законов.
	AI_Output(self,other,"DIA_Guy_AdNC_03_04");	//Маги Воды могли бы наладить там жизнь, но они не хотят заниматься чужими проблемами, все свое время они исследуют Барьер.
};


instance DIA_GUY_ADST(C_INFO)
{
	npc = vlk_530_guy;
	nr = 4;
	condition = dia_guy_adst_condition;
	information = dia_guy_adst_info;
	permanent = 0;
	description = "А что ты можешь рассказать мне о лагере Сектантов?";
};


func int dia_guy_adst_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adst_info()
{
	AI_Output(other,self,"DIA_Guy_AdST_15_00");	//А что ты можешь рассказать мне о Лагере сектантов?
	AI_Output(self,other,"DIA_Guy_AdST_03_01");	//Спроси лучше об этом тех, кто оттуда приходит.
	AI_Output(self,other,"DIA_Guy_AdST_03_02");	//В нашем лагере всегда можно найти пару их послушников, они-то и смогут рассказать тебе о своем лагере.
	AI_Output(self,other,"DIA_Guy_AdST_03_03");	//Сам я никогда там не был. Но у нас говорят, что они очень щедры.
	AI_Output(self,other,"DIA_Guy_AdST_03_04");	//Им постоянно нужны новые люди, и они переманивают их из других лагерей.
};


instance DIA_GUY_MYOWNHUT(C_INFO)
{
	npc = vlk_530_guy;
	nr = 10;
	condition = dia_guy_myownhut_condition;
	information = dia_guy_myownhut_info;
	permanent = 1;
	description = "Здесь есть пустой дом, в котором я могу переночевать?";
};


func int dia_guy_myownhut_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_myownhut_info()
{
	AI_Output(other,self,"DIA_Guy_MyOwnHut_15_00");	//Здесь есть пустой дом, в котором я могу переночевать?
	AI_PointAt(self,"OCR_HUT_26");
	AI_Output(self,other,"DIA_Guy_MyOwnHut_03_01");	//Вон там наверху есть дом с небольшим навесом, и он никем не занят.
	AI_StopPointAt(self);
};

