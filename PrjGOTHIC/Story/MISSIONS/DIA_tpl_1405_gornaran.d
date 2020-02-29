
instance DIA_GORNARAN_EXIT(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 999;
	condition = dia_gornaran_exit_condition;
	information = dia_gornaran_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int dia_gornaran_exit_condition()
{
	return TRUE;
};

func void dia_gornaran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNARAN_WACHE(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 1;
	condition = dia_gornaran_wache_condition;
	information = dia_gornaran_wache_info;
	permanent = 1;
	description = "��� �� ����� �������?";
};


func int dia_gornaran_wache_condition()
{
	return TRUE;
};

func void dia_gornaran_wache_info()
{
	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01");	//� ������� ������, ������ �����������, ������� �������� ������� �� ���.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02");	//�� ����� ����� � �� � ������ �� �������� � ���� ��������. ��� � ������������� ������������ �����.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03");	//�� ������, �� �������� ����, ��� ������ ����� ����� ��� ������.
	AI_StopProcessInfos(self);
};


instance INFO_TPL_1405_GORNARAN(C_INFO)
{
	npc = tpl_1405_gornaran;
	condition = info_tpl_1405_gornaran_condition;
	information = info_tpl_1405_gornaran_info;
	permanent = 0;
	important = 1;
};


func int info_tpl_1405_gornaran_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void info_tpl_1405_gornaran_info()
{
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01");	//���� �� ��������? ����� ������ ��������.
};


instance INFO_TPL_1405_GORNARAN2(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 1;
	condition = info_tpl_1405_gornaran2_condition;
	information = info_tpl_1405_gornaran2_info;
	permanent = 1;
	description = "��� ����� ����������?";
};


func int info_tpl_1405_gornaran2_condition()
{
	if(Npc_KnowsInfo(hero,info_tpl_1405_gornaran))
	{
		return 1;
	};
};

func void info_tpl_1405_gornaran2_info()
{
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02");	//��� ����� ����������?
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03");	//� �� ��� �����������? ������ �� ������ � ���� ������� � ��������, ������ ��� ��� ����������� � ��� �������� ��� ���� ��������. ����� ��� ������ � ���� �����.
};


instance INFO_TPL_1405_GORNARAN3(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 1;
	condition = info_tpl_1405_gornaran3_condition;
	information = info_tpl_1405_gornaran3_info;
	permanent = 1;
	description = "� �� ������ ����� ����������.";
};


func int info_tpl_1405_gornaran3_condition()
{
	if(Npc_KnowsInfo(hero,info_tpl_1405_gornaran))
	{
		return 1;
	};
};

func void info_tpl_1405_gornaran3_info()
{
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04");	//� �� ������ ����� ����������.
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05");	//��, ������ �����! �� �� ������ ���������� ��� �����, ��� ������ ����������� ������� ������! � ������ ���� �������� ��� �� ������ �����������.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};


instance INFO_TPL_1405_GORNARAN4(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 1;
	condition = info_tpl_1405_gornaran4_condition;
	information = info_tpl_1405_gornaran4_info;
	permanent = 0;
	description = "�� �� ������� ���������� ����!";
};


func int info_tpl_1405_gornaran4_condition()
{
	if(Npc_KnowsInfo(hero,info_tpl_1405_gornaran))
	{
		return 1;
	};
};

func void info_tpl_1405_gornaran4_info()
{
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06");	//�� �� ������� ���������� ����!
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07");	//� ��� ���, ������! �� �������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

