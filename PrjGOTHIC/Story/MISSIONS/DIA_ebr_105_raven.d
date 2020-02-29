
instance DIA_RAVEN_EXIT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 999;
	condition = dia_raven_exit_condition;
	information = dia_raven_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_raven_exit_condition()
{
	return 1;
};

func void dia_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAVEN_FIRSTIN(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_firstin_condition;
	information = dia_raven_firstin_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_firstin_condition()
{
	var C_NPC wache218;
	wache218 = Hlp_GetNpc(grd_218_gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void dia_raven_firstin_info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Я могу что-нибудь сделать для тебя?
};


instance DIA_RAVEN_WHO(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_who_condition;
	information = dia_raven_who_info;
	permanent = 0;
	description = "Кто ты?";
};


func int dia_raven_who_condition()
{
	return 1;
};

func void dia_raven_who_info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Я Равен, первый помощник Гомеза. Все, кто хочет встретиться с ним, сначала говорят со мной.
};


instance DIA_RAVEN_KRAUTBOTE(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_krautbote_condition;
	information = dia_raven_krautbote_info;
	permanent = 0;
	description = "Я от Кор Галома. У меня есть немного болотника для Гомеза.";
};


func int dia_raven_krautbote_condition()
{
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_raven_krautbote_info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Я от Кор Галома. У меня есть немного болотника для Гомеза.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Поговори об этом с Бартоло. Гомез не разговаривает с посыльными.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Бартоло ты найдешь в комнатке справа от входа или на кухне в большой башне.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//Ночью он, конечно же, спит. И лучше тебе в это время его не беспокоить.
	b_logentry(CH1_KRAUTBOTE,"Болотник для Гомеза я должен отдать Бартоло. Он находится в доме Баронов.");
};


instance DIA_RAVEN_AUFNAHME(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_aufnahme_condition;
	information = dia_raven_aufnahme_info;
	permanent = 0;
	description = "Я хочу видеть Гомеза. Торус сказал, что я могу стать Призраком.";
};


func int dia_raven_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_raven_aufnahme_info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Я хочу видеть Гомеза. Торус сказал, что меня могут взять в Призраки.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Надежные люди нам всегда нужны. А на тебя можно положиться, раз тебя прислал Торус. Думаю, ты нам подойдешь.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Я отведу тебя к Гомезу. Иди за мной. Только ничего не трогай!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_RAVEN_THERE(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_there_condition;
	information = dia_raven_there_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_there_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void dia_raven_there_info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Вон там сидит Гомез. Если ты выберешь неверный тон, я лично научу тебя хорошим манерам, ясно?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_RAVEN_PERM(C_INFO)
{
	npc = ebr_105_raven;
	nr = 8;
	condition = dia_raven_perm_condition;
	information = dia_raven_perm_info;
	permanent = 1;
	description = "Как идет добыча руды?";
};


func int dia_raven_perm_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez))
	{
		return 1;
	};
};

func void dia_raven_perm_info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Как идет добыча руды?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Рудокопы на Старой шахте потрудились на славу. Последний груз из внешнего мира был довольно большим.
};


instance DIA_RAVEN_BINDABEI(C_INFO)
{
	npc = ebr_105_raven;
	nr = 8;
	condition = dia_raven_bindabei_condition;
	information = dia_raven_bindabei_info;
	permanent = 0;
	description = "Гомез сказал, что теперь я работаю на вас.";
};


func int dia_raven_bindabei_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_dabei))
	{
		return 1;
	};
};

func void dia_raven_bindabei_info()
{
	CreateInvItem(hero,stt_armor_m);
	CreateInvItem(self,itamarrow);
	b_giveinvitems(self,hero,itamarrow,1);
	Npc_RemoveInvItem(hero,itamarrow);
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Гомез сказал, что теперь я работаю на вас.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//Хорошо. У меня как раз есть для тебя одно задание.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//Если у тебя действительно хорошие связи, у тебя с ним не возникнет никаких проблем.
	AI_EquipBestArmor(hero);
};


var int raven_spysect;

