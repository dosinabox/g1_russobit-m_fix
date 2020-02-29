
instance INFO_GORN_EXIT(C_INFO)
{
	npc = pc_fighter;
	nr = 999;
	condition = info_gorn_exit_condition;
	information = info_gorn_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorn_exit_condition()
{
	return 1;
};

func void info_gorn_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_01");	//Оружие к бою!
	}
	else
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_02");	//Еще увидимся.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GORN_FIRST(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = dia_gorn_first_condition;
	information = dia_gorn_first_info;
	permanent = 0;
	important = 1;
};


func int dia_gorn_first_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void dia_gorn_first_info()
{
	AI_Output(self,other,"DIA_Gorn_First_09_00");	//Эй, новые лица.
	AI_Output(other,self,"DIA_Gorn_First_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_Gorn_First_09_02");	//Я Горн. Наемник магов.
};


instance DIA_GORN_LEBEN(C_INFO)
{
	npc = pc_fighter;
	nr = 2;
	condition = dia_gorn_leben_condition;
	information = dia_gorn_leben_info;
	permanent = 0;
	description = "А что должны делать наемники?";
};


func int dia_gorn_leben_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first))
	{
		return 1;
	};
};

func void dia_gorn_leben_info()
{
	AI_Output(other,self,"DIA_Gorn_Leben_15_00");	//А что должны делать наемники?
	AI_Output(self,other,"DIA_Gorn_Leben_09_01");	//Ли заключил с магами сделку. Он нанял всех лучших бойцов колонии, то есть нас.
	AI_Output(self,other,"DIA_Gorn_Leben_09_02");	//Мы следим за тем, чтобы никто не мешал рудокопам добывать руду и охраняем магов.
	AI_Output(self,other,"DIA_Gorn_Leben_09_03");	//А маги делают все, чтобы мы смогли освободиться отсюда. За наши услуги нам отдают часть добытой руды.
};


var int gorn_shrikeshut;

instance DIA_GORN_HUT(C_INFO)
{
	npc = pc_fighter;
	nr = 3;
	condition = dia_gorn_hut_condition;
	information = dia_gorn_hut_info;
	permanent = 0;
	description = "Могу я где-нибудь здесь остановиться?..";
};


func int dia_gorn_hut_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first))
	{
		return 1;
	};
};

func void dia_gorn_hut_info()
{
	AI_Output(other,self,"DIA_Gorn_Hut_15_00");	//Могу я где-нибудь здесь остановиться, так чтобы не пришлось никого выгонять из дома?
	AI_Output(self,other,"DIA_Gorn_Hut_09_01");	//Не думаю. Но если уж так хочется, поговори со Шрайком.
	AI_Output(self,other,"DIA_Gorn_Hut_09_02");	//Он занял первый дом, прямо напротив входа в пещеру. Он пустовал, но вообще-то он принадлежит нам.
	AI_Output(other,self,"DIA_Gorn_Hut_15_03");	//Нам?
	AI_Output(self,other,"DIA_Gorn_Hut_09_04");	//Ну, да, наемникам. Мы живем отдельно от воров. И обычно никто из шайки Ларса не появляется на нашей половине пещеры.
	AI_Output(self,other,"DIA_Gorn_Hut_09_05");	//Для нас это не так важно, но Шрайк никого не спрашивал. А ворам ничего нельзя спускать с рук, иначе они наглеют!
	Log_CreateTopic(CH1_SHRIKESHUT,LOG_MISSION);
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_RUNNING);
	b_logentry(CH1_SHRIKESHUT,"Наемник Горн рассказал мне, что Шрайк без разрешения вселился в один из домов наемников. Так как я спросил разрешения у Горна, никто из наемников не помешает мне, если я попрошу Шрайка найти себе что-то другое.");
	GORN_SHRIKESHUT = LOG_RUNNING;
};


instance DIA_GORN_HUTFREE(C_INFO)
{
	npc = pc_fighter;
	nr = 3;
	condition = dia_gorn_hutfree_condition;
	information = dia_gorn_hutfree_info;
	permanent = 0;
	description = "Шрайк нашел себе другой дом.";
};


func int dia_gorn_hutfree_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrike_getlost))
	{
		return 1;
	};
};

