
instance DIA_BAALORUN_EXIT(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 999;
	condition = dia_baalorun_exit_condition;
	information = dia_baalorun_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalorun_exit_condition()
{
	return 1;
};

func void dia_baalorun_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baalorun_ansprechbar;
var int baalorun_sakrileg;

instance DIA_BAALORUN_NOTALK(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 2;
	condition = dia_baalorun_notalk_condition;
	information = dia_baalorun_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baalorun_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALORUN_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baalorun_notalk_info()
{
	Info_ClearChoices(dia_baalorun_notalk);
	Info_AddChoice(dia_baalorun_notalk,DIALOG_ENDE,dia_baalorun_notalk_ende);
	Info_AddChoice(dia_baalorun_notalk,"� ����� ��� ���������, ��������?",dia_baalorun_notalk_imp);
	Info_AddChoice(dia_baalorun_notalk,"�� �������� � ����� ������!",dia_baalorun_notalk_sleeper);
	Info_AddChoice(dia_baalorun_notalk,"������! � ����� ���������!",dia_baalorun_notalk_hi);
};

func void dia_baalorun_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//������! � ����� ���������!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//�� �������� � ����� ������!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//� ����� ��� ���������, ��������?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_FIRSTTALK(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_firsttalk_condition;
	information = dia_baalorun_firsttalk_info;
	permanent = 0;
	important = 1;
};


func int dia_baalorun_firsttalk_condition()
{
	if(GHORIM_KICKHARLOK == LOG_SUCCESS)
	{
		BAALORUN_ANSPRECHBAR = TRUE;
		return 1;
	};
};

func void dia_baalorun_firsttalk_info()
{
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//����� ������ ���, ��� �� ����� ����� ������� ����� - ��� ������ ��������.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//������ ������� ���� ������� ��� ���������� ������� �������.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//��� ����� ��������� ���������������� � ��� ����� ��������.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//���� �������� �������� �� �������� ���. ��� � ��� � ������� � ����������� ������ ���� �� ������� ����.
	b_givexp(XP_BAALORUNTALKS);
	b_logentry(CH1_GHORIMSRELIEF,"������ ������ ������. ��, ������ � ����� ������...");
	Log_SetTopicStatus(CH1_GHORIMSRELIEF,LOG_SUCCESS);
	Log_CreateTopic(CH1_DELIVERWEED,LOG_MISSION);
	Log_SetTopicStatus(CH1_DELIVERWEED,LOG_RUNNING);
	b_logentry(CH1_DELIVERWEED,"� ����� ��������� �������, � ��� ��������� ������� ����������� �� ����� �����. ������ � ������ ������� ���� ������ ��������� ��� ������.");
	BAALORUN_FETCHWEED = LOG_RUNNING;
	Info_ClearChoices(dia_baalorun_firsttalk);
	Info_AddChoice(dia_baalorun_firsttalk,"������ �� ��������.",dia_baalorun_firsttalk_muteende);
	Info_AddChoice(dia_baalorun_firsttalk,"��� � ���� ����� ���� ���������?",dia_baalorun_firsttalk_where);
};

func void dia_baalorun_firsttalk_where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//��� � ���� ����� ���� ���������?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//� ��� �� �������� ���� �������� �������!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//������ �������, ���� �� ������� ���� ���������������� ��������! � ������. ���� ������ ����� ����� ��� ���� ���.
	Info_ClearChoices(dia_baalorun_firsttalk);
	AI_StopProcessInfos(self);
	BAALORUN_ANSPRECHBAR = FALSE;
};

func void dia_baalorun_firsttalk_muteende()
{
	Info_ClearChoices(dia_baalorun_firsttalk);
	AI_StopProcessInfos(self);
	BAALORUN_ANSPRECHBAR = FALSE;
};


instance DIA_BAALORUN_GOTWEED(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_gotweed_condition;
	information = dia_baalorun_gotweed_info;
	permanent = 0;
	important = 1;
};


func int dia_baalorun_gotweed_condition()
{
	if(VIRAN_BLOODFLIES == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_gotweed_info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//�� ���� ����� ���������...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//��� �� ������ ����������� � ���, ��� ���������� ���� � �������.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//� ����, �� ������� ������ ���� ����������.
	BAALORUN_ANSPRECHBAR = TRUE;
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	};
	b_logentry(CH1_JOINPSI,"���� ���� ������ ���� ������ �������������� �������, ��� ��� � ���� �������� ��������� ��������� �� �������.");
	b_givexp(XP_IMPRESSEDBAALORUN);
};


instance DIA_BAALORUN_WEEDATKALOMS(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_weedatkaloms_condition;
	information = dia_baalorun_weedatkaloms_info;
	permanent = 0;
	description = "� �������� �������� ��� ������.";
};


func int dia_baalorun_weedatkaloms_condition()
{
	if(BAALORUN_FETCHWEED == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_weedatkaloms_info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//� �������� �������� ��� ������.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//������� ���������. ��� ���� �� ��� ��������� �������.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//��� ���������� ���������� ���. �� ������� ��������������� �� ������ ���� ���, �� � �������, ��� ��� �������� ���� ������� ������.
	BAALORUN_ANSPRECHBAR = TRUE;
	b_givexp(XP_REPORTTOBAALORUN);
	CreateInvItem(self,itarscrollsleep);
	b_giveinvitems(self,other,itarscrollsleep,1);
};


instance DIA_BAALORUN_PERM(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 2;
	condition = dia_baalorun_perm_condition;
	information = dia_baalorun_perm_info;
	permanent = 1;
	description = "��� ���� ���� ������?";
};


func int dia_baalorun_perm_condition()
{
	if(BAALORUN_FETCHWEED == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_perm_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//��� ���� ���� ������?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//�� �� ���� �������� �������� ���� � ����, ������� � ��� ����� ���������. � ���� ������� � �� ������� � ������ ������.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//��� ������, ������� ���� ���������� � ����������� �������� �������.
};

