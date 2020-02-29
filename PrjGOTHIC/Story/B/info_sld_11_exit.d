
instance INFO_SLD_11_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sld_11_exit_condition;
	information = info_sld_11_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sld_11_exit_condition()
{
	return 1;
};

func void info_sld_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SLD_11_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sld_11_einervoneuchwerden_condition;
	information = info_sld_11_einervoneuchwerden_info;
	permanent = 1;
	description = "Я бы хотел быть наемником магов.";
};


func int info_sld_11_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_sld_11_einervoneuchwerden_info()
{
	var C_NPC gorn;
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00");	//Я бы хотел быть наемником магов.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01");	//Это не так уж сложно. Если ты докажешь, что хочешь работать на нас, Ли примет тебя.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02");	//Но ему нужны такие люди, которые хорошо владеют мечом. А ты можешь сказать это о себе?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03");	//Ну...я...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04");	//Так я и подумал. Если ты еще не передумал, поговори с Горном. Когда-то он уже тренировал новичков.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05");	//Может быть, тебе повезет, и он согласится поработать над твоей техникой.
	gorn = Hlp_GetNpc(pc_fighter);
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_11_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sld_11_wichtigepersonen_condition;
	information = info_sld_11_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_sld_11_wichtigepersonen_condition()
{
	return 1;
};

func void info_sld_11_wichtigepersonen_info()
{
	var C_NPC lee;
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01");	//Мы делаем то, что говорят нам маги. Но чаще всего они просто молчат. Они изучают гору руды и копаются в своих книгах.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02");	//Вообще-то, командует здесь Ли. Он наш лидер.
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_11_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sld_11_daslager_condition;
	information = info_sld_11_daslager_info;
	permanent = 1;
	description = "А как у вас тут? Проблем много?";
};


func int info_sld_11_daslager_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_11_daslager_info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00");	//А как у вас тут? Проблем много?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01");	//У нас здесь всегда есть какие-нибудь проблемы. Воры делают все, что хотят, а наемники охраняют магов и защищают лагерь.
};


instance INFO_SLD_11_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sld_11_dielage_condition;
	information = info_sld_11_dielage_info;
	permanent = 1;
	description = "Ну, а у тебя как жизнь?";
};


func int info_sld_11_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_11_dielage_info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//Ну, а у тебя как жизнь?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01");	//Пока все спокойно...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02");	//Пока?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03");	//Если воры и дальше будут грабить караваны Гомеза, он соберет армию и нападет на наш лагерь.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04");	//А это уже будет совсем плохо.
};


instance INFO_SLD_11_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_sld_11_krautprobe_condition;
	information = info_sld_11_krautprobe_info;
	permanent = 1;
	description = "Болотника хочешь?";
};


func int info_sld_11_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_sld_11_krautprobe_info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00");	//Болотника хочешь?
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
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01");	//Конечно. Вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02");	//Если у тебя будет еще, ты знаешь, где меня найти...
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00");	//Сначала принеси его, а потом поговорим.
	};
};

func void b_assignambientinfos_sld_11(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_sld_11_exit.npc = Hlp_GetInstanceID(slf);
	info_sld_11_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sld_11_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sld_11_daslager.npc = Hlp_GetInstanceID(slf);
	info_sld_11_dielage.npc = Hlp_GetInstanceID(slf);
	info_sld_11_krautprobe.npc = Hlp_GetInstanceID(slf);
};

