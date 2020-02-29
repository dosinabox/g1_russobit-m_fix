
instance DIA_ORRY_PREEXIT(C_INFO)
{
	npc = grd_254_orry;
	nr = 999;
	condition = dia_orry_preexit_condition;
	information = dia_orry_preexit_info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int dia_orry_preexit_condition()
{
	return 1;
};

func void dia_orry_preexit_info()
{
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Orry_PreExit_06_00");	//���������� ��������� �� ������� ������ �����!
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORRY_EXIT(C_INFO)
{
	npc = grd_254_orry;
	nr = 999;
	condition = dia_orry_exit_condition;
	information = dia_orry_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_orry_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_preexit) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORRY_GUARDGATE(C_INFO)
{
	npc = grd_254_orry;
	nr = 2;
	condition = dia_orry_guardgate_condition;
	information = dia_orry_guardgate_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_orry_guardgate_condition()
{
	return 1;
};

func void dia_orry_guardgate_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_01");	//�����������, ����� ����� �� ������� � ����� ������. � ����������� ��� ���������� �� ������ ������.
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Orry_GuardGate_06_02");	//�� ���������, �� ��� ��? ���� ���� ������ ������� ��������� � ���?
		AI_Output(other,self,"DIA_Orry_GuardGate_15_03");	//��, ��� ��� � ����.
		AI_Output(self,other,"DIA_Orry_GuardGate_06_04");	//������� �������� �� ������ �� ������ ������!
		AI_Output(self,other,"DIA_Orry_GuardGate_06_05");	//�, �� � ��� ���������, ���� �� ����� � ����� ������, �������� �� ������ ������.
		AI_Output(self,other,"DIA_Orry_GuardGate_06_06");	//� �����... �� ��� ������� � ���?
		Info_ClearChoices(dia_orry_guardgate);
		Info_AddChoice(dia_orry_guardgate,"��� ���.",dia_orry_guardgate_no);
		Info_AddChoice(dia_orry_guardgate,"��, ���������.",dia_orry_guardgate_yes);
	};
};

func void dia_orry_guardgate_no()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//��� ���.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01");	//����� ������ ���! �� � ��� ������������, ��� ���������� ���������.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02");	//����� ����� � �������, � ��� �������� ������ ��� ������ �������, ��� ��.
	Info_ClearChoices(dia_orry_guardgate);
};

func void dia_orry_guardgate_yes()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00");	//��, ���������.
	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01");	//������. ����� �� ��� ������, ��� ����� � ����.
	Info_ClearChoices(dia_orry_guardgate);
};


instance DIA_ORRY_NEWCAMP(C_INFO)
{
	npc = grd_254_orry;
	nr = 1;
	condition = dia_orry_newcamp_condition;
	information = dia_orry_newcamp_info;
	permanent = 0;
	description = "������ �� ��������� ��������� �������� �� ����� �� ������ ������?";
};


func int dia_orry_newcamp_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_newcamp_info()
{
	AI_Output(other,self,"DIA_Orry_NewCamp_15_00");	//������ �� ��������� ��� ��������� �������� �� ����� �� ������ ������?
	AI_Output(self,other,"DIA_Orry_NewCamp_06_01");	//����� ������ - ��� ���� �� ������, ��� ���� � ���������.
	AI_Output(self,other,"DIA_Orry_NewCamp_06_02");	//����� ������ �� �������� ������ �� �������� ����, ������� ��� ��� �� �����, ��� ������ ������.
};


instance DIA_ORRY_OLDCAMP(C_INFO)
{
	npc = grd_254_orry;
	nr = 2;
	condition = dia_orry_oldcamp_condition;
	information = dia_orry_oldcamp_info;
	permanent = 0;
	description = "� ������ ������?";
};


func int dia_orry_oldcamp_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_oldcamp_info()
{
	AI_Output(other,self,"DIA_Orry_OldCamp_15_00");	//� ������ ������?
	AI_Output(self,other,"DIA_Orry_OldCamp_06_01");	//����� ���� ���������� ������. ������ �� ���� ���� ������ � ��������. ��, � �������� � ����� ���� ���� �������.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_02");	//������, ��� ��������� ����, ������� �������� ���������. ���� ����� ����-�� ������, �� ��� �������� �����������, ����� ����� ����� ���������.
};


instance DIA_ORRY_SHORE(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_shore_condition;
	information = dia_orry_shore_info;
	permanent = 0;
	description = "����� � ����� �� �����, ���� �� ����� �������� ���� �������...";
};


func int dia_orry_shore_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_orry_shore_info()
{
	AI_Output(other,self,"DIA_Orry_Shore_15_00");	//����� � ����� �� �����, ���� �� ����� �������� ���� �������...
	AI_Output(self,other,"DIA_Orry_Shore_06_01");	//��� �� ����� ����������, ������ ���� '������ ��������'.
	AI_Output(other,self,"DIA_Orry_Shore_15_02");	//� � ������ ������ ����� ��� ����� �����?
	AI_Output(self,other,"DIA_Orry_Shore_06_03");	//�������, ������ ����� ��������� ������-������ �������, �� ���� �� ������� �� ���� ������, ���� �� ������.
};


instance DIA_ORRY_WOMAN(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_woman_condition;
	information = dia_orry_woman_info;
	permanent = 0;
	description = "� �����, ��� ���� ������ � �������� ��������� �����-�� �������.";
};


func int dia_orry_woman_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate))
	{
		return 1;
	};
};

func void dia_orry_woman_info()
{
	AI_Output(other,self,"DIA_Orry_Woman_15_00");	//� �����, ��� ���� ������ � �������� ��������� �����-�� �������.
	AI_Output(self,other,"DIA_Orry_Woman_06_01");	//��, ������ �������� ���, ��� �����.
	AI_Output(other,self,"DIA_Orry_Woman_15_02");	//�� ������ �������, ��� �� ���� ������ ��������� ���� ������?
	AI_Output(self,other,"DIA_Orry_Woman_06_03");	//��� ����� �� �����������, ��� � ��� �� �����. ��� ����� ������, � ������ �� ����� � �������� ������ ���.
	AI_Output(self,other,"DIA_Orry_Woman_06_04");	//����, �� ����, ��� ����...
};


instance DIA_ORRY_WAFFE(C_INFO)
{
	npc = grd_254_orry;
	nr = 3;
	condition = dia_orry_waffe_condition;
	information = dia_orry_waffe_info;
	permanent = 0;
	description = "��� ����� ����� ����� ������?";
};


func int dia_orry_waffe_condition()
{
	if(Npc_KnowsInfo(hero,dia_orry_guardgate) && KAPITEL <= 2)
	{
		return 1;
	};
};

func void dia_orry_waffe_info()
{
	AI_Output(other,self,"DIA_Orry_Waffe_15_00");	//��� ����� ����� ����� ������?
	AI_Output(self,other,"DIA_Orry_Waffe_06_01");	//����� ����������� �����, �����, ���-������ �������, ��� ������� ������ ���� �� �����.
	AI_Output(self,other,"DIA_Orry_Waffe_06_02");	//�� ����� � ����� �� ����� � �����-������ ������ ������ � �����. ����� ���� ������� � ���������, �� � ������� �� ��������.
	AI_Output(self,other,"DIA_Orry_Waffe_06_03");	//���������� ����� ����� ����� ������� �� �������, �� ����� ��� � ������� �������������.
};

