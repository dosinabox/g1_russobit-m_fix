
instance DIA_SLD_760_SOELDNER_INTRO(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_intro_condition;
	information = dia_sld_760_soeldner_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_760_soeldner_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

func void dia_sld_760_soeldner_intro_info()
{
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01");	//��� ��� �� ����� �������? ����� ���� �� ���� �����, � ��������� �� ����!
};


instance DIA_SLD_760_SOELDNER_EXIT_1(C_INFO)
{
	nr = 999;
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_exit_1_condition;
	information = dia_sld_760_soeldner_exit_1_info;
	important = 0;
	permanent = 0;
	description = "�����, ��� ������� ����.";
};


func int dia_sld_760_soeldner_exit_1_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_exit_1_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01");	//�����, ��� ������� ����.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");	//�������, �� �������� ���� �����.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_SOELDNER_EXIT_2(C_INFO)
{
	nr = 999;
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_exit_2_condition;
	information = dia_sld_760_soeldner_exit_2_info;
	important = 0;
	permanent = 1;
	description = "� ��� �����.";
};


func int dia_sld_760_soeldner_exit_2_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_760_soeldner_exit_1))
	{
		return 1;
	};
};

func void dia_sld_760_soeldner_exit_2_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01");	//� ��� �����.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");	//����. ������ �����.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_SOELDNER_UMSEHEN(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_umsehen_condition;
	information = dia_sld_760_soeldner_umsehen_info;
	important = 0;
	permanent = 0;
	description = "� ������ ���� ������� ����������.";
};


func int dia_sld_760_soeldner_umsehen_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01");	//� ������ ���� ������� ����������.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");	//����� �� ��������� ����, ����� ����� ����.
};


instance DIA_SLD_760_SOELDNER_INMINE(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_inmine_condition;
	information = dia_sld_760_soeldner_inmine_info;
	important = 0;
	permanent = 0;
	description = "� ���� ���������� �����.";
};


func int dia_sld_760_soeldner_inmine_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01");	//� ���� ���������� �����.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");	//� �����? ��� ���������� ����� ���� ���� ������.
	if(!Npc_KnowsInfo(hero,dia_sld_752_okyl_werbistdu))
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");	//��� ����� ����?
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");	//�� ��� �� ��� ��� � ������� ����� � � ������� �������?
	};
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");	//������������ � ����������, �������� ���� ��� �������� ������ �����.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");	//� ����� ���� ��� ���: ��� � ����� ������ �������� ����� �����. ������� �� ���� ��������� � ������ �������. ����� ����� ��� �� ����������� ����� ���� ����.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");	//��� ��� �� ����������� ��������.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");	//�� ����, ��� �� ������, �� ���� �� ��� ���������, �� ������� � ���� ������.
};