func void dia_gorn_hutfree_info()
{
	AI_Output(other,self,"DIA_Gorn_HutFree_15_00");	//Шрайк нашел себе другой дом.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_01");	//Хорошо. Только что со мной говорил Тарлоф. Он хочет сам переговорить с этим парнем.
	GORN_SHRIKESHUT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_SUCCESS);
	b_logentry(CH1_SHRIKESHUT,"Горну понравилось, как я выкинул Шрайка из пустого дома. Думаю, ему можно доверять. Постараюсь в будущем держаться к нему поближе.");
	b_givexp(XP_REPORTEDKICKEDSHRIKE);
};


instance DIA_GORN_BECOMESLD(C_INFO)
{
	npc = pc_fighter;
	nr = 5;
	condition = dia_gorn_becomesld_condition;
	information = dia_gorn_becomesld_info;
	permanent = 0;
	description = "Что я должен сделать, чтобы меня приняли в Новый лагерь?";
};


func int dia_gorn_becomesld_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_gorn_becomesld_info()
{
	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00");	//Что я должен сделать, чтобы меня приняли в Новый лагерь?
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01");	//Ты должен научиться хорошо владеть оружием, чтобы Ли взял тебя на службу. Неважно, какое оружие ты будешь использовать.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02");	//Еще ты должен знать наши законы и разбираться в жизни лагеря.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03");	//Если ты не собираешься присоединяться к другому лагерю, обратись к ворам, и только потом приходи к нам.
};


var int gorn_trade;

instance DIA_GORN_TRADE(C_INFO)
{
	npc = pc_fighter;
	nr = 800;
	condition = dia_gorn_trade_condition;
	information = dia_gorn_trade_info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int dia_gorn_trade_condition()
{
};

func void dia_gorn_trade_info()
{
	AI_Output(other,self,"DIA_Gorn_TRADE_15_00");	//А у тебя еще много таких вещей?
	AI_Output(self,other,"DIA_Gorn_TRADE_09_01");	//Много. Хочешь купить?
};


instance DIA_GORN_DUHEHLER(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = dia_gorn_duhehler_condition;
	information = dia_gorn_duhehler_info;
	permanent = 0;
	description = "Почему ты участвовал в налете, который устроила шайка воров?";
};


func int dia_gorn_duhehler_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlistanteil))
	{
		return 1;
	};
};

func void dia_gorn_duhehler_info()
{
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00");	//Почему ты участвовал в налете, который устроила шайка воров?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01");	//А кто сказал, что я в нем участвовал?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02");	//Почему же у тебя так много товара?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03");	//Ну, разве можно было забрать все это за один раз?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04");	//Так ты постоянно участвуешь в налетах?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05");	//А если и так, я все равно ничего не буду тебе рассказывать. Ли не держит болтливых людей.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//Понятно.
	CreateInvItems(self,itfoapple,21);
	b_giveinvitems(self,other,itfoapple,21);
	Npc_RemoveInvItems(other,itfoapple,21);
	CreateInvItems(other,itmw_1h_lightguardssword_03,1);
	CreateInvItems(other,itfoapple,5);
	CreateInvItems(other,itfoloaf,5);
	CreateInvItems(other,itfocheese,5);
	CreateInvItems(other,itfobeer,5);
};


instance INFO_GORN_NCWAIT(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = info_gorn_ncwait_condition;
	information = info_gorn_ncwait_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ncwait_condition()
{
	if(Npc_GetDistToWP(self,"NC_PATH52") < 1000)
	{
		return TRUE;
	};
};

func void info_gorn_ncwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01");	//А, это ты! Лестер, мой друг из Болотного лагеря, рассказывал мне о том, что ты там сделал.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02");	//Неплохо для человека, который провел здесь так мало времени.
	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03");	//Да, если бы мне не так везло, я бы уже давно стал кормом для червей.
};


instance INFO_GORN_MAGES(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_mages_condition;
	information = info_gorn_mages_info;
	important = 0;
	permanent = 0;
	description = "У меня важное послание для магов Воды!";
};


func int info_gorn_mages_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ncwait))
	{
		return TRUE;
	};
};

