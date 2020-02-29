
instance DIA_GOMEZ_EXIT(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 999;
	condition = dia_gomez_exit_condition;
	information = dia_gomez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gomez_exit_condition()
{
	return 1;
};

func void dia_gomez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_FAULT(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_fault_condition;
	information = dia_gomez_fault_info;
	permanent = 0;
	description = "Я пришел предложить свою помощь.";
};


func int dia_gomez_fault_condition()
{
	if(!Npc_KnowsInfo(hero,dia_raven_there))
	{
		return 1;
	};
};

func void dia_gomez_fault_info()
{
	AI_Output(other,self,"DIA_Gomez_Fault_15_00");	//Я пришел предложить свою помощь.
	AI_Output(self,other,"DIA_Gomez_Fault_11_01");	//Ты врываешься сюда и думаешь, что я стану слушать тебя, червяк?! Стража!
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


var int gomez_kontakte;

instance DIA_GOMEZ_HELLO(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_hello_condition;
	information = dia_gomez_hello_info;
	permanent = 1;
	description = "Я пришел, чтобы предложить свои услуги.";
};


func int dia_gomez_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_there) && (GOMEZ_KONTAKTE < 4))
	{
		return 1;
	};
};

func void dia_gomez_hello_info()
{
	AI_Output(other,self,"DIA_Gomez_Hello_15_00");	//Я пришел, чтобы предложить свои услуги.
	AI_Output(self,other,"DIA_Gomez_Hello_11_01");	//С чего ты взял, что мне нужны твои услуги?
	Info_ClearChoices(dia_gomez_hello);
	Info_AddChoice(dia_gomez_hello,"Надеюсь, мне не придется сносить вам голову...",dia_gomez_hello_kopfab);
	Info_AddChoice(dia_gomez_hello,"Да везде одни болваны, которые не хотят работать.",dia_gomez_hello_spinner);
	Info_AddChoice(dia_gomez_hello,"Я много путешествовал, и у меня много знакомых в других лагерях.",dia_gomez_hello_kontakte);
	Info_AddChoice(dia_gomez_hello,"Я прошел испытание, и Торус сказал, что я могу быть полезен.",dia_gomez_hello_thorussays);
};

func void dia_gomez_hello_thorussays()
{
	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00");	//Я прошел испытание, и Торус сказал, что я могу быть полезен.
	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01");	//Конечно, если бы это было не так, ты уже был бы мертв. Но я надеюсь, что ты способен на большее.
};

func void dia_gomez_hello_kontakte()
{
	GOMEZ_KONTAKTE = 0;
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00");	//Я много путешествовал по колонии и у меня много знакомых в других лагерях.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01");	//Да, хорошее начало. И с кем же ты там знаком?
	Info_ClearChoices(dia_gomez_hello);
	Info_AddChoice(dia_gomez_hello,"Это самые влиятельные люди.",dia_gomez_hello_kontakte_thatsall);
	Info_AddChoice(dia_gomez_hello,"Несколько воришек из Нового лагеря.",dia_gomez_hello_kontakte_nlhehler);
	Info_AddChoice(dia_gomez_hello,"Ларс.",dia_gomez_hello_kontakte_lares);
	Info_AddChoice(dia_gomez_hello,"Пара Идолов из Братства.",dia_gomez_hello_kontakte_baals);
	Info_AddChoice(dia_gomez_hello,"Кор Галом.",dia_gomez_hello_kontakte_kalom);
	if(GOMEZ_KONTAKTE < 3)
	{
		Info_AddChoice(dia_gomez_hello,"Юберион.",dia_gomez_hello_kontakte_yberion);
	};
};

func void dia_gomez_hello_spinner()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00");	//Да везде одни болваны, которые не хотят работать и все что могут, так это перекладывать все на плечи новичков.
	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01");	//Может быть, почти все, что ты сказал, правда. Но я все еще не понимаю, зачем мне нанимать на службу очередного болвана.
};

func void dia_gomez_hello_kopfab()
{
	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00");	//Надеюсь, мне не придется сносить вам голову в доказательство моего умения владеть оружием.
	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01");	//Интересно. В тебе сочетаются смелость и безумство.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_gomez_hello_kontakte_yberion()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00");	//Юберион.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01");	//Юберион вряд ли стал бы иметь с тобой дело.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02");	//Ты лжешь мне. Думаешь, меня так просто обмануть?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03");	//Зря ты повел себя так. Ты разочаровал меня.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04");	//А я ненавижу разочарование.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_gomez_hello_kontakte_kalom()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00");	//Кор Галом.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01");	//И?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_baals()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00");	//Пара Идолов из Братства.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01");	//И?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_lares()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00");	//Ларс.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01");	//И?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_nlhehler()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00");	//Несколько воришек из Нового лагеря.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01");	//Еще.
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_thatsall()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00");	//Это самые влиятельные люди.
	if(GOMEZ_KONTAKTE >= 4)
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01");	//Неплохо для такого новичка как ты...
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02");	//Что ж, может быть я дам тебе шанс.
		Info_ClearChoices(dia_gomez_hello);
	}
	else
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00");	//И ты хочешь меня этим удивить? В нашем лагере даже у некоторых рудокопов связи получше, чем у тебя.
		Info_ClearChoices(dia_gomez_hello);
	};
};