instance DIA_RAVEN_SPYSECT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_spysect_condition;
	information = dia_raven_spysect_info;
	permanent = 0;
	description = "Что я должен сделать?";
};


func int dia_raven_spysect_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_bindabei))
	{
		return 1;
	};
};

func void dia_raven_spysect_info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Мы ведем торговлю с Братством. Это, конечно, не значит, что мы доверяем этой болотной братии.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//Пойди в их лагерь.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Когда ты будешь там, следи за всем, что там происходит. Запоминай все, что увидишь и услышишь. Это может нам пригодиться.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//И чем больше ты узнаешь, тем лучше. Ты должен действовать осторожно. Думаю, ты понимаешь, что я имею в виду?
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Будь спокоен, я постараюсь не ссориться с ними.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Я знал, что ты поймешь меня правильно.
	RAVEN_SPYSECT = LOG_RUNNING;
	Log_CreateTopic(CH1_GOTOPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_GOTOPSI,LOG_RUNNING);
	b_logentry(CH1_GOTOPSI,"Равен послал меня в лагерь на болотах. Я должен разузнать, что готовят Гуру. Может быть, я смогу найти что-то полезное для Баронов.");
};


instance DIA_RAVEN_EQUIPMENT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_equipment_condition;
	information = dia_raven_equipment_info;
	permanent = 0;
	description = "Где здесь можно найти хорошее снаряжение?";
};


func int dia_raven_equipment_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_raven_equipment_info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Где здесь можно найти хорошее снаряжение?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Иди к Диего. Он даст тебе один из доспехов. Он будет служить тебе опознавательным знаком и защитой от врагов.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//В нем ты сможешь ходить по всему лагерю. Никто не будет тебя останавливать.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//А если тебе нужно оружие, поговори со Скипом. Ты найдешь его в большом сарае во внутреннем дворе замка, слева от ворот.
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"У Диего можно найти хорошие доспехи для Призраков. Днем он стоит у входа в замок.");
	if(!Npc_KnowsInfo(hero,dia_skip_first))
	{
		b_logentry(GE_TRADEROC,"Стражник Скип со двора замка продает оружие. Но только людям Гомеза.");
	};
};


instance DIA_RAVEN_SPYBERICHT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_spybericht_condition;
	information = dia_raven_spybericht_info;
	permanent = 1;
	description = "Я подумал, что мне стоит доложить о своем приходе.";
};


func int dia_raven_spybericht_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_raven_spybericht_info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Я подумал, что мне стоит доложить о своем приходе.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//Хорошо. Мне нужно знать все, что происходит вокруг.
	if((Npc_HasItems(other,itat_crawlerqueen) >= 1) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS))
	{
		if(KAPITEL >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Они провели Великую Церемонию.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Ты хорошо поработал.
			RAVEN_SPYSECT = LOG_SUCCESS;
			b_givexp(XP_REPORTTORAVEN);
			Log_SetTopicStatus(CH1_GOTOPSI,LOG_SUCCESS);
			b_logentry(CH1_GOTOPSI,"Равен отблагодарил меня на словах! Честно говоря, у меня несколько иные понятия о благодарности. Теперь я буду действовать только по своему усмотрению.");
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Им нужны яйца ползунов, чтобы получить особое зелье. С его помощью они хотят укрепить силу духа и вызвать Спящего. Я добыл яйца у королевы ползунов.
			if(CORKALOM_BRINGMCQBALLS != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Интересно. Хотелось бы узнать, сработает ли все это. Отнеси яйца в храм.
			}
			else
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Ты хорошо поработал.
				RAVEN_SPYSECT = LOG_SUCCESS;
				b_givexp(XP_REPORTTORAVEN);
				Log_SetTopicStatus(CH1_GOTOPSI,LOG_SUCCESS);
				b_logentry(CH1_GOTOPSI,"Равен отблагодарил меня на словах! Честно говоря, у меня несколько иные понятия о благодарности. Теперь я буду действовать только по своему усмотрению.");
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Я еще не знаю, что они там собираются делать.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//Так зачем же ты меня отвлекаешь?
	};
};

