
instance DIA_CAINE_EXIT(C_INFO)
{
	npc = nov_1301_caine;
	nr = 999;
	condition = dia_caine_exit_condition;
	information = dia_caine_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_caine_exit_condition()
{
	return 1;
};

func void dia_caine_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CAINE_HALLO(C_INFO)
{
	npc = nov_1301_caine;
	nr = 1;
	condition = dia_caine_hallo_condition;
	information = dia_caine_hallo_info;
	permanent = 0;
	description = "������! � ���������!";
};


func int dia_caine_hallo_condition()
{
	return 1;
};

func void dia_caine_hallo_info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//������! � ���������!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//� � ����. ������ ��� ������. �� ���� ��� ������ � ���, ������?
	Info_ClearChoices(dia_caine_hallo);
	Info_AddChoice(dia_caine_hallo,"���.",dia_caine_hallo_nein);
	Info_AddChoice(dia_caine_hallo,"��.",dia_caine_hallo_ja);
};

func void dia_caine_hallo_ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//��.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//����� �� ������, ��� �� ������ ���� ��������.
	Info_ClearChoices(dia_caine_hallo);
};

func void dia_caine_hallo_nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//���.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//�� ������? �� ������� ���� ������, ��?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//��� ����� - ������ ���� ��������. ��� ������� �������������� � ��� �������. �� ���� �������, ��� ����� ������ � ��������, � ��� ���.
	Info_ClearChoices(dia_caine_hallo);
};


instance DIA_CAINE_JOB(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_job_condition;
	information = dia_caine_job_info;
	permanent = 0;
	description = "� ��� ������� ��?";
};


func int dia_caine_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_hallo))
	{
		return 1;
	};
};

func void dia_caine_job_info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//� ��� ������� ��?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//� ������� ��� ������ �������� ������������ �����.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//��� ����� ������������ �������� � ����� ��������. �� ������ ��� ���������� ������ �����.
};


instance DIA_CAINE_WOSEKRET(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_wosekret_condition;
	information = dia_caine_wosekret_info;
	permanent = 0;
	description = "��� �������� ����� ��������?";
};


func int dia_caine_wosekret_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_job) && (KNOWS_GETMCMANDIBLES != TRUE))
	{
		return 1;
	};
};

func void dia_caine_wosekret_info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//��� �������� ����� ��������?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//������� ����� � ������ �����. ������������ �� �����. ����� ������� ���, ��� �����, ��� ��� ��������.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//���� �� ������������� ������ ��������� �������� �����, ���� ����� ���������� � ��� �� ������. �� ������ � ���� �����������.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//������ ���� �� ����� � ������ �����. ����� �� ������� ��� ��������� �����, ��� ������������.
};


instance DIA_CAINE_ADDINFOKALOM(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_addinfokalom_condition;
	information = dia_caine_addinfokalom_info;
	permanent = 0;
	description = "�� ������ ���������� ��� ���-������ ��� � ����� �������?";
};


func int dia_caine_addinfokalom_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_job))
	{
		return 1;
	};
};

func void dia_caine_addinfokalom_info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//�� ������ ���������� ��� ���-������ ��� � ����� �������?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//�� �� ����� �� ������ ����. �� �������� ����, ��� ������� � ��� ����������, �� ��� �� �� ����� ��������� ��� �� ��������.
};


instance NOV_1301_CAINE_CHEST(C_INFO)
{
	npc = nov_1301_caine;
	condition = nov_1301_caine_chest_condition;
	information = nov_1301_caine_chest_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ������� � ��� ������ ������ ��� �����.";
};


func int nov_1301_caine_chest_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void nov_1301_caine_chest_info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//��� ����� ������� � ��� ������ ������ ��� �����.
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//�� �� ������� ����� �������. �� �������� � ������ ������� ��� ������. �� �����, ��� �� ������� �������� � ���-�� ������ �������.
};