func void info_gorn_mages_info()
{
	AI_Output(other,self,"Info_Gorn_MAGES_15_01");	//У меня важное послание для магов Воды!
	AI_Output(self,other,"Info_Gorn_MAGES_09_02");	//Поговори об этом с Сатурасом. Он среди них главный. Целыми днями он изучает какие-то свитки.
	AI_Output(self,other,"Info_Gorn_MAGES_09_03");	//Вот только наемники, которые охраняют магов, не пропустят тебя к нему.
	AI_Output(other,self,"Info_Gorn_MAGES_15_04");	//Ты можешь замолвить за меня словечко?
	AI_Output(self,other,"Info_Gorn_MAGES_09_05");	//Я - нет. Но вот Кронос, хранитель руды, - он может дать тебе разрешение.
};


instance INFO_GORN_CRONOS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_cronos_condition;
	information = info_gorn_cronos_info;
	important = 0;
	permanent = 0;
	description = "А где я смогу найти этого 'хранителя руды'?";
};


func int info_gorn_cronos_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_mages))
	{
		return TRUE;
	};
};

func void info_gorn_cronos_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Gorn_CRONOS_15_01");	//А где я смогу найти этого 'хранителя руды'?
	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");	//Пройдешь дальше по дороге, и за дамбой увидишь большую пещеру.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_02");	//В центре пещеры лежит руда. Там ты и найдешь его.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_03");	//Одно плохо: Кронос слишком высокомерен. Ты должен будешь доказать ему, что твое послание очень важно.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
	b_logentry(CH3_ESCAPEPLANNC,"Горн посоветовал мне обратиться к верховному магу Круга Воды. Его зовут Сатурас. Кронос, хранитель руды, может дать мне разрешение на проход к магам. Я смогу найти его в центре пещеры, возле рудной горы.");
	Npc_ExchangeRoutine(self,"start");
};


instance INFO_GORN_RUINWAIT(C_INFO)
{
	npc = pc_fighter;
	nr = 2;
	condition = info_gorn_ruinwait_condition;
	information = info_gorn_ruinwait_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinwait_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_ABYSS_4") < 1000)
	{
		return 1;
	};
};

func void info_gorn_ruinwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01");	//Привет! Как видишь, наша колония не так уж велика.
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02");	//Все время натыкаешься на своих знакомых.
};


instance INFO_GORN_RUINWHAT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwhat_condition;
	information = info_gorn_ruinwhat_info;
	important = 0;
	permanent = 0;
	description = "Что привело тебя сюда?";
};


func int info_gorn_ruinwhat_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwait))
	{
		return 1;
	};
};

func void info_gorn_ruinwhat_info()
{
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01");	//Что привело тебя сюда?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02");	//О, я хочу найти здесь следы одной легенды.
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03");	//Легенды?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04");	//Да. Мильтен, один из моих друзей в Старом лагере, рассказывал мне, что когда-то здесь жили монахи.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05");	//Конечно, это было еще до появления Барьера.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06");	//Они почитали бога, который награждал своих приверженцев даром превращения в животных.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07");	//Я думаю, здесь должны были сохраниться некоторые из их сокровищ.
	if(!Npc_KnowsInfo(hero,info_gorn_ruinfocus))
	{
		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08");	//А что ты здесь ищешь?
	};
};


instance INFO_GORN_RUINFOCUS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinfocus_condition;
	information = info_gorn_ruinfocus_info;
	important = 0;
	permanent = 0;
	description = "Я ищу юнитор.";
};


func int info_gorn_ruinfocus_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwait))
	{
		return 1;
	};
};

func void info_gorn_ruinfocus_info()
{
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01");	//Я ищу юнитор.  
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02");	//Он должен быть где-то здесь.
	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03");	//Наверное, эта штука находится в руинах старого монастыря по ту сторону ущелья.
};


instance INFO_GORN_RUINJOIN(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinjoin_condition;
	information = info_gorn_ruinjoin_info;
	important = 0;
	permanent = 0;
	description = "Мы можем пойти туда вместе.";
};


func int info_gorn_ruinjoin_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinfocus) && Npc_KnowsInfo(hero,info_gorn_ruinwhat))
	{
		return 1;
	};
};

