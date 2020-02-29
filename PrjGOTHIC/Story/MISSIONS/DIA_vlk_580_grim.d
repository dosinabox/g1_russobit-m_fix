
instance DIA_GRIM_EXIT(C_INFO)
{
	npc = vlk_580_grim;
	nr = 999;
	condition = dia_grim_exit_condition;
	information = dia_grim_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grim_exit_condition()
{
	return 1;
};

func void dia_grim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIM_FALLE(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_falle_condition;
	information = dia_grim_falle_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_falle_condition()
{
	if((GRIM_PROTECTIONBULLY == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_grim_falle_info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Эй, ты! Я слышал, ты хочешь присоединиться к нашему лагерю?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//Да, и что из того?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//Я могу помочь тебе...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Как помочь?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//За воротами лагеря сидят два рудокопа. Они украли кое-что у Баронов. В общем они украли один амулет, который пришел с последним грузом.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Наверное, этот амулет они держат при себе. Если мы вместе нападем на них, мы с ними быстро справимся. Одному мне это не под силу. Что скажешь?
	Info_ClearChoices(dia_grim_falle);
	Info_AddChoice(dia_grim_falle,"Мне это не нужно. Пусть этим займется кто-нибудь еще.",dia_grim_falle_deny);
	Info_AddChoice(dia_grim_falle,"А что будет, когда мы заберем у них амулет?",dia_grim_falle_howshare);
	Info_AddChoice(dia_grim_falle,"Что ж, пойдем вместе. Идем!",dia_grim_falle_accepr);
};

func void dia_grim_falle_deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//Мне это не нужно. Пусть этим займется кто-нибудь еще.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//С таким отношением к делу ты здесь долго не протянешь. Если передумаешь, ты знаешь, где меня найти.
	Info_ClearChoices(dia_grim_falle);
};

func void dia_grim_falle_howshare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//А что будет, когда мы заберем у них амулет?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//Это просто! Я верну амулет и получу награду. Ну, еще я упомяну там, что ты помогал мне. И ты будешь у Гомеза на хорошем счету.
	Info_ClearChoices(dia_grim_falle);
	Info_AddChoice(dia_grim_falle,"Мне это не нужно. Пусть этим займется кто-нибудь еще.",dia_grim_falle_deny);
	Info_AddChoice(dia_grim_falle,"Я не согласен. Ты даешь мне половину награды...",dia_grim_falle_halfhalf);
	Info_AddChoice(dia_grim_falle,"Что ж, пойдем вместе. Идем!",dia_grim_falle_accepr);
};

func void dia_grim_falle_halfhalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Я не согласен. Ты даешь мне половину награды, или разбирайся с ними сам!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Ладно, как хочешь, пополам так пополам. Награды должно хватить на двоих. Ну, я могу на тебя рассчитывать?
};

func void dia_grim_falle_accepr()
{
	//AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//Я готов.
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Что ж, пойдем вместе. Идем!
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//Хорошо.
	Info_ClearChoices(dia_grim_falle);
};


instance DIA_GRIM_READYTOGO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_readytogo_condition;
	information = dia_grim_readytogo_info;
	permanent = 0;
	description = "Я готов пойти с тобой за амулетом!";
};


func int dia_grim_readytogo_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_falle))
	{
		return 1;
	};
};

