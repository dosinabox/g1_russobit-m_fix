
instance DIA_LEFTY_EXIT(C_INFO)
{
	npc = org_844_lefty;
	nr = 999;
	condition = dia_lefty_exit_condition;
	information = dia_lefty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_lefty_exit_condition()
{
	return 1;
};

func void dia_lefty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEFTY_FIRSTATNIGHT(C_INFO)
{
	npc = org_844_lefty;
	nr = 1;
	condition = dia_lefty_firstatnight_condition;
	information = dia_lefty_firstatnight_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_lefty_firstatnight_condition()
{
	if(Wld_IsTime(19,0,8,0) && !Npc_KnowsInfo(hero,dia_lefty_first))
	{
		return 1;
	};
};

func void dia_lefty_firstatnight_info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_846_Hello_07_01");	//� ������� �� �����.
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//� �� ������ ��� ���-�� ����������?
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01");	//�� ��� ��������� �� ����!
	AI_StopProcessInfos(self);
};


instance DIA_LEFTY_FIRST(C_INFO)
{
	npc = org_844_lefty;
	nr = 1;
	condition = dia_lefty_first_condition;
	information = dia_lefty_first_info;
	permanent = 0;
	important = 1;
};


func int dia_lefty_first_condition()
{
	if(Wld_IsTime(8,0,19,0) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE)) && (hero.level < 16)
	{
		return 1;
	};
};

func void dia_lefty_first_info()
{
	AI_Output(self,other,"DIA_Lefty_First_07_00");	//��, �� ������� �����, ��? ��� ����� ����� �������, ������� ������ �������� ���� ��� ��������, ��� �������� �� �����.
	AI_Output(self,other,"DIA_Lefty_First_07_01");	//���� ������ ��� ��� �� �������� ����� ����������. ��� �������?
	Npc_ExchangeRoutine(self,"start");
	Log_CreateTopic(CH1_CARRYWATER,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARRYWATER,LOG_RUNNING);
	b_logentry(CH1_CARRYWATER,"����� �� ������ ������ �������� ���� �������� ���� ����������, ���������� �� ������� �����.");
	Info_ClearChoices(dia_lefty_first);
	Info_AddChoice(dia_lefty_first,"�����, �����...",dia_lefty_first_later);
	Info_AddChoice(dia_lefty_first,"��� ���� ���� ����!",dia_lefty_first_never);
	Info_AddChoice(dia_lefty_first,"������, � ������ ����.",dia_lefty_first_yes);
};

func void dia_lefty_first_yes()
{
	AI_Output(other,self,"DIA_Lefty_First_Yes_15_00");	//������, � ������ ����.
	AI_Output(self,other,"DIA_Lefty_First_Yes_07_01");	//������! ��� � �����. �� ���� ���� ���� � ������, ��� ����� ������.
	LEFTY_WORKDAY = b_setdaytolerance();
	LEFTY_MISSION = LOG_RUNNING;
	AN_BAUERN_VERTEILT = 0;
	b_logentry(CH1_CARRYWATER,"� ���������� ������� ���� ����������. �����, ��� ������� ������� �������� ����������. ���� � ����� �������� � ��� ����������� �������� �����.");
	Info_ClearChoices(dia_lefty_first);
};