instance DIA_GOMEZ_DABEI(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_dabei_condition;
	information = dia_gomez_dabei_info;
	permanent = 0;
	description = "Это значит, что я принят?";
};


func int dia_gomez_dabei_condition()
{
	if((GOMEZ_KONTAKTE >= 3) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_gomez_dabei_info()
{
	AI_Output(other,self,"DIA_Gomez_Dabei_15_00");	//Это значит, что я принят?
	AI_Output(self,other,"DIA_Gomez_Dabei_11_01");	//Ты прав. Теперь ты один из нас.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_02");	//Иди к Равену. Он все тебе расскажет.
	Npc_SetTrueGuild(hero,GIL_STT);
	hero.guild = GIL_STT;
	b_givexp(XP_BECOMESHADOW);
	b_logentry(CH1_JOINOC,"С сегодняшнего дня я работаю на Гомеза из Старого лагеря. Равен расскажет мне, что нужно делать.");
	Log_SetTopicStatus(CH1_JOINOC,LOG_SUCCESS);
	Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINNC,LOG_FAILED);
	b_logentry(CH1_JOINNC,"Я стал одним из людей Гомеза, поэтому в банду Ларса мне путь заказан.");
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_FAILED);
	b_logentry(CH1_JOINPSI,"Теперь Старый лагерь стал моим домом. Братство Спящего сможет обойтись без меня.");
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"Я вступил в Старый лагерь и теперь некоторые учителя будут согласны учить меня бесплатно.");
	LOG_THORUSTRAIN = TRUE;
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		b_logentry(CH1_DELIVERWEED,"Я теперь Призрак и больше не хочу быть на побегушках у этих болотных придурков. Думаю, у них и без меня найдется, кому таскать тюки с травой.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
		BAALORUN_FETCHWEED = LOG_FAILED;
	};
	if(GETNEWGUY_STARTED == TRUE)
	{
		b_logentry(CH1_RECRUITDUSTY,"Пускай сектанты сами ищут простаков, готовых вкалывать на болотах. Я же теперь должен защищать интересы Старого Лагеря.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(KIRGO_CHARGED == TRUE && KIRGO_CHARGED_END == FALSE)
	{
		KIRGO_CHARGED = FALSE;
		b_exchangeroutine(grd_251_kirgo,"START");
	};
	if(KHARIM_CHARGED == TRUE && KHARIM_CHARGED_END == FALSE)
	{
		KHARIM_CHARGED = FALSE;
		b_exchangeroutine(sld_729_kharim,"START");
	};
	b_exchangeroutine(tpl_1422_gorhanis,"START");
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_NURSO(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_nurso_condition;
	information = dia_gomez_nurso_info;
	permanent = 1;
	description = "Я всего лишь хотел доложить, что вернулся.";
};


func int dia_gomez_nurso_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_gomez_nurso_info()
{
	AI_Output(other,self,"DIA_Gomez_NurSo_15_00");	//Я всего лишь хотел доложить, что вернулся.
	AI_Output(self,other,"DIA_Gomez_NurSo_11_00");	//Иди и поговори с Равеном. И никогда не заходи сюда без разрешения!
	AI_StopProcessInfos(self);
};


instance DIA_EBR_100_GOMEZ_WAIT4SC(C_INFO)
{
	npc = ebr_100_gomez;
	condition = dia_ebr_100_gomez_wait4sc_condition;
	information = dia_ebr_100_gomez_wait4sc_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_100_gomez_wait4sc_condition()
{
	if(EXPLORESUNKENTOWER && (Npc_GetDistToNpc(hero,self) < 500))
	{
		return TRUE;
	};
};

func void dia_ebr_100_gomez_wait4sc_info()
{
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02");	//Погоди! А не ты ли убил моих людей в Свободной шахте?
	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03");	//Не стоило твоим людям вмешиваться. Я просто избавил их от мании величия.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04");	//А ты смел, если можешь со мной, Гомезом, разговаривать таким тоном. Но все равно глупо было появляться здесь.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05");	//Я лично прослежу, чтобы ты больше никак не смог навредить моим планам.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

