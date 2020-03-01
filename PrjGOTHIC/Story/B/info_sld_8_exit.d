
instance INFO_SLD_8_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sld_8_exit_condition;
	information = info_sld_8_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_sld_8_exit_condition()
{
	return 1;
};

func void info_sld_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SLD_8_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sld_8_einervoneuchwerden_condition;
	information = info_sld_8_einervoneuchwerden_info;
	permanent = 1;
	description = "Вам нужны люди?";
};


func int info_sld_8_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_sld_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//Вам нужны люди?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//Ли не принимает к себе в солдаты людей, которые никак себя не проявили. Ему нужны опытные наемники.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//Если ты хочешь присоединиться к нашему лагерю, тебе сначала нужно обратиться к ворам.
};


instance INFO_SLD_8_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sld_8_wichtigepersonen_condition;
	information = info_sld_8_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем руководит?";
};


func int info_sld_8_wichtigepersonen_condition()
{
	return 1;
};

func void info_sld_8_wichtigepersonen_info()
{
	var C_NPC lee;
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//Кто здесь всем руководит?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//Ли. Он командует наемниками. Он договорился с магами. Мы их охраняем, а они находят способ вытащить нас отсюда.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//Значит, все-таки маги все контролируют?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//Нет. На самом деле в этом лагере нет одного лидера. Многие просто перешли сюда из Старого лагеря.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//Здесь каждый сам за себя. И только одно нас объединяет - желание выбраться из этой колонии как можно быстрее. Так что лучше собрать руду в общую кучу и взорвать ее, чем отдать хоть кусок королю!
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sld_8_daslager_condition;
	information = info_sld_8_daslager_info;
	permanent = 1;
	description = "Ты можешь рассказать мне об этом лагере?";
};


func int info_sld_8_daslager_condition()
{
	if(!c_npcbelongstonewcamp(other))
	{
		return 1;
	};
};

func void info_sld_8_daslager_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//Здесь очень много головорезов и воров, так что будь осторожен.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//У нас есть несколько неписаных законов, которые необходимо соблюдать. Первый: к магам могут заходить только наемники.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//Второй: никому нельзя приближаться к нашей руде. Третий: новичкам лучше не заходить в бар на озере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//Этот бар принадлежит ворам, а они не любят, когда вокруг него ходят незнакомые люди.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sld_8_dielage_condition;
	information = info_sld_8_dielage_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int info_sld_8_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_8_dielage_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//Как обычно. Слежу за тем, чтобы никто не беспокоил магов и не подходил к горе руды.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_sld_8_krautprobe_condition;
	information = info_sld_8_krautprobe_info;
	permanent = 1;
	description = "У меня есть немного болотника, может, будешь?";
};


func int info_sld_8_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_sld_8_krautprobe_info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//У меня есть немного болотника, может, будешь?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//А, давай. Вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//Спроси моих друзей. Они тоже не откажутся.
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//И где же твой болотник, а? У тебя его нет!
	};
};

func void b_assignambientinfos_sld_8(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_sld_8_exit.npc = Hlp_GetInstanceID(slf);
	info_sld_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sld_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sld_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_sld_8_dielage.npc = Hlp_GetInstanceID(slf);
	info_sld_8_krautprobe.npc = Hlp_GetInstanceID(slf);
};