func void dia_lefty_first_never()
{
	AI_Output(other,self,"DIA_Lefty_First_Never_15_00");	//��� ���� ���� ����!
	AI_Output(self,other,"DIA_Lefty_First_Never_07_01");	//� �������� ��� �� �������������! �����, ���� ������� ������� ������� �������!
	LEFTY_WORKDAY = b_setdaytolerance();
	LEFTY_MISSION = LOG_FAILED;
	b_logentry(CH1_CARRYWATER,"� ��������� �� ����������� �����. ��� ������� ��� � ������! �����, � ������ ������ ��� ���� �� ������� ���������.");
	Info_ClearChoices(dia_lefty_first);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	if(Npc_GetTrueGuild(hero) == GIL_ORG || Npc_GetTrueGuild(hero) == GIL_SLD || Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		AI_StartState(self,zs_attack,0,"");
	}
	else
	{
		AI_StartState(self,zs_attack,1,"");
		//npc_setpermattitude(self,ATT_HOSTILE);
		//Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};

func void dia_lefty_first_later()
{
	AI_Output(other,self,"DIA_Lefty_First_Later_15_00");	//�����, �����...
	AI_Output(self,other,"DIA_Lefty_First_Later_07_01");	//����� �� ���������. ��� �����, ����� �� ����� ��� ������. ��� �� ������ �������� ��� ���?
};


var int carriedwaterforlefty;

instance DIA_LEFTY_WORKDAY(C_INFO)
{
	npc = org_844_lefty;
	nr = 1;
	condition = dia_lefty_workday_condition;
	information = dia_lefty_workday_info;
	permanent = 1;
	important = 1;
};


func int dia_lefty_workday_condition()
{
	//if((((LEFTY_MISSION == LOG_RUNNING)) && Wld_IsTime(8,0,19,0) || (LEFTY_MISSION == LOG_SUCCESS)) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && ((LEFTY_WORKDAY <= (Wld_GetDay() - 1)) || (LEFTY_MISSION == LOG_SUCCESS)))
	if(Wld_IsTime(8,0,19,0) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && (LEFTY_WORKDAY <= (Wld_GetDay() - 1)))
	{
		return 1;
	};
};

func void dia_lefty_workday_info()
{
	if(LEFTY_MISSION == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_00");	//���� �������! � ��� ���� ��� ���� ����.
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_01");	//���������� ���� �� ���� ��� ������� ��� ���������! ��� � ����� � ������� ���� ���������� ����, ������� �� ���� ����. �� �����?
		LEFTY_WORKDAY = b_setdaytolerance();
		LEFTY_MISSION = LOG_RUNNING;
		AN_BAUERN_VERTEILT = 0;
		b_logentry(CH1_CARRYWATER,"� ����� �������� �����. �� �����, ����� � ���� ���� � ����� � ������ �� ����������.");
		AI_StopProcessInfos(self);
	}
	else if(LEFTY_MISSION == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_07_00");	//��, ��!
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_00");	//� �� ������ ����, ��� �� ������ �������� ���� ����������!
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_01");	//��� �� ��������, ����� ���-�� �� ������ ������ �����!
		LEFTY_WORKDAY = b_setdaytolerance();
		LEFTY_MISSION = LOG_FAILED;
		b_logentry(CH1_CARRYWATER,"����� ��� � ���������, �����, ��� � ��� �� ������ ����! ������ ����� ���� � ���� ���������������� �����.");
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		if(Npc_GetTrueGuild(hero) == GIL_ORG || Npc_GetTrueGuild(hero) == GIL_SLD || Npc_GetTrueGuild(hero) == GIL_KDW)
		{
			AI_StartState(self,zs_attack,0,"");
		}
		else
		{
			AI_StartState(self,zs_attack,1,"");
			//npc_setpermattitude(self,ATT_HOSTILE);
			//Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
	}
	else if(LEFTY_MISSION == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_00");	//�������! �� ��� �� ������ ��� �����������.
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_01");	//�����, �� ���������� � ���� �������. ������ �� ������ ��������� ���� ������ ����. ��� � �������!
		LEFTY_WORKDAY = b_setdaytolerance();
		LEFTY_MISSION = LOG_RUNNING;
		AN_BAUERN_VERTEILT = 0;
		if(!CARRIEDWATERFORLEFTY)
		{
			b_logentry(CH1_CARRYWATER,"������ �� �������. � ������ ����, � ������ ���� ����� �����, ����� � ����� ��� ������ ������ ����.");
			b_givexp(XP_LEFTYCARRIEDWATER);
			CARRIEDWATERFORLEFTY = TRUE;
		};
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEFTY_NEVERAGAIN(C_INFO)
{
	npc = org_844_lefty;
	nr = 1;
	condition = dia_lefty_neveragain_condition;
	information = dia_lefty_neveragain_info;
	permanent = 1;
	description = "��� ���� ���� ����. � �� ���� ������ ������ �� ������������.";
};


func int dia_lefty_neveragain_condition()
{
	if((LEFTY_MISSION == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_lefty_neveragain_info()
{
	AI_Output(other,self,"DIA_Lefty_NeverAgain_15_00");	//��� ���� ���� ����. � �� ���� ������ ������ �� ������������.
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_01");	//���? ����� ���-�� ����� ����������?
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_02");	//��-�����, ���� ������� ���������, ��� ����� �������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	if(Npc_GetTrueGuild(hero) == GIL_ORG || Npc_GetTrueGuild(hero) == GIL_SLD || Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		AI_StartState(self,zs_attack,0,"");
	}
	else
	{
		AI_StartState(self,zs_attack,1,"");
		//npc_setpermattitude(self,ATT_HOSTILE);
		//Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};


var int leftywasbeaten;

instance DIA_LEFTY_PERM(C_INFO)
{
	npc = org_844_lefty;
	nr = 1;
	condition = dia_lefty_perm_condition;
	information = dia_lefty_perm_info;
	permanent = 1;
	description = "��� ����, ���� ���?";
};


func int dia_lefty_perm_condition()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_lefty_perm_info()
{
	AI_Output(other,self,"DIA_Lefty_PERM_15_00");	//��� ����, ���� ���?
	AI_Output(self,other,"DIA_Lefty_PERM_07_01");	//�, �� ��� ���� �� ���� �����?
	if(!LEFTYWASBEATEN)
	{
		b_logentry(CH1_CARRYWATER,"� �������� �����, ��� ����� ��� ������� �� ����. ����, ��� ������ ��������� ������ � ����� ������.");
		Log_SetTopicStatus(CH1_CARRYWATER,LOG_SUCCESS);
		b_givexp(XP_LEFTYCONFRONTED);
		LEFTYWASBEATEN = TRUE;
	};
	Info_ClearChoices(dia_lefty_perm);
	Info_AddChoice(dia_lefty_perm,"������ ����� ����������, ��� � ���� ����.",dia_lefty_perm_nothing);
	Info_AddChoice(dia_lefty_perm,"��� �������, ��������� ����� ����.",dia_lefty_perm_durstig);
	Info_AddChoice(dia_lefty_perm,"� ���� ��� ������ ����, � � ������ ���� ���������...",dia_lefty_perm_aufsmaul);
};

func void dia_lefty_perm_aufsmaul()
{
	AI_Output(other,self,"DIA_Lefty_PERM_AufsMaul_15_00");	//� ���� ��� ������ ����, � � ������ ���� ���������... �������� ��� �������.
	b_say(self,other,"$WATCHYOUAIMANGRY");
	Info_ClearChoices(dia_lefty_perm);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	//npc_setpermattitude(self,ATT_HOSTILE);
	//Npc_SetTempAttitude(self,ATT_HOSTILE);
};

func void dia_lefty_perm_durstig()
{
	AI_Output(other,self,"DIA_Lefty_PERM_Durstig_15_00");	//��� �������, ��������� ����� ����.
	AI_Output(self,other,"DIA_Lefty_PERM_Durstig_07_01");	//� ���������� ���-������ ���������... �� ��������.
	AI_StopProcessInfos(self);
};

func void dia_lefty_perm_nothing()
{
	AI_Output(other,self,"DIA_Lefty_PERM_Nothing_15_00");	//������ ����� ����������, ��� � ���� ����.
	AI_StopProcessInfos(self);
};

