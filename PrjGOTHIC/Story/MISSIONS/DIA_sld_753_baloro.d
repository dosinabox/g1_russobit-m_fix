
var int sld_753_baloro_sc_choice;
var int sld_753_baloro_sc_wills_wissen;
var int sld_753_baloro_sc_besorgt_den_kram;

instance DIA_SLD_753_BALORO(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_condition;
	information = dia_sld_753_baloro_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_753_baloro_condition()
{
	return 1;
};

func void dia_sld_753_baloro_intro_info()
{
	AI_Output(self,other,"DIA_SLD_753_Baloro_Intro_08_01");	//Эй, ты! В чем дело?
};


instance DIA_SLD_753_BALORO_WASMEINSTDU(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_wasmeinstdu_condition;
	information = dia_sld_753_baloro_wasmeinstdu_info;
	important = 0;
	permanent = 0;
	description = "Привет!  ";
};


func int dia_sld_753_baloro_wasmeinstdu_condition()
{
	return 1;
};

func void dia_sld_753_baloro_wasmeinstdu_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01");	//Привет!  
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02");	//Ты ходишь здесь, словно тебе нужно что-то найти!
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03");	//Ты так думаешь? Быть может, ты и прав.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04");	//Отлично! Спроси меня! Может, я и помогу тебе!
};


instance DIA_SLD_753_BALORO_WORUMGEHTS(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_worumgehts_condition;
	information = dia_sld_753_baloro_worumgehts_info;
	important = 0;
	permanent = 0;
	description = "А чем ты сможешь мне помочь?";
};


func int dia_sld_753_baloro_worumgehts_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_753_baloro_wasmeinstdu) && (SLD_753_BALORO_SC_CHOICE == 0))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_worumgehts_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01");	//А чем ты сможешь мне помочь?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01");	//Так что тебе нужно?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02");	//Ну, мне пригодился бы хороший меч, доспех какой-нибудь более прочный или разрешение попасть в шахту...
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02");	//А, что ты?! Это же ерунда!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03");	//Могу предложить кое-что получше. Думаю, у меня есть чем тебя удивить. Я могу достать такое оружие, которым можно победить любого врага!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04");	//За это ты окажешь мне маленькую услугу. И оружие будет у тебя в руках! Договорились?
	Info_ClearChoices(dia_sld_753_baloro_worumgehts);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"А что для этого нужно сделать?",dia_sld_753_baloro_worumgehts_ja);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"Мне это не нужно!",dia_sld_753_baloro_exit_info);
};

func void dia_sld_753_baloro_worumgehts_ja()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05");	//А что для этого нужно сделать?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03");	//Это очень простая работа!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04");	//Принеси мне пять яблок, две бутылки рисового шнапса, пять бутылок пива, три буханки хлеба, два куска сыра и две грозди винограда.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05");	//Поверь мне, ты об этом не пожалеешь. Как я сказал, этим оружием можно победить любого врага!
	Info_ClearChoices(dia_sld_753_baloro_worumgehts);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"Ладно! Я постараюсь все это найти!",dia_sld_753_baloro_worumgehts_jaklar);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"Этот тип пытается меня провести!",dia_sld_753_baloro_exit_info);
};

func void dia_sld_753_baloro_worumgehts_jaklar()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06");	//Ладно! Я постараюсь все это найти!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06");	//Отлично! Только быстрее!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07");	//И не забудь, мне нужно пять яблок, две бутылки рисового шнапса, пять бутылок пива, три буханки хлеба, два куска сыра и две грозди винограда.
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07");	//Конечно!
	SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_RUNNING;
	Log_CreateTopic(BALOROS_WAFFE,LOG_MISSION);
	Log_SetTopicStatus(BALOROS_WAFFE,LOG_RUNNING);
	b_logentry(BALOROS_WAFFE,"Балоро обещал, что если я принесу ему 5 яблок, 2 бутылки рисового шнапса, 5 бутылок пива, 3 буханки хлеба, 2 куска сыра и 2 грозди винограда, он даст мне какое-то мощное оружие.");
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_HABSNICHTDABEI(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_habsnichtdabei_condition;
	information = dia_sld_753_baloro_habsnichtdabei_info;
	important = 0;
	permanent = 1;
	description = "Я еще не все достал! Повтори, что ты хотел. Этих вещей так много!";
};


func int dia_sld_753_baloro_habsnichtdabei_condition()
{
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_habsnichtdabei_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01");	//Я еще не все достал! Повтори, что ты там хотел. Этих вещей так много!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01");	//Ладно! Можешь даже записать. Так вот, мне нужно...
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02");	//5 яблок, 2 бутылки рисового шнапса, 5 бутылок пива, 3 буханки хлеба, 2 куска сыра и 2 грозди винограда.
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02");	//Ну, да! Конечно! Пойду, поищу.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_HABSDABEI(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_habsdabei_condition;
	information = dia_sld_753_baloro_habsdabei_info;
	important = 0;
	permanent = 0;
	description = "Я принес тебе все, что ты просил. Показывай оружие!";
};


