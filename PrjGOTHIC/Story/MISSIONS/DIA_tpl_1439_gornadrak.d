
instance DIA_GORNADRAK_EXIT(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 999;
	condition = dia_gornadrak_exit_condition;
	information = dia_gornadrak_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gornadrak_exit_condition()
{
	return 1;
};

func void dia_gornadrak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNADRAK_GREET(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_greet_condition;
	information = dia_gornadrak_greet_info;
	permanent = 0;
	description = "������! ���� �� �����?";
};


func int dia_gornadrak_greet_condition()
{
	if(!Npc_KnowsInfo(hero,info_corkalom_bringmcqballs_success))
	{
		return 1;
	};
};

func void dia_gornadrak_greet_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00");	//������! ���� �� �����?
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01");	//�� ����� ��� ������ ����� ��������, ������ ������ �������� � ������ �����.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02");	//��� � ���� �� �������� � ��� � �������� �� ������.
};


instance DIA_GORNADRAK_WASSEKRET(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_wassekret_condition;
	information = dia_gornadrak_wassekret_info;
	permanent = 0;
	description = "� ����� ����� �� ��������?";
};


func int dia_gornadrak_wassekret_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_greet) && !Npc_KnowsInfo(hero,info_corkalom_bringmcqballs_success))
	{
		return 1;
	};
};

func void dia_gornadrak_wassekret_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00");	//� ����� ����� �� ��������?
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01");	//�� ���������� ������ ������ � ����� ��������. �� ����� �� ������, ����� ����� ��������� ������ �������.
};


instance DIA_GORNADRAK_TEACHMANDIBLES(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_teachmandibles_condition;
	information = dia_gornadrak_teachmandibles_info;
	permanent = 0;
	description = "�� ������ ���������� ���, ��� �������� �����?";
};


func int dia_gornadrak_teachmandibles_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_wassekret) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return 1;
	};
};

func void dia_gornadrak_teachmandibles_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_TeachMandibles_15_00");	//�� ������ ���������� ���, ��� �������� �����?
	AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01");	//�������. ���� �������, �������� �������� �� ����� � ������ �� �� ����. ��� �� ������� ������� ������ � ��������, ������� ��� ���� ��������� ������.
	b_learn_trophies_mandibles();
};


instance DIA_GORNADRAK_WHATFOR(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_whatfor_condition;
	information = dia_gornadrak_whatfor_info;
	permanent = 0;
	description = "� ����� ��� ������ ����� ��� �����?";
};


func int dia_gornadrak_whatfor_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_wassekret))
	{
		return 1;
	};
};

func void dia_gornadrak_whatfor_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00");	//� ����� ��� ������ ����� ��� �����?
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01");	//��������� � ����, �� ������� �� ��� �����, ���������� ���������� ���� ����� �����������.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02");	//�� ���� ��������� � ������� ���������, � � ���� ������� � ��� ������ ���� ������� �����, ����� ��� ������� �� ����.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03");	//� ��� ������� ��� ����� ������ ����������� ���� ����������� � ����� �������� ���.
};


instance DIA_GORNADRAK_PERMANENT(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_permanent_condition;
	information = dia_gornadrak_permanent_info;
	permanent = 1;
	description = "� ��� ��� ���������� ����� ��� ������� ���������?";
};


func int dia_gornadrak_permanent_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_whatfor) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_gornadrak_permanent_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00");	//� ��� ��� ���������� ����� ��� ������� ���������?
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		AI_Output(self,other,"SVM_9_LookAway");	//��! ������ ������� ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01");	//���. ��� ����� ��� ����� ����� �����. ����� ������� ���������� ��������� �� �������� � ������ ����� � ����, � �����.
	};
};

