
instance DIA_BAALTONDRAL_MUTEEXIT(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 999;
	condition = dia_baaltondral_muteexit_condition;
	information = dia_baaltondral_muteexit_info;
	permanent = 0;
	description = "(ничего не говорить)";
};


func int dia_baaltondral_muteexit_condition()
{
	if(!Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_muteexit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTONDRAL_EXIT(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 999;
	condition = dia_baaltondral_exit_condition;
	information = dia_baaltondral_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baaltondral_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltondral_muteexit) || Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTONDRAL_FANATICTEACHER(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_fanaticteacher_condition;
	information = dia_baaltondral_fanaticteacher_info;
	permanent = 0;
	important = 1;
};


func int dia_baaltondral_fanaticteacher_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_baaltondral_fanaticteacher_info()
{
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00");	//Ты не похож на тех, кто служит Баронам.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01");	//Ты больше похож на того, кто ищет что-то. Я думаю, ты ищешь истинную веру. Разве ты не чувствуешь в себе огромное желание познать смысл твоего бытия?
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02");	//Я вижу в тебе сомнение, посеянное словами прислужников Баронов. Они выдают их за истинную монету, но ты-то чувствуешь, что все это ложь!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03");	//Они лгут, чтобы получить власть над теми, кто слаб духом. Но они не смогут одолеть твой дух своей ложью.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04");	//Ты же чувствуешь это стремление к свободе? Чувствуешь, как крепнет оно в тебе? Оно направляет твой дух. Не мешай ему.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05");	//Ты знаешь, что произойдет, если ты попытаешься его подавить? Ты будешь лгать самому себе! Перестань жить в тени собственных страхов.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06");	//Отбрось сомнения. Ты должен меня понять! Близится время пробуждения Спящего, и он освободит нас, а неверных жестоко покарает.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07");	//Будут они смыты с лица земли гневом его, и души их будут истреблены. Не помогут им тогда ни раскаяние, ни горькие мольбы о прощении. Будет слишком поздно.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08");	//За свои сомнения они заплатят ему жизнью.
};


instance DIA_BAALTONDRAL_YOUTALKED(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_youtalked_condition;
	information = dia_baaltondral_youtalked_info;
	permanent = 0;
	description = "Ты заговорил со мной. Значит, теперь я смогу обращаться к тебе?";
};


func int dia_baaltondral_youtalked_condition()
{
	return 1;
};

func void dia_baaltondral_youtalked_info()
{
	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00");	//Ты заговорил со мной. Значит, теперь я смогу обращаться к тебе?
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01");	//Я вижу, ты уже ознакомился с нашими правилами. Это похвально.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02");	//В тебе сокрыта великая духовная сила! Я чувствую это. Возможно, ты очень скоро будешь принят в наше Братство.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03");	//Я заговорил с тобой, дабы дать тебе шанс доказать нам свою преданность.
};


instance DIA_BAALTONDRAL_LOYALITY(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_loyality_condition;
	information = dia_baaltondral_loyality_info;
	permanent = 0;
	description = "Как я смогу доказать свою преданность?";
};


func int dia_baaltondral_loyality_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_youtalked) && (GETNEWGUY_DUSTY_JOINED == FALSE) && (KAPITEL < 4) && (GETNEWGUY_DUSTY_MOVING == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_loyality_info()
{
	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00");	//Как я смогу доказать свою преданность?
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01");	//Наше Братство нуждается в новых последователях, принявших учение Спящего.
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02");	//Если ты убедишь одного из неверных присоединиться к нам, ты покажешь, что твои намерения стать нашим братом в истинной вере, достаточно серьезны.
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"Идол Тондрал послал меня в Старый лагерь, чтобы найти человека, который согласится присоединиться к Братству. Это отличная возможность завоевать его расположение!");
	GETNEWGUY_STARTED = TRUE;
};


instance DIA_BAALTONDRAL_NEWMEMBER(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_newmember_condition;
	information = dia_baaltondral_newmember_info;
	permanent = 0;
	description = "А где я смогу найти такого человека?";
};


func int dia_baaltondral_newmember_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_newmember_info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00");	//А где я смогу найти такого человека?
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01");	//В Старом лагере ты сможешь найти тех, кто согласится принять нашу веру. Те, кто там живет, устали ото лжи и страха. Они не откажутся от дружеской поддержки.
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02");	//В Новом лагере люди не смогут воспринять наше духовное учение. Я думаю, там ты не сможешь никого убедить.
};


instance DIA_BAALTONDRAL_NEWMEMBER2(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_newmember2_condition;
	information = dia_baaltondral_newmember2_info;
	permanent = 0;
	description = "Зачем Братству новые люди?";
};


func int dia_baaltondral_newmember2_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_newmember2_info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00");	//Зачем Братству новые люди?
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01");	//В одном из видений Спящий передал нашему Учителю послание.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02");	//Чтобы он пробудился и указал нам истинный путь, ему нужна наша помощь, наша духовная сила.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03");	//Поэтому мы готовим великую Церемонию, во время которой мы объединим наши мысли. Для этого нам потребуется очень много людей.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04");	//Если ты желаешь узнать больше, иди на площадь перед Храмом. Только не нарушай покой нашего Учителя.
};


instance DIA_BAALTONDRAL_DUSTYSUCCESS(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_dustysuccess_condition;
	information = dia_baaltondral_dustysuccess_info;
	permanent = 0;
	description = "Cо мной пришел человек, который хочет познакомиться с тобой.";
};


func int dia_baaltondral_dustysuccess_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_youtalked) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_dustysuccess_info()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00");	//Учитель, со мной пришел человек, который хочет познакомиться с тобой.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01");	//Кто это с тобой? Он достоин?
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02");	//Ему нужно духовное наставление, Учитель.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03");	//Хорошо. С этого дня он будет моим учеником.
	AI_TurnToNPC(self,dusty);
	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04");	//Ты должен будешь приходить ко мне каждый день и внимать моим словам. Я еще могу спасти твою душу.
	b_logentry(CH1_RECRUITDUSTY,"Дасти стал учеником Идола Тондрала. Я выполнил свое задание.");
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_SUCCESS);
	b_givexp(XP_DELIVEREDDUSTY);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};

instance DIA_BAALTONDRAL_SENDTOKALOM(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_sendtokalom_condition;
	information = dia_baaltondral_sendtokalom_info;
	permanent = 0;
	description = "Учитель! Я хочу вступить в Братство. Помоги мне.";
};


func int dia_baaltondral_sendtokalom_condition()
{
	if((Npc_KnowsInfo(hero,dia_baaltondral_dustysuccess) || Npc_KnowsInfo(hero,dia_melvin_metdusty2)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_sendtokalom_info()
{
	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00");	//Учитель! Я хочу вступить в Братство. Помоги мне.
	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01");	//Ты доказал нам свою преданность. Иди к Кор Галому. Он даст тебе одеяние послушника.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"Я привел нового человека в Лагерь сектантов. Теперь Идол Тондрал считает меня достойным носить одежду послушника!");
};

