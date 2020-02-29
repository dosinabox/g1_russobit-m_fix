
instance DIA_HOMER_EXIT(C_INFO)
{
	npc = bau_935_homer;
	nr = 999;
	condition = dia_homer_exit_condition;
	information = dia_homer_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_homer_exit_condition()
{
	return 1;
};

func void dia_homer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOMER_HELLO(C_INFO)
{
	npc = bau_935_homer;
	nr = 1;
	condition = dia_homer_hello_condition;
	information = dia_homer_hello_info;
	permanent = 0;
	description = "�� ���-�� �����?";
};


func int dia_homer_hello_condition()
{
	return 1;
};

func void dia_homer_hello_info()
{
	AI_Output(other,self,"DIA_Homer_Hello_15_00");	//�� ���-�� �����?
	AI_Output(self,other,"DIA_Homer_Hello_02_01");	//� ��� ���� � �������. ������, ��� ���������� ��������� ����.
	AI_Output(self,other,"DIA_Homer_Hello_02_02");	//��� ����� ������ ������ � ������� ����������� ����� � ���������� ����� ��� �����.
	AI_Output(self,other,"DIA_Homer_Hello_02_03");	//���� ��� ����� ������������, ������� ������ ����������.
};


instance DIA_HOMER_BUILTDAM(C_INFO)
{
	npc = bau_935_homer;
	nr = 2;
	condition = dia_homer_builtdam_condition;
	information = dia_homer_builtdam_info;
	permanent = 0;
	description = "��� �� �� ��������?";
};


func int dia_homer_builtdam_condition()
{
	if(Npc_KnowsInfo(hero,dia_homer_hello))
	{
		return 1;
	};
};

func void dia_homer_builtdam_info()
{
	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00");	//��� �� �� ��������?
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01");	//��. � �������� ��� �������, ����� �� �������� ����� ������.
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02");	//�������, ��� ��������, �� � ��� ������� ����������.
};


var int homer_damlurker;

instance DIA_HOMER_WANNAHELP(C_INFO)
{
	npc = bau_935_homer;
	nr = 1;
	condition = dia_homer_wannahelp_condition;
	information = dia_homer_wannahelp_info;
	permanent = 0;
	description = "�����, � ���� ���� ���-������ ������?";
};


func int dia_homer_wannahelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_homer_hello))
	{
		return 1;
	};
};

func void dia_homer_wannahelp_info()
{
	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00");	//�����, � ���� ���� ���-������ ������?
	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01");	//�������. ������ �������� �� ���� �����, ���� ��� �� ��������� �������.
	Wld_InsertNpc(damlurker,"NC_SPAWN_DAM_LURKER2");
	HOMER_DAMLURKER = LOG_RUNNING;
	Log_CreateTopic(CH1_DAMLURKER,LOG_MISSION);
	Log_SetTopicStatus(CH1_DAMLURKER,LOG_RUNNING);
	b_logentry(CH1_DAMLURKER,"����� ��������� ���, ��� ��� ������� ����������� ����. ���� � ����������� � ���, ������� ����� ����� ���������������.");
};


instance DIA_HOMER_RUNNING(C_INFO)
{
	npc = bau_935_homer;
	nr = 1;
	condition = dia_homer_running_condition;
	information = dia_homer_running_info;
	permanent = 0;
	description = "��� ����� ����� �����?";
};


func int dia_homer_running_condition()
{
	if(HOMER_DAMLURKER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_homer_running_info()
{
	AI_Output(other,self,"DIA_Homer_Running_15_00");	//��� ����� ����� �����?
	AI_Output(self,other,"DIA_Homer_Running_02_01");	//� �� ������� �� ������ ������� �����. ���� ����� �� �����. ������ �����, ������ ��� ��������� ������ �����.
	HOMER_DAMLURKER = LOG_RUNNING;
	b_logentry(CH1_DAMLURKER,"���� ����� �� ������ ������ �����.");
};


instance DIA_HOMER_SUCCESS(C_INFO)
{
	npc = bau_935_homer;
	nr = 2;
	condition = dia_homer_success_condition;
	information = dia_homer_success_info;
	permanent = 0;
	description = "� ���� �����!";
};


func int dia_homer_success_condition()
{
	var C_NPC lurker;
	lurker = Hlp_GetNpc(damlurker);
	printdebugstring(PD_MISSION,"���:",lurker.name);
	printdebugint(PD_MISSION,"��������� ����:",lurker.attribute);
	if((HOMER_DAMLURKER == LOG_RUNNING) && Npc_HasItems(hero,itat_damlurker_01))
	{
		return 1;
	};
};

func void dia_homer_success_info()
{
	AI_Output(other,self,"DIA_Homer_Success_15_00");	//� ���� �����!
	AI_Output(self,other,"DIA_Homer_Success_02_01");	//�������! ���� ������� ��� � ������ ��������� �����, ����� �������� �������.
	AI_Output(self,other,"DIA_Homer_Success_02_02");	//������, �������-��, � ����� ������� �������.
	HOMER_DAMLURKER = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_DAMLURKER,LOG_SUCCESS);
	b_logentry(CH1_DAMLURKER,"�� ������ ���������. ����� ������ ����� ����� ��������.");
	b_givexp(XP_REPORTDEADDAMLURKER);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_HOMER_PERM(C_INFO)
{
	npc = bau_935_homer;
	nr = 2;
	condition = dia_homer_perm_condition;
	information = dia_homer_perm_info;
	permanent = 1;
	description = "������� � �������?";
};


func int dia_homer_perm_condition()
{
	if(HOMER_DAMLURKER == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_homer_perm_info()
{
	AI_Output(other,self,"DIA_Homer_PERM_15_00");	//������� � �������?
	AI_Output(self,other,"DIA_Homer_PERM_02_01");	//��� �������, ��� ��������, ������� ����� �� ����� ���������.
};

