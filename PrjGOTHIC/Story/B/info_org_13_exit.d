
instance INFO_ORG_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_org_13_exit_condition;
	information = info_org_13_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_13_exit_condition()
{
	return 1;
};

func void info_org_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_13_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_org_13_einervoneuchwerden_condition;
	information = info_org_13_einervoneuchwerden_info;
	permanent = 1;
	description = "Что я должен сделать, чтобы присоединиться к лагерю?";
};


func int info_org_13_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_org_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00");	//Что я должен сделать, чтобы присоединиться к лагерю?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01");	//Иди на поле и помоги крестьянам собрать рис, а там посмотрим.
};


instance INFO_ORG_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_org_13_wichtigepersonen_condition;
	information = info_org_13_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_org_13_wichtigepersonen_condition()
{
	return 1;
};

func void info_org_13_wichtigepersonen_info()
{
	var C_NPC lee;
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01");	//Ли, лидер наемников, если ты это хочешь знать. Но я не наемник и мне он не может приказывать.
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_ORG_13_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_org_13_daslager_condition;
	information = info_org_13_daslager_info;
	permanent = 1;
	description = "Я бы хотел ознакомиться с лагерем.";
};


func int info_org_13_daslager_condition()
{
	return 1;
};

func void info_org_13_daslager_info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00");	//Я бы хотел ознакомиться с лагерем.
	if(Npc_GetTrueGuild(other) != GIL_STT && Npc_GetTrueGuild(other) != GIL_GRD && Npc_GetTrueGuild(other) != GIL_KDF)
	{
		AI_Output(self,other,"Info_Org_13_DasLager_13_01");	//Так иди и осмотри его сам. Ты не из людей Гомеза, как я вижу, так что тебя никто не тронет.
	}
	else
	{
		AI_Output(self,other,"SVM_13_WhatDoYouWant");	//Что тебе от меня нужно?
	};
};


instance INFO_ORG_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_org_13_dielage_condition;
	information = info_org_13_dielage_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int info_org_13_dielage_condition()
{
	return 1;
};

func void info_org_13_dielage_info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01");	//А тебе что от меня нужно?
};


instance INFO_ORG_13_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_org_13_krautprobe_condition;
	information = info_org_13_krautprobe_info;
	permanent = 1;
	description = "Просто подумал, может быть, ты захочешь болотника.";
};


func int info_org_13_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_org_13_krautprobe_info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00");	//Просто подумал, может быть, ты захочешь болотника.
	if((Npc_HasItems(other,itmijoint_1) > 0) || (Npc_HasItems(other,itmijoint_2) > 0) || (Npc_HasItems(other,itmijoint_3) > 0))
	{
		if(Npc_HasItems(other,itmijoint_1))
		{
			b_giveinvitems(other,self,itmijoint_1,1);
		}
		else if(Npc_HasItems(other,itmijoint_2))
		{
			b_giveinvitems(other,self,itmijoint_2,1);
		}
		else if(Npc_HasItems(other,itmijoint_3))
		{
			b_giveinvitems(other,self,itmijoint_3,1);
		};
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01");	//А у тебя он есть? Я куплю у тебя сигарету за 10 кусков руды.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02");	//Возвращайся в любое время, брат.
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00");	//Нет у тебя никакого болотника. Не стоит меня обманывать!
	};
};

func void b_assignambientinfos_org_13(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_org_13_exit.npc = Hlp_GetInstanceID(slf);
	info_org_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_org_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_org_13_daslager.npc = Hlp_GetInstanceID(slf);
	info_org_13_dielage.npc = Hlp_GetInstanceID(slf);
	info_org_13_krautprobe.npc = Hlp_GetInstanceID(slf);
};

