
instance DIA_KYLE_EXIT(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 999;
	condition = dia_kyle_exit_condition;
	information = dia_kyle_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_kyle_exit_condition()
{
	return 1;
};

func void dia_kyle_exit_info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_KYLE_HUTRAGE(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 2;
	condition = dia_kyle_hutrage_condition;
	information = dia_kyle_hutrage_info;
	permanent = 1;
	important = 1;
};


func int dia_kyle_hutrage_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_kyle_hutrage_info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//������� ����� ���������: ��� ��� �� ��������� ����!
};


instance DIA_KYLE_PROBLEM(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 2;
	condition = dia_kyle_problem_condition;
	information = dia_kyle_problem_info;
	permanent = 1;
	description = "� ���� �����-�� ��������?";
};


func int dia_kyle_problem_condition()
{
	return 1;
};

func void dia_kyle_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//� ���� �����-�� ��������?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//������ ���� � �����! ����� �� ��� ��� ���� ���� ������� ��������!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//��� �������� � ����, ����� � ����� ��������� ���� ���.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//��� ���������� ��� �� ������� ��� ������ � ������.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//�� ����� �� ������ ������. � � ��� �� �������� ��� ������ �� ���� ������.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//� ����� � ����� ��������� ���� ������ �� �����, � ���� ��������� ������ �����.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//���������! � �� ��������! �� ���� ����������� ���� �� ������, ��� � �� ��������!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//� ������ ��� ��� ������ ����� ����� ��� ���. 
};