func void info_gorn_ruinjoin_info()
{
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01");	//Мы можем пойти туда вместе.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02");	//Хорошая идея. Здесь же так много глорхов.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03");	//Опытный охотник без труда справится с ними по одиночке, но обычно они охотятся стаями.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04");	//А стая расправится с любым воином в два счета.
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05");	//Мы идем вместе?
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06");	//Да, но сначала я осмотрю ущелье, а уж потом перейду на другую сторону. Лучше всегда знать, что у тебя за спиной.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07");	//Идем, я нашел дорогу.
	Log_CreateTopic(CH3_MONASTERYRUIN,LOG_MISSION);
	Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_RUNNING);
	b_logentry(CH3_MONASTERYRUIN,"По дороге к развалинам монастыря я встретил наемника Горна. Его привело сюда желание найти древние сокровища.");
	b_logentry(CH3_MONASTERYRUIN,"Мы решили вместе продолжить наши поиски. Горн сказал мне, что впереди нас ждет стая зверюг, которые гораздо сильнее глорхов.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinAbyss");
};


instance INFO_GORN_RUINABYSS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinabyss_condition;
	information = info_gorn_ruinabyss_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinabyss_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinabyss_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01");	//Вот это удача. Кажется, эта пещера раньше была складом.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02");	//Теперь ты иди вперед. А я хочу убедиться, что наш отход будет безопасным.
	b_logentry(CH3_MONASTERYRUIN,"Мы нашли пещеру, в которой раньше устраивали склад. Там я взял ключ и два свитка.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinFollow");
};


instance INFO_GORN_RUINLEAVE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinleave_condition;
	information = info_gorn_ruinleave_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinleave_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && (Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG") > 15000) && !Npc_KnowsInfo(hero,info_gorn_ruingate))
	{
		return 1;
	};
};

func void info_gorn_ruinleave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01");	//Мне кажется, руины тебе больше неинтересны.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02");	//Я пойду один.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03");	//Следуй за мной, если передумаешь.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinWall");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINWALL(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwall_condition;
	information = info_gorn_ruinwall_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinwall_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_ruinjoin) || Npc_KnowsInfo(hero,info_gorn_ruinleave)) && (Npc_GetDistToWP(hero,"OW_PATH_175_GATE1") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinwall_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01");	//Эти чертовы ворота! Мне говорили, что еще ни один человек не смог их открыть.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02");	//Только эти мелкие твари проникли во внутренний двор монастыря.
	b_logentry(CH3_MONASTERYRUIN,"Мы стоим перед запертыми воротами. Кажется, мы не сможем открыть их снаружи.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinWall");
};


instance INFO_GORN_RUINWALLWHAT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwallwhat_condition;
	information = info_gorn_ruinwallwhat_info;
	important = 0;
	permanent = 1;
	description = "Что нам делать теперь?";
};


func int info_gorn_ruinwallwhat_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwall) && !Npc_KnowsInfo(hero,info_gorn_ruingate))
	{
		return TRUE;
	};
};

func void info_gorn_ruinwallwhat_info()
{
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//Что нам делать теперь?
	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02");	//Ты должен найти способ пробраться через эти ворота.
};


instance INFO_GORN_RUINLEDGE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinledge_condition;
	information = info_gorn_ruinledge_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinledge_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && !Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinledge_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01");	//Там, наверху, есть небольшая площадка. Но, кажется, она слишком высоко.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02");	//Придется поискать другой путь.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINPLATFORM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinplatform_condition;
	information = info_gorn_ruinplatform_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinplatform_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && !Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4") < 300))
	{
		return 1;
	};
};

func void info_gorn_ruinplatform_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01");	//Это похоже на какой-то пьедестал.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02");	//Возможно, как раз здесь лежал тот предмет, который ты ищешь.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINGATE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruingate_condition;
	information = info_gorn_ruingate_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruingate_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_ruinjoin) || Npc_KnowsInfo(hero,info_gorn_ruinleave)) && MONASTERYRUIN_GATEOPEN)
	{
		return TRUE;
	};
};

