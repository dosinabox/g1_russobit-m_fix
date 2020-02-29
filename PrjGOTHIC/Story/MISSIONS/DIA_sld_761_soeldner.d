
instance DIA_SLD_761_SOELDNER_INTRO(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_intro_condition;
	information = dia_sld_761_soeldner_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_761_soeldner_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_intro_info()
{
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01");	//��� �� ����� �������?
};


instance DIA_SLD_761_SOELDNER_EXIT_1(C_INFO)
{
	nr = 999;
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_exit_1_condition;
	information = dia_sld_761_soeldner_exit_1_info;
	important = 0;
	permanent = 0;
	description = "�����, � ���� ���� ����� ������ ����.";
};


func int dia_sld_761_soeldner_exit_1_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_exit_1_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01");	//�����, � ���� ���� ����� ������ ����.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");	//� ���� ��� �����.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_SOELDNER_EXIT_2(C_INFO)
{
	nr = 999;
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_exit_2_condition;
	information = dia_sld_761_soeldner_exit_2_info;
	important = 0;
	permanent = 1;
	description = "����� � ����� ������...";
};


func int dia_sld_761_soeldner_exit_2_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_761_soeldner_exit_1))
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_exit_2_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//����� � ����� ������...
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");	//������.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_SOELDNER_UMSEHEN(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_umsehen_condition;
	information = dia_sld_761_soeldner_umsehen_info;
	important = 0;
	permanent = 0;
	description = "� ������ ����� ���������� ������.";
};


func int dia_sld_761_soeldner_umsehen_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//� ������ ����� ���������� ������.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");	//��� �� ����� ��� ��������, � ���� � �����. ����������� ���� ������.
};


instance DIA_SLD_761_SOELDNER_INMINE(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_inmine_condition;
	information = dia_sld_761_soeldner_inmine_info;
	important = 0;
	permanent = 0;
	description = "� ������ ����� ��������� �����.";
};


func int dia_sld_761_soeldner_inmine_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");	//� ������ ����� ��������� �����.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");	//�� �� ������, ��� ����� �������. ���� ����� �� �����.
};


instance DIA_SLD_761_SOELDNER_BRIBE(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_bribe_condition;
	information = dia_sld_761_soeldner_bribe_info;
	important = 0;
	permanent = 0;
	description = "������, ������ ������ �������?";
};


func int dia_sld_761_soeldner_bribe_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_761_soeldner_inmine))
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_bribe_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");	//������, ������ ������ �������?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");	//� ��� ��� ����� �������?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");	//������-��! ���� �� ������� ���� ���������, �� � ���� ������ �� ������.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");	//�� � � �� ����� ��������� ����, � ������ �������...
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");	//����� ��� ���� ������.
	AI_StopProcessInfos(self);
};

