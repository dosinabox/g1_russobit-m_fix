
instance DIA_DUSTY_EXIT(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 999;
	condition = dia_dusty_exit_condition;
	information = dia_dusty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_dusty_exit_condition()
{
	return 1;
};

func void dia_dusty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_HELLO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_hello_condition;
	information = dia_dusty_hello_info;
	permanent = 0;
	description = "Привет! Как дела?";
};


func int dia_dusty_hello_condition()
{
	If(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_dusty_hello_info()
{
	//AI_Output(other,self,"DIA_Dusty_Hello_15_00");	//Привет! Я новенький. Можешь рассказать, как дела?
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//Привет! Как дела?
	AI_Output(self,other,"DIA_Dusty_Hello_03_01");	//Ах, и не спрашивай! Две недели я гнул спину в шахте. И что я получил?
	AI_Output(self,other,"DIA_Dusty_Hello_03_02");	//Несколько жалких кусков руды, на которые даже нормальную еду не купишь!
	AI_Output(self,other,"DIA_Dusty_Hello_03_03");	//Я разговаривал с Идолом Парвезом внизу. Он рассказал мне кое-что интересное о Лагере сектантов.
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//Думаю, лучше уж присоединиться к ним, чем до конца жизни быть рабом Гомеза.
};


instance DIA_DUSTY_WHYNOTLEAVE(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_whynotleave_condition;
	information = dia_dusty_whynotleave_info;
	permanent = 0;
	description = "Если тебе здесь не нравится, почему ты не уйдешь?";
};


func int dia_dusty_whynotleave_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_hello) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_whynotleave_info()
{
	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00");	//Если тебе здесь не нравится, почему ты не уйдешь?
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01");	//Я не уверен, что мне там действительно будет лучше. У меня был здесь друг. Его звали Мелвин. Неделю назад он ушел в Лагерь сектантов.
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02");	//Но с тех пор я ничего о нем не слышал. Если так и дальше будет продолжаться, я лучше останусь здесь.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"Дасти, рудокоп из Старого лагеря, недоволен своей жизнью. Он раздумывает над тем, не присоединиться ли ему к лагерю Братства.");
	if(!Npc_KnowsInfo(hero,dia_melvin_hello))
	{
		b_logentry(CH1_RECRUITDUSTY,"Мне следует поискать друга Дасти, Мелвина. Он ушел в лагерь на болоте неделю назад.");
	};
};


instance DIA_DUSTY_METMELVIN(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_metmelvin_condition;
	information = dia_dusty_metmelvin_info;
	permanent = 0;
	description = "Я был в лагере Сектантов и встретил там Мелвина.";
};


func int dia_dusty_metmelvin_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_whynotleave) && Npc_KnowsInfo(hero,dia_melvin_hello) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_metmelvin_info()
{
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00");	//Я был в Лагере сектантов и встретил там Мелвина.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01");	//Правда? Он передал мне что-нибудь?
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02");	//Говорит, что там гораздо лучше, никто не пинает, не кричит.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03");	//Эй! И он там отдыхает без меня? Я тоже хочу туда пойти. Но меня из этого лагеря никто не выпустит.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04");	//Вот как? Почему?
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05");	//Стражники быстро узнали, что я собираюсь уйти отсюда. Мне не стоило так много болтать об этом.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06");	//Чтобы они меня пропустили, нужно заплатить им не меньше 100 кусков руды.
};


instance DIA_DUSTY_OFFER100ORE(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_offer100ore_condition;
	information = dia_dusty_offer100ore_info;
	permanent = 0;
	description = "А если я дам тебе сто кусков, ты сможешь уйти из этого лагеря?";
};


func int dia_dusty_offer100ore_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_metmelvin) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_offer100ore_info()
{
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00");	//А если я дам тебе сто кусков, ты сможешь уйти из этого лагеря?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01");	//И ты сделаешь это? Почему?
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02");	//Ну, скажем так, не ты один хотел бы видеть себя одним из братьев в Лагере сектантов.
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03");	//Ты хочешь сказать, что ты пойдешь вместе со мной?
};


instance DIA_DUSTY_IWOULDGO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_iwouldgo_condition;
	information = dia_dusty_iwouldgo_info;
	permanent = 0;
	description = "Я не просто хочу, а пойду вместе с тобой.";
};


func int dia_dusty_iwouldgo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_offer100ore) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_iwouldgo_info()
{
	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00");	//Я не просто хочу, а пойду вместе с тобой.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01");	//Ты меня обрадовал. Мы пойдем, как только ты будешь готов.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02");	//Не забудь только, что нужно приготовить 100 кусков руды для стражников.
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality))
	{
		b_logentry(CH1_RECRUITDUSTY,"Я смог уговорить рудокопа Дасти пойти со мной в Болотный лагерь. Мне придется подкупить стражников, чтобы они нас пропустили. Лучше всего отвести его прямо к Идолу Тондралу.");
	}
	else
	{
		b_logentry(CH1_RECRUITDUSTY,"Я смог уговорить рудокопа Дасти пойти со мной в Болотный лагерь. Мне придется подкупить стражников, чтобы они нас пропустили. Лучше всего отвести его прямо к Мелвину.");
	};
	b_givexp(XP_DUSTYJOINED);
};


var int dusty_letsgo;

instance DIA_DUSTY_LETSGO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_letsgo_condition;
	information = dia_dusty_letsgo_info;
	permanent = 1;
	description = "Я готов. Пойдем!";
};


func int dia_dusty_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_iwouldgo) && (GETNEWGUY_DUSTY_MOVING == FALSE) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_letsgo_info()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00");	//Я готов. Пойдем!
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01");	//Хорошо, мы пойдем через южные ворота. Через северные нам не пройти, там стражники не берут взяток.
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02");	//И лучше всего, если руду предложишь им ты - у меня нет опыта в подобных делах.
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//Ладно. Пойдем.
	GETNEWGUY_DUSTY_MOVING = TRUE;
	if(GETNEWGUY_DUSTY_STOPPED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"Дасти посоветовал мне не ходить к северным воротам. Стражники у южных ворот гораздо лучше относятся к людям с рудой.");
	};
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

instance DIA_DUSTY_BYE(C_INFO)
{
	npc = vlk_524_dusty;
	condition = dia_dusty_bye_condition;
	information = dia_dusty_bye_info;
	permanent = 0;
	important = 1;
};


func int dia_dusty_bye_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_dusty_bye_info()
{
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//Думаю, лучше уж присоединиться к ним, чем до конца жизни быть рабом Гомеза.
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//Желаю удачи!
	if(Npc_KnowsInfo(hero,dia_baaltondral_dustysuccess))
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL");
	}
	else
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL2");
	};
	AI_StopProcessInfos(self);
};