func int dia_sld_753_baloro_habsdabei_condition()
{
	if((SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_sld_753_baloro_worumgehts) && (SLD_753_BALORO_SC_CHOICE == 0) && (Npc_HasItems(other,itfoapple) >= 5) && (Npc_HasItems(other,itfobooze) >= 2) && (Npc_HasItems(other,itfobeer) >= 5) && (Npc_HasItems(other,itfoloaf) >= 3) && (Npc_HasItems(other,itfocheese) >= 2) && (Npc_HasItems(other,itfo_wineberrys_01) >= 2))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_habsdabei_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01");	//Вот, я принес тебе все, что ты просил. Показывай, что там у тебя за оружие!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01");	//А ты сначала покажи мне все, что принес!
	CreateInvItems(other,itfoapple,14);
	b_giveinvitems(other,self,itfoapple,19);
	Npc_RemoveInvItems(other,itfobooze,2);
	Npc_RemoveInvItems(other,itfobeer,5);
	Npc_RemoveInvItems(other,itfoloaf,3);
	Npc_RemoveInvItems(other,itfocheese,2);
	Npc_RemoveInvItems(other,itfo_wineberrys_01,2);
	Npc_RemoveInvItems(self,itfoapple,14);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itfobeer,5);
	CreateInvItems(self,itfoloaf,3);
	CreateInvItems(self,itfocheese,2);
	CreateInvItems(self,itfo_wineberrys_01,2);
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02");	//Я принес все, что ты просил.
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02");	//Да, отлично!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03");	//Теперь твоя очередь. Давай то, что обещал!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03");	//Да забудь об этом!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04");	//Что?
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04");	//Ты действительно думал, что я тебе что-то дам? Ты так легко поверил во всю эту чушь. Грех было тебя не обмануть! 
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05");	//Удивительно еще, что ты до сих пор жив! Если ты и дальше будешь всем доверять, ты долго не протянешь!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06");	//Но, это уже не важно. Теперь у нас есть так много еды, можно целый праздник устроить! Спасибо! Может быть, мы еще встретимся.
	SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_SUCCESS;
	b_givexp(300);
	b_logentry(BALOROS_WAFFE,"Так и думал, что он захотел меня провести. Теперь это неважно! Постараюсь больше так не попадаться.");
	Log_SetTopicStatus(BALOROS_WAFFE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_LETZTES_WORT(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_letztes_wort_condition;
	information = dia_sld_753_baloro_letztes_wort_info;
	important = 0;
	permanent = 0;
	description = "Эй! Зачем ты это сделал! Так же нельзя!";
};


func int dia_sld_753_baloro_letztes_wort_condition()
{
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_letztes_wort_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01");	//Эй! Зачем ты это сделал! Так же нельзя!
	AI_Output(self,other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01");	//Тебе нужно что-то еще? Убирайся! Будешь действовать мне на нервы, я тебя проучу! Понял?
	SLD_753_BALORO_SC_WILLS_WISSEN = 1;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_SC_WILLS_WISSEN(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_sc_wills_wissen_condition;
	information = dia_sld_753_baloro_sc_wills_wissen_info;
	important = 0;
	permanent = 0;
	description = "Кажется, настало время проучить тебя!";
};


func int dia_sld_753_baloro_sc_wills_wissen_condition()
{
	if(SLD_753_BALORO_SC_WILLS_WISSEN == 1)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_sld_753_baloro_sc_wills_wissen_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01");	//Кажется, настало время проучить тебя!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01");	//Мы отлично повеселились. А теперь тебе пора убраться отсюда!
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02");	//Я думаю, ты меня не так понял!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02");	//Ну, как хочешь! Раз ты по-другому не понимаешь! Я тебя предупредил!
	dia_sld_753_baloro_attack();
};


instance DIA_SLD_753_BALORO_EXIT(C_INFO)
{
	npc = sld_753_baloro;
	nr = 999;
	condition = dia_sld_753_baloro_exit_condition;
	information = dia_sld_753_baloro_exit_info;
	important = 0;
	permanent = 1;
	description = "Извини! У меня сейчас нет времени на разговоры.";
};


func int dia_sld_753_baloro_exit_condition()
{
	if((SLD_753_BALORO_SC_WILLS_WISSEN == 0) && (SLD_753_BALORO_SC_BESORGT_DEN_KRAM == 0))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_exit_info()
{
	if(Npc_KnowsInfo(hero,dia_sld_753_baloro_wasmeinstdu) && (SLD_753_BALORO_SC_CHOICE == 0))
	{
		AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01");	//Мне это не нужно!
		AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_02");	//Как скажешь! Я дал тебе шанс!
		SLD_753_BALORO_SC_CHOICE = 1;
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_03");	//Извини! У меня сейчас нет времени на разговоры.
		AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_04");	//О, так у тебя много дел, да? Ну, еще увидимся!
	};
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_ANGEBOTDOCHANNEHMEN(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_angebotdochannehmen_condition;
	information = dia_sld_753_baloro_angebotdochannehmen_info;
	important = 0;
	permanent = 0;
	description = "Я все обдумал. Я принимаю твое предложение.";
};


func int dia_sld_753_baloro_angebotdochannehmen_condition()
{
	if(SLD_753_BALORO_SC_CHOICE == 1)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_angebotdochannehmen_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01");	//Я все обдумал. Я принимаю твое предложение.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01");	//Нет, теперь уже поздно! Ты упустил свой шанс!
	AI_StopProcessInfos(self);
};

