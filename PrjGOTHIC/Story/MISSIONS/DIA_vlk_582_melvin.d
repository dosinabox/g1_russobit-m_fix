
instance DIA_MELVIN_EXIT(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 999;
	condition = dia_melvin_exit_condition;
	information = dia_melvin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_melvin_exit_condition()
{
	return 1;
};

func void dia_melvin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELVIN_HELLO(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_hello_condition;
	information = dia_melvin_hello_info;
	permanent = 0;
	description = "������! �� �� ����� �� ����������. �� �� ����� ������?";
};


func int dia_melvin_hello_condition()
{
	return 1;
};

func void dia_melvin_hello_info()
{
	AI_Output(other,self,"DIA_Melvin_Hello_15_00");	//������! �� �� ����� �� ����������. �� �� ����� ������?
	AI_Output(self,other,"DIA_Melvin_Hello_03_01");	//��! ������ ������ � ��� ���, ��� � ������� ������ ������. � ��������� ����� ����� ����� ����� �� ����, �� ������������ � ������, ��� �������� ��� �������.
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"������� ������ ������������� � ��������. ��� ���� ����� ������� � ������ ������. �� �� ��������� ������ � ���, ����� ���� ���� � �������� ������.");
};


instance DIA_MELVIN_METDUSTY(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_metdusty_condition;
	information = dia_melvin_metdusty_info;
	permanent = 0;
	description = "� ���� �����. ������������ � ��� ������ �������.";
};


func int dia_melvin_metdusty_condition()
{
	if(Npc_KnowsInfo(hero,dia_melvin_hello) && Npc_KnowsInfo(hero,dia_dusty_hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty_info()
{
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00");	//� ���� �����. ������������ � ��� ������ �������.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01");	//���� �� ������� ���, �������, ��� �� ��� ������� ���. ����� �� ������� �����, ��� � ������ ������, ��� ��������� ���������� ��� ������� ����������. �������, ��� ���� ����� ����������.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02");	//��, ���� �����, �������, �������.
};