func void info_gorn_ruingate_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01");	//Тебе удалось открыть ворота. Как вовремя ты использовал это заклинание!
	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02");	//Нам нужно идти дальше.
	b_logentry(CH3_MONASTERYRUIN,"Я прочитал найденный на складе свиток и превратился в жука. Конечно же, мне удалось пролезть в узкую щель и попасть во внутренний двор.");
	b_logentry(CH3_MONASTERYRUIN,"Теперь проход открыт.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RuinFollowInside");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINLEAVEINSIDE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinleaveinside_condition;
	information = info_gorn_ruinleaveinside_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinleaveinside_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruingate) && (Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6") < 1000) && !Npc_HasItems(hero,focus_4))
	{
		return TRUE;
	};
};

func void info_gorn_ruinleaveinside_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01");	//Мне кажется, руины тебе больше неинтересны.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02");	//Я пойду один.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03");	//Следуй за мной, если передумаешь.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINSUCCESS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinsuccess_condition;
	information = info_gorn_ruinsuccess_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinsuccess_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && Npc_HasItems(hero,focus_4))
	{
		return TRUE;
	};
};

func void info_gorn_ruinsuccess_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01");	//Так ты нашел свой артефакт!
	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02");	//Да. Я должен отнести его магам Воды.
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03");	//Я еще немного провожу тебя.
	b_logentry(CH3_MONASTERYRUIN,"В помещении, похожем на учебный класс, я нашел один из юниторов. Горн решил сопровождать меня еще немного.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinYard");
	Wld_InsertNpc(youngtroll,"OW_PATH_176");
};


instance INFO_GORN_RUINTROLL(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruintroll_condition;
	information = info_gorn_ruintroll_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruintroll_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_ruintroll_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01");	//О, черт! Что это за великан впереди?
	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02");	//Откуда взялось это чудовище?
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03");	//Он похож на одного из неуязвимых троллей. Только он не такой большой.
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04");	//Вот как всегда, если хочешь куда-нибудь пройти, какая-то тварь преграждает дорогу.
	AI_StopProcessInfos(self);
	AI_DrawWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
};


instance INFO_GORN_RUINVICTORY(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinvictory_condition;
	information = info_gorn_ruinvictory_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinvictory_condition()
{
	var C_NPC ytroll;
	ytroll = Hlp_GetNpc(youngtroll);
	if(Npc_KnowsInfo(hero,info_gorn_ruintroll) && Npc_IsDead(ytroll))
	{
		return TRUE;
	};
};

func void info_gorn_ruinvictory_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01");	//Это было нелегко.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02");	//Вот это да! Мы победили это чудовище. Но это был еще молодой тролль...
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03");	//... тогда нам лучше уйти отсюда побыстрее, иначе мы станем добычей его родителей.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04");	//Кажется, ты прав.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05");	//Здесь наши пути расходятся. Я хочу еще немного изучить это место.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06");	//Но мы еще увидимся, я уверен. До встречи, друг.
	b_logentry(CH3_MONASTERYRUIN,"Когда мы вернулись во двор монастыря, мы столкнулись с молодым троллем. Нам удалось победить его.");
	b_logentry(CH3_MONASTERYRUIN,"Потом наши с Горном пути разошлись. Но мне кажется, что я его еще увижу.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_DIEGOMILTEN(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_diegomilten_condition;
	information = info_gorn_diegomilten_info;
	important = 0;
	permanent = 0;
	description = "Недалеко от Старого лагеря я встретил Диего и Мильтена.";
};


func int info_gorn_diegomilten_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfavor))
	{
		return TRUE;
	};
};

func void info_gorn_diegomilten_info()
{
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//Недалеко от Старого лагеря я встретил Диего и Мильтена.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02");	//Это хорошая новость!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03");	//Они хотят видеть тебя и Лестера. На вашем обычном месте.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04");	//Спасибо. Дружба - самое ценное, что у нас осталось.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05");	//Ты уже почти один из нас. Ты заслужил наше доверие.
	b_givexp(XP_MESSAGEFORGORN);
	if(WARNED_GORN_OR_LESTER == FALSE)
	{
		WARNED_GORN_OR_LESTER = TRUE;
	}
	else
	{
		b_logentry(CH4_4FRIENDS,"Я рассказал Лестеру и Горну о том, что друзья хотят их видеть. Они сами знают, где именно состоится эта встреча.");
		Log_SetTopicStatus(CH4_4FRIENDS,LOG_SUCCESS);
	};
};


instance INFO_GORN_FREEMINE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_freemine_condition;
	information = info_gorn_freemine_info;
	important = 0;
	permanent = 0;
	description = "Что ты видел в Свободной шахте?";
};


