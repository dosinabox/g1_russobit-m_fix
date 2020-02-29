
instance DIA_JESSE_EXIT(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 999;
	condition = dia_jesse_exit_condition;
	information = dia_jesse_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jesse_exit_condition()
{
	return 1;
};

func void dia_jesse_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESSE_HALLO(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_hallo_condition;
	information = dia_jesse_hallo_info;
	permanent = 0;
	description = "��� ����?";
};


func int dia_jesse_hallo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_herek_bully))
	{
		return 1;
	};
};

func void dia_jesse_hallo_info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01");	//�� ����� �������? ������� �����: �� ����������� ����� �� ��������.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02");	//���� ��� ��������� �� ���� ����� �� ������, ����� �� ���������, ����� �������� ������ ����� ��������� ������ ����.
};


instance DIA_JESSE_WARN(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_warn_condition;
	information = dia_jesse_warn_info;
	permanent = 0;
	important = 1;
};


func int dia_jesse_warn_condition()
{
	if(Npc_KnowsInfo(hero,dia_herek_bully) && (HEREK_PROTECTIONBULLY == TRUE))
	{
		return 1;
	};
};

func void dia_jesse_warn_info()
{
	AI_Output(self,other,"DIA_Jesse_Warn_03_00");	//��, ��! �� ��������� ������� �������� �� ������, ��?
	AI_Output(other,self,"DIA_Jesse_Warn_15_01");	//�� � ���?
	AI_Output(self,other,"DIA_Jesse_Warn_03_02");	//� �������, ��� ����� ������������ ����. �� ����� ������� �����������, ����� ��������� ����.
	AI_Output(self,other,"DIA_Jesse_Warn_03_03");	//��, � ������ ��� �������� � �������. ���� �����, �� ����� � ����-������ ���.
	AI_Output(other,self,"DIA_Jesse_Warn_15_04");	//���� �������������� � ������ ������� ���������.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05");	//��������, �� ���������� ����� ���������� �������. ���� ���������.
};


instance DIA_JESSE_MISSION(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_mission_condition;
	information = dia_jesse_mission_info;
	permanent = 0;
	description = "������ �� ��������� ��� � ��������?";
};


func int dia_jesse_mission_condition()
{
	if(Npc_KnowsInfo(hero,dia_jesse_mission))
	{
		return 1;
	};
};

func void dia_jesse_mission_info()
{
	AI_Output(other,self,"DIA_Jesse_Mission_15_00");	//������ �� ��������� ��� � ��������?
	AI_Output(self,other,"DIA_Jesse_Mission_03_01");	//������ ��� ������ ��� ������ �� ������. ��� ����������, ��� ���� �� ����� ����� ��� ���������.
	AI_Output(self,other,"DIA_Jesse_Mission_03_02");	//� ��� ��� � ����� ����, � ��� ���� ����������� ������ ���.
	Info_ClearChoices(dia_jesse_mission);
	Info_AddChoice(dia_jesse_mission,"� ���� ������ �� ������!",dia_jesse_mission_forgetit);
	Info_AddChoice(dia_jesse_mission,"� ��� �� �� �� ���� ������?",dia_jesse_mission_what);
};

func void dia_jesse_mission_forgetit()
{
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00");	//� ���� ������ �� ������!
	AI_Output(self,other,"DIA_Jesse_Mission_ForgetIt_03_01");	// ����� ������ �� ���� � ��������!
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(dia_jesse_mission);
	AI_StopProcessInfos(self);
};

func void dia_jesse_mission_what()
{
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00");	//� ��� �� �� �� ���� ������?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01");	//� ���� ������ �� �������� ����. ������� ������ � ���� ��� �� ���������� �������.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02");	//� ��� ��� ����� �� �������. � ������ ��� 10 ������. �� ������ ������ ��� ���� � �������, ��� ��� �� ����.
	Npc_SetTrueGuild(self,GIL_NONE);
	Info_AddChoice(dia_jesse_mission,"������� �� ����? � �� ����� ����� ������!",dia_jesse_mission_no);
	Info_AddChoice(dia_jesse_mission,"� ��������, ��� ��� ����� �������...",dia_jesse_mission_yes);
};

func void dia_jesse_mission_yes()
{
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00");	//� ��������, ��� ��� ����� �������...
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01");	//�������! �� �������� ����! �������, ����� ��� �������� ����� ������, ������?
	JESSE_PAYFORME = LOG_RUNNING;
	Info_ClearChoices(dia_jesse_mission);
};

func void dia_jesse_mission_no()
{
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00");	//������� �� ����? � �� ����� ����� ������!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//��� � ��� ��� ��������� � ����. ������ �� ��� ������ �� �����������.
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(dia_jesse_mission);
};


instance DIA_JESSE_MISSUCCESS(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_missuccess_condition;
	information = dia_jesse_missuccess_info;
	permanent = 0;
	description = "� ����� ���� ��������!";
};


func int dia_jesse_missuccess_condition()
{
	if(JESSE_PAYFORME == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_jesse_missuccess_info()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00");	//� ����� ���� ��������!
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01");	//��? �������! ������ �� � �������.
	Npc_SetTrueGuild(self,GIL_VLK);
	Info_ClearChoices(dia_jesse_missuccess);
	Info_AddChoice(dia_jesse_missuccess,"���? � ���� ����� � �������� ������ ������?",dia_jesse_missuccess_waaas);
	Info_AddChoice(dia_jesse_missuccess,"��. �� ��� - � ����. ��� ������.",dia_jesse_missuccess_ok);
};

func void dia_jesse_missuccess_waaas()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00");	//���? � ���� ����� � �������� ������ ������?
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01");	//�������, ��.
};

func void dia_jesse_missuccess_ok()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00");	//��. �� ��� - � ����. ��� ������.
};

