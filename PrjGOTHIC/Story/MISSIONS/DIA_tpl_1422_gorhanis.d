
instance INFO_GORHANIS_EXIT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 999;
	condition = info_gorhanis_exit_condition;
	information = info_gorhanis_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorhanis_exit_condition()
{
	return 1;
};

func void info_gorhanis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GORHANIS_WHAT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_what_condition;
	information = info_gorhanis_what_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int info_gorhanis_what_condition()
{
	return 1;
};

func void info_gorhanis_what_info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//�? � �������� �� ����� �������!
};


instance INFO_GORHANIS_ARENA(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_arena_condition;
	information = info_gorhanis_arena_info;
	permanent = 1;
	description = "�� ���������� �� �����?";
};


func int info_gorhanis_arena_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_arena_info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//�� ���������� �� �����?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//��� ������� �� �������� �������� ���� ���� ��������� �� ����� �������.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//� ���������� ���� �����, ����� �������� ��������, ����� ����� ���� ������� ������!
};


instance INFO_GORHANIS_SLEEPER(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_sleeper_condition;
	information = info_gorhanis_sleeper_info;
	permanent = 0;
	description = "��� ��, ���� ������?";
};


func int info_gorhanis_sleeper_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_sleeper_info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//��� ��, ���� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//� ����� ������ �� ������� ������, ������� ������ ���������� ���� ������, ��� �.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//���� ������� ���� ������, ��� ������ ������ ����� ����������. �� ������ ��� ���� � �� �� ������� ��� ������.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//�� ������ �������, ��� ���� ��� ��������� ��� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//��! � ����� ���� �������� ����������. ��� ���� ������������� � ������� ���������.
};


instance INFO_GORHANIS_SUMMONING(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_summoning_condition;
	information = info_gorhanis_summoning_info;
	permanent = 0;
	description = "�� ������ ���������� � ���������?";
};


func int info_gorhanis_summoning_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_sleeper))
	{
		return 1;
	};
};

func void info_gorhanis_summoning_info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//�� ������ ���������� � ���������?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//���� ������� �������, ��� �� ������� ��������� �� ������ ��������� �������, � �� ��� ���� ���� � �������!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//���� �� ������ ������ ������, ��� � ��� ������.
};


instance INFO_GORHANIS_WAYTOST(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 0;
	condition = info_gorhanis_waytost_condition;
	information = info_gorhanis_waytost_info;
	permanent = 1;
	description = "��� � ����� ������ � ������ ������?";
};


func int info_gorhanis_waytost_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_sleeper) || Npc_KnowsInfo(hero,info_gorhanis_summoning))
	{
		return 1;
	};
};

func void info_gorhanis_waytost_info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//��� � ����� ������ � ������ ������?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//� ������ ������ ������ ����� ����� ��������� ����� �����������, ������� ��������� �������������� � ��� ������. ����� ����-������ �� ���!
};


instance INFO_GORHANIS_CHARGE(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_charge_condition;
	information = info_gorhanis_charge_info;
	permanent = 0;
	description = "� ���� ��������� � ����� �� �����!";
};


func int info_gorhanis_charge_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_arena))
	{
		return 1;
	};
};

func void info_gorhanis_charge_info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//� ���� ��������� � ����� �� �����!
	AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//�������� ����� �������� ����� ������ �������� �� �������� ����� �������.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//� ����� ��������� � ����� ������ �����, ����� �� ������ ��������� �����������.
	AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//�� � ������, ��� ����� �� ������� ��� ������ ������� �� ��������� �� ������ �����������. ��� �� ���������� �������� ���������� ����������.
};


instance INFO_GORHANIS_CHARGEGOOD(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_chargegood_condition;
	information = info_gorhanis_chargegood_info;
	permanent = 1;
	description = "� ������ ���� ���� ����������, ����� ��������� � �����?";
};


func int info_gorhanis_chargegood_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_charge))
	{
		return 1;
	};
};

func void info_gorhanis_chargegood_info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//� ������ ���� ���� ����������, ����� ��������� � �����?
	AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//���! �� ��� ������������ �����. �� �� ������ ���� ���� �����������!
};