func void dia_grim_readytogo_info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Я готов пойти с тобой за амулетом!
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Ладно, иди за мной...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_GRIM_ATOCDRAUSSEN(C_INFO)
{
	npc = vlk_580_grim;
	nr = 3;
	condition = dia_grim_atocdraussen_condition;
	information = dia_grim_atocdraussen_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_atocdraussen_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_readytogo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void dia_grim_atocdraussen_info()
{
	var C_NPC bu520;
	var C_NPC bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//Вот мы и на месте. Твой друг Диего не скоро здесь появится.
	if(((Npc_GetDistToNpc(self,bu520) < 1000) && !Npc_IsDead(bu520)) || ((Npc_GetDistToNpc(self,bu534) < 1000) && !Npc_IsDead(bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Бладвин просил передать тебе свой горячий привет!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Бладвин просил меня передать тебе привет!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	bu520 = Hlp_GetNpc(vlk_520_buddler);
	bu534 = Hlp_GetNpc(vlk_534_buddler);
	if((Npc_GetDistToNpc(self,bu520) < 1000) && !Npc_IsDead(bu520))
	{
		Npc_SetTarget(bu520,other);
		AI_StartState(bu520,zs_attack,1,"");
	};
	if((Npc_GetDistToNpc(self,bu534) < 1000) && !Npc_IsDead(bu534))
	{
		Npc_SetTarget(bu534,other);
		AI_StartState(bu534,zs_attack,1,"");
	};
};


instance DIA_GRIM_NACHFALLE(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_nachfalle_condition;
	information = dia_grim_nachfalle_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_nachfalle_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_atocdraussen) && (Npc_GetDistToNpc(self,other) < ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_grim_nachfalle_info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Так ты заманил меня в ловушку, предатель!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Эй! Пойми меня правильно. Мне ведь совсем не хочется навечно застрять в шахте.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Если я хорошо справлюсь с этим заданием, меня примут в лагерь.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//Ты ведь сам виноват в том, что мне поручили убрать именно тебя. Не стоило тебе ссориться со стражниками.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Лично я против тебя ничего не имею. Так что мы решим - драться или разойтись с миром?
	Info_ClearChoices(dia_grim_nachfalle);
	Info_AddChoice(dia_grim_nachfalle,"Думаю, мирным путем этот вопрос не решить!",dia_grim_nachfalle_weiterpruegeln);
	Info_AddChoice(dia_grim_nachfalle,"Давай разойдемся с миром!",dia_grim_nachfalle_frieden);
};

func void dia_grim_nachfalle_weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Думаю, мирным путем этот вопрос не решить!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Не самое лучшее решение, но пусть будет так.
	Info_ClearChoices(dia_grim_nachfalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_grim_nachfalle_frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Давай разойдемся с миром!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Я рад, что ты понимаешь меня. Забудем об этом. Теперь я буду на твоей стороне.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Если у тебя возникнут неприятности, ты можешь на меня рассчитывать, я же твой должник.
	Info_ClearChoices(dia_grim_nachfalle);
	npc_setpermattitude(self,ATT_FRIENDLY);
};


var int firstover;

instance DIA_GRIM_HALLO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 1;
	condition = dia_grim_hallo_condition;
	information = dia_grim_hallo_info;
	permanent = 0;
	description = "Я новенький.";
};


func int dia_grim_hallo_condition()
{
	if(GRIM_PROTECTIONBULLY == TRUE)
	{
		FIRSTOVER = TRUE;
	};
	if(FIRSTOVER == FALSE)
	{
		return 1;
	};
};

func void dia_grim_hallo_info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//Я новенький.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//Ты недавно здесь, верно? Я Грим. Меня забросили сюда с прошлым караваном.
};


instance DIA_GRIM_LEBEN(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_leben_condition;
	information = dia_grim_leben_info;
	permanent = 0;
	description = "И как здесь живется?";
};


func int dia_grim_leben_condition()
{
	return 1;
};

func void dia_grim_leben_info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//И как здесь живется?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Довольно сносно, если платишь стражникам за защиту.
};


instance DIA_GRIM_AUFNAHME(C_INFO)
{
	npc = vlk_580_grim;
	nr = 3;
	condition = dia_grim_aufnahme_condition;
	information = dia_grim_aufnahme_info;
	permanent = 0;
	description = "Я хочу быть принятым в этот лагерь. Что мне нужно сделать?";
};


func int dia_grim_aufnahme_condition()
{
	if(KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_aufnahme_info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Я хочу быть принятым в этот лагерь. Что мне нужно сделать?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Сначала ты должен стать Призраком. Для этого тебе стоит заручиться поддержкой одного из влиятельных людей.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//На твоем месте я бы обратился к Диего. Кстати, я так и сделал. Здесь его уважают.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//Каждому, кто к нему обратится, он дает какое-нибудь важное задание. У некоторых Призраков тоже найдутся для тебя поручения.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Если ты справишься, тебя примут в лагерь.
};


var int grim_tests;

instance DIA_GRIM_HOWFARAREYOU(C_INFO)
{
	npc = vlk_580_grim;
	nr = 4;
	condition = dia_grim_howfarareyou_condition;
	information = dia_grim_howfarareyou_info;
	permanent = 1;
	description = "Как проходит твое испытание?";
};


func int dia_grim_howfarareyou_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_aufnahme) && Npc_KnowsInfo(hero,info_diego_rules) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_howfarareyou_info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//Как проходит твое испытание?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Я уже разговаривал с Декстером, Слаем и Фингерсом.
	if(!GRIM_TESTS)
	{
		b_logentry(CH1_JOINOC,"Декстер, Слай и Фингерс самые влиятельные из Призраков.");
		GRIM_TESTS = TRUE;
	};
};


instance DIA_GRIM_YOURPDV(C_INFO)
{
	npc = vlk_580_grim;
	nr = 5;
	condition = dia_grim_yourpdv_condition;
	information = dia_grim_yourpdv_info;
	permanent = 0;
	description = "В чем заключается твое испытание?";
};


func int dia_grim_yourpdv_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_aufnahme) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_yourpdv_info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//В чем заключается твое испытание?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//Этого я не могу тебе сказать. О таких вещах здесь не говорят!
};


instance DIA_GRIM_INEXTREMO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 1;
	condition = dia_grim_inextremo_condition;
	information = dia_grim_inextremo_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_inextremo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grim_inextremo_info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Эй, слышал новость?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//Здесь In Extremo! Они будут выступать на сцене.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Торопись! Жаль будет пропустить их выступление.
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};