func int info_gorn_freemine_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush) && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_gorn_freemine_info()
{
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01");	//Что ты видел в Свободной шахте?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02");	//После осмотра руин я вернулся туда и захотел зайти к Окилу, хозяину Свободной шахты.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03");	//Но там я увидел только трупы.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04");	//Еще я заметил, как стражники строили укрепления у входа в шахту.
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05");	//А как две дюжины стражников справились с гарнизоном наемников?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06");	//Мне показалось, что это было нападение из засады. Никто не ожидал, что стражники придут со стороны гор.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07");	//А внезапность, как известно, является очень большим преимуществом.
};


instance INFO_GORN_GUARDNC(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_guardnc_condition;
	information = info_gorn_guardnc_info;
	important = 0;
	permanent = 0;
	description = "Что ты собираешься делать теперь?";
};


func int info_gorn_guardnc_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_gorn_guardnc_info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01");	//Что ты собираешься делать теперь?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02");	//Нужно заново организовать систему безопасности лагеря. А это займет много времени.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03");	//До того как придет Ли со своими людьми, я присоединюсь к отряду Корда.
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04");	//А вы собираетесь нанести Гомезу ответный удар?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05");	//Еще нет, но этот день не за горами.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06");	//Если захочешь меня найти, иди в сторону шахты. Там и будет находиться мой пост.
	b_story_cordspost();
	AI_StopProcessInfos(self);
};


instance INFO_GORN_GUARDNCRUNNING(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_guardncrunning_condition;
	information = info_gorn_guardncrunning_info;
	important = 0;
	permanent = 1;
	description = "Как дела?";
};


func int info_gorn_guardncrunning_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_guardnc) && !URSHAK_SPOKEOFULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_guardncrunning_info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01");	//Как дела?
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02");	//Кругом тихо, словно в Свободной шахте не осталось живых.
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03");	//Ли все еще занят организацией обороны.
};


instance INFO_GORN_POST(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_post_condition;
	information = info_gorn_post_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_post_condition()
{
	if(URSHAK_SPOKEOFULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_post_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_POST_09_01");	//Ты пришел вовремя. Мы готовимся нанести ответный удар.
	AI_Output(self,hero,"Info_Gorn_POST_09_02");	//Сперва мы хотим отвоевать Свободную шахту.
};


instance INFO_GORN_TAKEBACK(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_takeback_condition;
	information = info_gorn_takeback_info;
	important = 0;
	permanent = 0;
	description = "Отвоевать вчетвером? А остальные что делать будут?";
};


func int info_gorn_takeback_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_post))
	{
		return TRUE;
	};
};

func void info_gorn_takeback_info()
{
	var int guild;
	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01");	//Отвоевать вчетвером? А остальные что делать будут?
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02");	//Лобовая атака ничего нам не даст. Люди Гомеза слишком хорошо подготовились к ней!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03");	//Мы хотим перебить их по одному, незаметно. Думаю, нам это удастся.
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04");	//Ли просил меня передать тебе кое-что.
	guild = Npc_GetTrueGuild(hero);
	if(guild == GIL_SLD)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05");	//Возглавлять операцию он поручает тебе, ты ведь один из лучших наемников.
	}
	else if(guild == GIL_KDW)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06");	//Тебе будет поручено провести эту операцию. Ты же один из сильнейших магов Воды и у тебя богатый опыт сражений.
	}
	else if(guild == GIL_ORG)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07");	//Он поручает тебе провести эту операцию, так как ты один из лучших воров лагеря.
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08");	//Ты не из нашего лагеря, но ты показал, что достоит нашего доверия.
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09");	//Мы предлагаем тебе провести эту операцию.
	};
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10");	//Я пойду с тобой. Вместе мы справимся.
};


instance INFO_GORN_SECOND(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_second_condition;
	information = info_gorn_second_info;
	important = 0;
	permanent = 0;
	description = "Сперва шахта, а что потом?";
};


func int info_gorn_second_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_post))
	{
		return TRUE;
	};
};

