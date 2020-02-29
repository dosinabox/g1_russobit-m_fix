
instance INFO_ORG_6_EXIT(C_INFO)
{
	nr = 999;
	condition = info_org_6_exit_condition;
	information = info_org_6_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_6_exit_condition()
{
	return 1;
};

func void info_org_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_6_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_org_6_einervoneuchwerden_condition;
	information = info_org_6_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу присоединиться к вам.";
};


func int info_org_6_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_org_6_einervoneuchwerden_info()
{
	var C_NPC lares;
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01");	//У нас только Ларс может решить, кого брать к себе, а кого нет.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02");	//Но без причины тебя к нему никто не пустит.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03");	//А какая может быть причина?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04");	//Например, если кто-нибудь пошлет тебя к нему.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_ORG_6_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_org_6_wichtigepersonen_condition;
	information = info_org_6_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_org_6_wichtigepersonen_condition()
{
	return 1;
};

func void info_org_6_wichtigepersonen_info()
{
	var C_NPC lee;
	var C_NPC lares;
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01");	//Ты уже побывал в Старом лагере, да?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02");	//Так вот, здесь у нас нет главных. Правда, Ли пытается хоть как-то командовать нами, но его почти никто не слушает. Каждый делает что хочет.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03");	//Если здесь и можно кого-то считать главным, то только Ларса. Но у него хватает ума не вмешиваться в чужие дела.
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_ORG_6_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_org_6_daslager_condition;
	information = info_org_6_daslager_info;
	permanent = 1;
	description = "Ты можешь рассказать мне об этом месте?";
};


func int info_org_6_daslager_condition()
{
	return 1;
};

func void info_org_6_daslager_info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00");	//Ты можешь рассказать мне об этом месте?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01");	//В центре нашей пещеры есть огромная яма. В нее мы складываем добытую руду. Если захочешь урвать себе хоть кусок, тебя быстро проучат.
	AI_Output(self,other,"Info_Org_6_DasLager_06_02");	//Как-то я и сам попытался это сделать, но не вышло. Ее слишком хорошо охраняют.
};


instance INFO_ORG_6_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_org_6_dielage_condition;
	information = info_org_6_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_org_6_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_org_6_dielage_info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01");	//А ты как думаешь? Мы не видим здесь ничего, кроме риса, и ждем своего шанса получить хоть лишний кусок руды.
	AI_Output(self,other,"Info_Org_6_DieLage_06_02");	//А потом идем в бар, чтобы напиться дешевого рисового шнапса.
};


instance INFO_ORG_6_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_org_6_krautprobe_condition;
	information = info_org_6_krautprobe_info;
	permanent = 1;
	description = "У меня есть болотник. Хочешь?";
};


func int info_org_6_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_org_6_krautprobe_info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//У меня есть болотник. Хочешь?
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
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01");	//Еще бы. Вот 10 кусков руды.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02");	//Если у тебя найдется еще, с удовольствием куплю.
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00");	//Где? У тебя же ничего нет.
	};
};

func void b_assignambientinfos_org_6(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_org_6_exit.npc = Hlp_GetInstanceID(slf);
	info_org_6_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_org_6_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_org_6_daslager.npc = Hlp_GetInstanceID(slf);
	info_org_6_dielage.npc = Hlp_GetInstanceID(slf);
	info_org_6_krautprobe.npc = Hlp_GetInstanceID(slf);
};

