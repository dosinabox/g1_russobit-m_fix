
instance DIA_NYRAS_EXIT(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 999;
	condition = dia_nyras_exit_condition;
	information = dia_nyras_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_nyras_exit_condition()
{
	return 1;
};

func void dia_nyras_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NYRAS_HALLO(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 1;
	condition = dia_nyras_hallo_condition;
	information = dia_nyras_hallo_info;
	permanent = 0;
	description = "������! � ����� ���� �������.";
};


func int dia_nyras_hallo_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_nyras_hallo_info()
{
	AI_Output(other,self,"DIA_Nyras_Hallo_15_00");	//������! � ����� ���� �������.
	AI_Output(self,other,"DIA_Nyras_Hallo_03_01");	//�� �������� � ����� ������, ����!
};


instance DIA_NYRAS_ORT(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 1;
	condition = dia_nyras_ort_condition;
	information = dia_nyras_ort_info;
	permanent = 0;
	description = "��� �� ������ ���������� ��� �� ���� �����?";
};


func int dia_nyras_ort_condition()
{
	if(Npc_KnowsInfo(hero,dia_nyras_hallo) && (KAPITEL <= 1))
	{
		return 1;
	};
};

func void dia_nyras_ort_info()
{
	AI_Output(other,self,"DIA_Nyras_Ort_15_00");	//��� �� ������ ���������� ��� �� ���� �����?
	AI_Output(self,other,"DIA_Nyras_Ort_03_01");	//��, � ����� �������� ��� ���� ����� ����. ��� ����� � ��� ������ ������� � ������������ ����������� � �������� ������ �������.
	AI_Output(self,other,"DIA_Nyras_Ort_03_02");	//�������, ��� ������� ������� �����, ����� �������� � ������ ����������� �����.
	AI_Output(self,other,"DIA_Nyras_Ort_03_03");	//�� ������ �� ������� � ��� �� ������� ����� ������ � ���������� ��� ���� �������.
	Info_ClearChoices(dia_nyras_ort);
	Info_AddChoice(dia_nyras_ort,"�������� ��� � ��������� ������ �������� �������.",dia_nyras_ort_holy);
	Info_AddChoice(dia_nyras_ort,"� ��� ������� ��� ������?",dia_nyras_ort_casual);
};

func void dia_nyras_ort_casual()
{
	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00");	//� ��� ������� ��� ������?
	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01");	//������ ������ ���� ���� � ��������, �� �������� ������� �� ������ ����� ������!
	Info_ClearChoices(dia_nyras_ort);
};

func void dia_nyras_ort_holy()
{
	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00");	//�������� ��� � ��������� ������ �������� �������.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01");	//�� ��� ��������� ���, ��� ������, ����� ������� �������.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02");	//������� �������, ��� ������ ������ ��������� � ���, ����� �� ����� � ����� ������.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03");	//����� �� �������� ������� ���������, ���� ������ ������ ���. � ��� ������ ������� ���� ���� � ������ ����������.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04");	//���� ��� ����� �������� ���. �� ������� � ���������� �������������� ��������, � ������� �������� �� ������ � �����.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05");	//������ � ���� ��������� ��� �� ��� �� ������ ������ ���� �������.
	Info_ClearChoices(dia_nyras_ort);
};


instance NOV_1303_NYRAS_GREET(C_INFO)
{
	npc = nov_1303_nyras;
	condition = nov_1303_nyras_greet_condition;
	information = nov_1303_nyras_greet_info;
	important = 1;
	permanent = 0;
};


func int nov_1303_nyras_greet_condition()
{
	if(YBERION_BRINGFOCUS == LOG_RUNNING)
	{
		return 1;
	};
};

func void nov_1303_nyras_greet_info()
{
	AI_Output(self,other,"Nov_1303_Nyras_GREET_Info_03_00");	//�������! ����� ���� �� �����!
};


instance NOV_1303_NYRAS_LEAVE(C_INFO)
{
	npc = nov_1303_nyras;
	condition = nov_1303_nyras_leave_condition;
	information = nov_1303_nyras_leave_info;
	important = 0;
	permanent = 0;
	description = "� ��� ������-������.";
};


func int nov_1303_nyras_leave_condition()
{
	if(Npc_KnowsInfo(hero,nov_1303_nyras_greet))
	{
		return 1;
	};
};

func void nov_1303_nyras_leave_info()
{
	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01");	//� ��� ������-������
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02");	//�� ������ ������� ������. � ��� ��� ����� ���!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03");	//� � ����� �������� ��� ����!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04");	//����� � ������ ����� �������. �� ������, ��� ������ � ��� ������������ �������������!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05");	//������ ������ � ���� ������� �������. �� ������ �� ��������� � ���� � �������!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06");	//������ � ����!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07");	//����!
	b_logentry(CH2_FOCUS,"����� ����� � ���. �� ������� �������� ������ ���� � ����� �� ����.");
	npc_setpermattitude(self,ATT_HOSTILE);
	AI_StopProcessInfos(self);
};

