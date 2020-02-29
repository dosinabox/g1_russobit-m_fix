
instance DIA_GILBERT_EXIT(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 999;
	condition = dia_gilbert_exit_condition;
	information = dia_gilbert_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gilbert_exit_condition()
{
	return 1;
};

func void dia_gilbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILBERT_FIRST(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_first_condition;
	information = dia_gilbert_first_info;
	permanent = 0;
	important = 1;
};


func int dia_gilbert_first_condition()
{
	return 1;
};

func void dia_gilbert_first_info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//��� �� ����� �������? ����� ��� ������� �� ��� ����, ��-��!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//���� ������� ����� ��� �������, ��� �� ������ ��� ����.
	Npc_ExchangeRoutine(self,"start2");
	b_givexp(XP_GILBERTFOUND);
};


instance DIA_GILBERT_HALLO(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo_condition;
	information = dia_gilbert_hallo_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_gilbert_hallo_condition()
{
	return 1;
};

func void dia_gilbert_hallo_info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//������ ������ ��� ����� ������. � ��� ������ ����������� � ������ ������. ��� ����� ��� ��� ��������...
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//������ ��� ���, ��������, ����� � �� ������. �� � ��� ����� �������� �����. � ������ ������ ����� ������� ����� ��������.
};

instance DIA_GILBERT_HALLO2(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo2_condition;
	information = dia_gilbert_hallo2_info;
	permanent = 0;
	description = "(����������� �������� �����)";
};


func int dia_gilbert_hallo2_condition()
{
	if(Npc_KnowsInfo(hero,dia_gilbert_hallo) && Npc_KnowsInfo(hero,quentin_dia33) && !Npc_HasItems(hero,itke_gilbert))
	{
		return TRUE;
	};
};

func void dia_gilbert_hallo2_info()
{
	if(hero.level < 6)
	{	
		AI_Output(self,other,"SVM_4_GetOutOfHere");	//�������� ������!
		AI_StopProcessInfos(self);
		b_setattackreason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		AI_StartState(self,zs_attack,1,"");
		b_logentry(QUENTIN_GANG,"������� ������� ���������� �� ����. ���������, ����� ���� �������� ��� ����� ��������?");
	}
	else
	{
		AI_Output(self,other,"SVM_4_LookAway");	//�� ����, �� ����� � ������ ������ �� �����...
		b_givexp(100);
		b_giveinvitems(self,hero,itke_gilbert,1);
		AI_StopProcessInfos(self);
		AI_StartState(self,zs_flee,1,"");
		b_logentry(QUENTIN_GANG,"������� ������ ��� ����� ����� � �������� ������. ���������, ����� ��� ��� ����� ��������?");
	};
};

