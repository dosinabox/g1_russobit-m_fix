
instance DIA_GHORIM_EXIT(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 999;
	condition = dia_ghorim_exit_condition;
	information = dia_ghorim_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_ghorim_exit_condition()
{
	return 1;
};

func void dia_ghorim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GHORIM_MISSINGHARLOK(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 1;
	condition = dia_ghorim_missingharlok_condition;
	information = dia_ghorim_missingharlok_info;
	permanent = 0;
	description = "������! ��� ����?";
};


func int dia_ghorim_missingharlok_condition()
{
	return 1;
};

func void dia_ghorim_missingharlok_info()
{
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//������! ��� ����?
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_01");	//����� �, ������, ����� � ��� ������. ������� ��� ��� ��� - � �� ������ ������.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_02");	//������ ������-����� ������ ��� ��������� �� �����. � ���� ������ ������ ���.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_03");	//������, ������� ������ � ���� ����!
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_04");	//� ������ �� ��� �� ������ ������� � ���� � �������� ����?
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_05");	//� �� ���� ����. ��� ������ ������ �����.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_06");	//�����, �� ������� ������ ����? �� ����� ��� ������������ ��� ������, � �������.
	AI_Output(self,other,"DIA_Ghorim_MissingHarlok_02_07");	//����� ���, ����� �� ���������� ����� ���� ������� ����.
	Log_CreateTopic(CH1_GHORIMSRELIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_GHORIMSRELIEF,LOG_RUNNING);
	b_logentry(CH1_GHORIMSRELIEF,"��������� ����� �������� ���� ������� ������ �������, ������� ������ ��� ��������. � ����� ����� ��� �������� �� ���� �������.");
	GHORIM_KICKHARLOK = LOG_RUNNING;
};


instance DIA_GHORIM_SUCCESS(C_INFO)
{
	npc = nov_1310_ghorim;
	nr = 1;
	condition = dia_ghorim_success_condition;
	information = dia_ghorim_success_info;
	permanent = 1;
	description = "��? ������ �� ��������?";
};


func int dia_ghorim_success_condition()
{
	if(GHORIM_KICKHARLOK == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_ghorim_success_info()
{
	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00");	//��? ������ �� ��������?
	AI_Output(self,other,"DIA_Ghorim_SUCCESS_02_01");	//��, �������-�� � ���� �������. �������, �������!
};

