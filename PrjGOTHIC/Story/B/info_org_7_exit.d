
instance INFO_ORG_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_org_7_exit_condition;
	information = info_org_7_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_org_7_exit_condition()
{
	return 1;
};

func void info_org_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_7_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_org_7_einervoneuchwerden_condition;
	information = info_org_7_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу присоединиться к вашему лагерю. Как это сделать?";
};


func int info_org_7_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_org_7_einervoneuchwerden_info()
{
	var C_NPC lares;
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к вашему лагерю. Как это сделать?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01");	//Мы можем принять тебя в нашу шайку. Но ты должен доказать нам, что ты против Гомеза.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02");	//И как это можно доказать?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03");	//На твоем месте я бы принес Ларсу что-нибудь очень важное из Старого лагеря или из их шахты.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_ORG_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_org_7_wichtigepersonen_condition;
	information = info_org_7_wichtigepersonen_info;
	permanent = 1;
	description = "Кто у вас главный?";
};


func int info_org_7_wichtigepersonen_condition()
{
	return 1;
};

func void info_org_7_wichtigepersonen_info()
{
	var C_NPC lares;
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00");	//Кто у вас главный?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01");	//Глава нашей шайки - Ларс. Большинство наших подчиняется ему.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02");	//Но он никогда не указывает нам, что делать.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_ORG_7_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_org_7_daslager_condition;
	information = info_org_7_daslager_info;
	permanent = 1;
	description = "Расскажешь мне о лагере?";
};


func int info_org_7_daslager_condition()
{
	return 1;
};

func void info_org_7_daslager_info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00");	//Расскажешь мне о лагере?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01");	//В нашем лагере нет никаких особых правил. Каждый делает то, что считает нужным, но нас так много, что Гомезу не так уж легко будет от нас избавиться.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02");	//А он бы сделал это с огромным удовольствием.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03");	//Почему же он вас так не любит?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04");	//Мы воруем его вещи!
};


instance INFO_ORG_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_org_7_dielage_condition;
	information = info_org_7_dielage_info;
	permanent = 1;
	description = "Каковы здешние порядки?";
};


func int info_org_7_dielage_condition()
{
	return 1;
};

func void info_org_7_dielage_info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01");	//Ты прибыл сюда недавно, да?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02");	//Маги многие годы вели приготовления, чтобы взорвать гору руды. Судя по всему, очень скоро они так и сделают.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03");	//По крайней мере, именно это мне приходит в голову, когда я вижу нашу гору руды, которую добыли рудокопы.
};


instance INFO_ORG_7_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_org_7_krautprobe_condition;
	information = info_org_7_krautprobe_info;
	permanent = 1;
	description = "Болотника хочешь?";
};


func int info_org_7_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_org_7_krautprobe_info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00");	//Болотника хочешь?
	if((Npc_HasItems(other,itmijoint_1) > 0) || (Npc_HasItems(other,itmijoint_2) > 0) || (Npc_HasItems(other,itmijoint_3) > 0))
	{
		if(Npc_HasItems(other,itmijoint_1))
		{
			b_giveinvitems(other,self,itmijoint_1,1);
			b_printtrademsg1("Отдан 'Новичок'.");
		}
		else if(Npc_HasItems(other,itmijoint_2))
		{
			b_giveinvitems(other,self,itmijoint_2,1);
			b_printtrademsg1("Отдан 'Северный темный'.");
		}
		else if(Npc_HasItems(other,itmijoint_3))
		{
			b_giveinvitems(other,self,itmijoint_3,1);
			b_printtrademsg1("Отдан 'Зов мечты'.");
		};
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01");	//Да, вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02");	//Если захочешь продать еще, приходи ко мне.
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00");	//Какого болотника? У тебя же его нет!
	};
};

func void b_assignambientinfos_org_7(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_org_7_exit.npc = Hlp_GetInstanceID(slf);
	info_org_7_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_org_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_org_7_daslager.npc = Hlp_GetInstanceID(slf);
	info_org_7_dielage.npc = Hlp_GetInstanceID(slf);
	info_org_7_krautprobe.npc = Hlp_GetInstanceID(slf);
};