func void info_gorn_second_info()
{
	AI_Output(hero,self,"Info_Gorn_SECOND_15_01");	//Сперва шахта, а что потом?
	AI_Output(self,hero,"Info_Gorn_SECOND_09_02");	//Как только мы захватим шахту, мы будем искать тот проход в горах, которым воспользовались люди Гомеза.
	AI_Output(self,hero,"Info_Gorn_SECOND_09_03");	//Когда мы его перекроем, мы снова сможем контролировать ситуацию.
	AI_Output(hero,self,"Info_Gorn_SECOND_15_04");	//Понятно.  
};


instance INFO_GORN_WHYME(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_whyme_condition;
	information = info_gorn_whyme_info;
	important = 0;
	permanent = 0;
	description = "Но почему здесь понадобился именно я?";
};


func int info_gorn_whyme_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_takeback))
	{
		return TRUE;
	};
};

func void info_gorn_whyme_info()
{
	AI_Output(hero,self,"Info_Gorn_WHYME_15_01");	//Но почему здесь понадобился именно я?
	AI_Output(self,hero,"Info_Gorn_WHYME_09_02");	//Ты уже много раз доказывал нам свою храбрость и способность мыслить.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_03");	//Кроме того, ты лучше всех знаешь Старый лагерь и его стражников.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_04");	//Думаю, только ты можешь справиться с этим ответственным заданием.
};


instance INFO_GORN_KICKBUTT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_kickbutt_condition;
	information = info_gorn_kickbutt_info;
	important = 0;
	permanent = 0;
	description = "Ладно, пойдем, покажем этим непрошенным гостям...";
};


func int info_gorn_kickbutt_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_whyme) && !Npc_KnowsInfo(hero,info_gorn_myway))
	{
		return TRUE;
	};
};

func void info_gorn_kickbutt_info()
{
	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01");	//Ладно, пойдем, покажем этим непрошенным гостям, что значит зариться на чужое добро!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02");	//Я так и думал, что ты согласишься!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03");	//Вот, возьми этот ключ. Он открывает дверь в караульную у входа в шахту.
	b_story_gornjoins();
};


instance INFO_GORN_MYWAY(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_myway_condition;
	information = info_gorn_myway_info;
	important = 0;
	permanent = 0;
	description = "Почему бы и нет. Мне все равно нужно попасть в шахту!";
};


func int info_gorn_myway_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_whyme) && !Npc_KnowsInfo(hero,info_gorn_kickbutt))
	{
		return TRUE;
	};
};

func void info_gorn_myway_info()
{
	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01");	//Почему бы и нет. Мне все равно нужно попасть в шахту!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02");	//Я так и думал, что ты согласишься!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03");	//Вот, возьми этот ключ. Он открывает дверь в караульную у входа в шахту.
	b_story_gornjoins();
};


instance INFO_GORN_WOLF(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_wolf_condition;
	information = info_gorn_wolf_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_wolf_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_076") < 500))
	{
		return TRUE;
	};
};

func void info_gorn_wolf_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_WOLF_09_01");	//Да, чуть не забыл!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_02");	//Вор по имени Волк хотел встретиться с тобой перед тем, как мы пойдем в шахту.
	Info_ClearChoices(info_gorn_wolf);
	Info_AddChoice(info_gorn_wolf,"Он может подождать. Нам предстоят более важные дела.",info_gorn_wolf_fm);
	Info_AddChoice(info_gorn_wolf,"Что ж, пойду узнаю, что он хотел.",info_gorn_wolf_wolf);
	b_logentry(CH4_ULUMULU,"Волк, один из воров, хочет поговорить со мной, перед тем как мы спустимся в шахту. Мне нужно его увидеть.");
	GORN_GOTOWOLF = TRUE;
};

func void info_gorn_wolf_fm()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_04");	//Он может подождать. Нам предстоят более важные дела.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_05");	//Как хочешь!
	AI_StopProcessInfos(self);
};

func void info_gorn_wolf_wolf()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_06");	//Что ж, пойду узнаю, что он хотел.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_07");	//Хорошо. Я подожду тебя здесь.
	GORN_JOINEDFORFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_LEAVEFORPOST(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_leaveforpost_condition;
	information = info_gorn_leaveforpost_info;
	important = 1;
	permanent = 1;
};


