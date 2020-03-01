
instance INFO_VLK_4_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_4_exit_condition;
	information = info_vlk_4_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_vlk_4_exit_condition()
{
	return 1;
};

func void info_vlk_4_exit_info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Спасибо. Удачи!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Выше нос, парень.
	AI_StopProcessInfos(self);
};


instance INFO_VLK_4_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_4_einervoneuchwerden_condition;
	information = info_vlk_4_einervoneuchwerden_info;
	permanent = 1;
	description = "Что нужно сделать, чтобы присоединиться к этому лагерю?";
};


func int info_vlk_4_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_4_einervoneuchwerden_info()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Что нужно сделать, чтобы присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Чтобы тебя взяли к Стражникам или Призракам, ты хочешь сказать? Это не так уж просто. Старик Торус пустит тебя к Гомезу только тогда, когда ты пройдешь испытание.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//А еще тебе придется познакомиться с нужными людьми. Но пока ты не примкнешь к одному из лагерей, никто не будет воспринимать тебя всерьез.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//На твоем месте я бы сначала пошел к Призракам. Ты наверняка сможешь найти среди них того, кто поможет тебе. Не даром, конечно же.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_VLK_4_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_4_wichtigepersonen_condition;
	information = info_vlk_4_wichtigepersonen_info;
	permanent = 1;
	description = "Кто еще может быть мне полезен?";
};


func int info_vlk_4_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_4_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//Кто еще может быть мне полезен?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Тебе стоит поговорить с Граво. Постарайся не ссориться с ним. Пусть он и рудокоп, но связан с серьезными людьми. Он даже ведет дела с Баронами.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Он может помочь тебе, если у тебя вдруг появятся недруги среди людей Гомеза.
};


instance INFO_VLK_4_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_4_daslager_condition;
	information = info_vlk_4_daslager_info;
	permanent = 1;
	description = "О чем еще мне стоит знать?";
};


func int info_vlk_4_daslager_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_vlk_4_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//О чем еще мне стоит знать?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Если работа в шахте тебя не устраивает, то лучше всего тебе будет пойти к площадке между северными воротами и воротами замка.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Если повезет, тебя заметит Торус или Диего. Не отказывайся от их поручений, если хочешь проявить себя здесь. Стать одним из людей Гомеза - мечта многих.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//А может быть, ты даже встретишь мага. Иногда они выходят, чтобы дать поручение. Они всегда хорошо платят за такую работу.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Маги выходят из замка? Когда?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Этого я не знаю. Спроси лучше тех, кто живет неподалеку.
};


instance INFO_VLK_4_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_4_dielage_condition;
	information = info_vlk_4_dielage_info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int info_vlk_4_dielage_condition()
{
	return 1;
};

func void info_vlk_4_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Как у тебя дела?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//Так же, как и двадцать лет назад. За это время здесь почти ничего не изменилось.
};

func void b_assignambientinfos_vlk_4(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_4_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_dielage.npc = Hlp_GetInstanceID(slf);
};