func int info_gorn_leaveforpost_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_074") < 2000) && (FREEMINEORC_LOOKINGULUMULU != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_gorn_leaveforpost_info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,info_gorn_wolf))
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01");	//Мне кажется, ты хочешь поговорить с Волком!
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02");	//Нет, нам не туда. Пойдем к шахте.
	};
	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03");	//Я буду ждать тебя здесь.
	GORN_JOINEDFORFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_REJOINFORFM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_rejoinforfm_condition;
	information = info_gorn_rejoinforfm_info;
	important = 0;
	permanent = 1;
	description = "Пойдем в шахту!";
};


func int info_gorn_rejoinforfm_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_myway) || Npc_KnowsInfo(hero,info_gorn_kickbutt)) && (Npc_GetDistToWP(hero,"OW_PATH_075_GUARD4") < 1000) && !GORN_JOINEDFORFM)
	{
		return TRUE;
	};
};

func void info_gorn_rejoinforfm_info()
{
	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01");	//Пойдем в шахту!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02");	//Пришло время расправиться с этими стражниками.
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03");	//Иди вперед, а я пойду за тобой!
	GORN_JOINEDFORFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowToFMC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RAZOR(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_razor_condition;
	information = info_gorn_razor_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_razor_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_3000") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_razor_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01");	//Осторожно.
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02");	//Они тоже охотятся стаями, как и глорхи, только они гораздо опаснее.
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03");	//Мы должны убить их. Ты же знаешь, я не люблю, когда за спиной остаются враги.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMCENTRANCE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmcentrance_condition;
	information = info_gorn_fmcentrance_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_fmcentrance_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"FMC_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_fmcentrance_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01");	//Подожди-ка, видишь эти тела?
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02");	//Иди к входу в шахту, а я буду тебя прикрывать. 
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03");	//Когда ты спустишься, я пойду за тобой.
	Npc_ExchangeRoutine(self,"WaitFMC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMGATE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmgate_condition;
	information = info_gorn_fmgate_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_fmgate_condition()
{
	if(GORN_JOINEDFORFM && !FM_GATEOPEN && (Npc_GetDistToWP(hero,"FMC_FM_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_fmgate_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01");	//Я слышал, как на тебя кто-то напал, и пришел на помощь.
	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02");	//А, это был один старый знакомый... Но с ним уже разобрались.
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03");	//Хорошо. Открывай ворота, а я прослежу за ситуацией.
	Npc_ExchangeRoutine(self,"WaitFM");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_AFTERFM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_afterfm_condition;
	information = info_gorn_afterfm_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_afterfm_condition()
{
	if(FREEMINEORC_LOOKINGULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_afterfm_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01");	//О, нелегко нам далась эта битва.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02");	//Никогда бы не подумал, что люди Гомеза способны так обороняться.
	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03");	//Главное, что мы смогли освободить от них нашу шахту.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04");	//Я останусь здесь и буду следить за тем, чтобы никто чужой сюда не прошел.
	b_story_leftfm();
	LEE_FREEMINEREPORT = 1;
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMWATCH(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmwatch_condition;
	information = info_gorn_fmwatch_info;
	important = 0;
	permanent = 1;
	description = "Как дела?";
};


func int info_gorn_fmwatch_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_afterfm))
	{
		return TRUE;
	};
};

func void info_gorn_fmwatch_info()
{
	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01");	//Как дела?
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02");	//Кругом тихо, словно в Свободной шахте не осталось живых.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03");	//Но если Ли не пришлет подкрепление, то эта тишина продлится недолго.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04");	//Ну а я пока постараюсь расположиться поудобнее.
};


instance INFO_GORN_FOUNDULUMULU(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_foundulumulu_condition;
	information = info_gorn_foundulumulu_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_foundulumulu_condition()
{
	if(FREEMINEORC_LOOKINGULUMULU == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void info_gorn_foundulumulu_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01");	//Какая странная у тебя штуковина на руке. Кажется, ее сделали орки.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02");	//Неужели ты взял ее у тех орков, что были рабами на Старой шахте?
	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03");	//У орков он считается знаком дружбы. Я хочу с ним зайти в город орков.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04");	//Очень надеюсь, что орки не трогают тех, кто носит этот... предмет!
	b_kapitelwechsel(5);
	AI_StopProcessInfos(self);
};

