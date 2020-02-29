
instance DIA_FORTUNO_EXIT(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 999;
	condition = dia_fortuno_exit_condition;
	information = dia_fortuno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_fortuno_exit_condition()
{
	return 1;
};

func void dia_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_GREET(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_greet_condition;
	information = dia_fortuno_greet_info;
	permanent = 0;
	important = 1;
};


func int dia_fortuno_greet_condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_fortuno_greet_info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//���-�� ����. � �� ������ ������� �� �������� ��� �������.
};


var int fortuno_rationday;

instance DIA_FORTUNO_GETGESCHENK(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_getgeschenk_condition;
	information = dia_fortuno_getgeschenk_info;
	permanent = 0;
	description = "��� ��� �� �������?";
};


func int dia_fortuno_getgeschenk_condition()
{
	return 1;
};

func void dia_fortuno_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//���, ������ ���� ��������. ��� '�������� ������'. �������� ����!
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//������ ���� � ���� ������ ���� ������� ���������, �� ���� ���� ����� ������, ��� ��� ��������, �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//���� ������� �����-������ ����� ��� �����, ������ �� ���. � � ������������� ����� �� � ����.
	CreateInvItems(self,itmijoint_2,3);
	b_giveinvitems(self,other,itmijoint_2,3);
	FORTUNO_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"������� ������� �������. ��� ��� ��������� ��� ������������ ��� ������.");
};


instance DIA_FORTUNO_DAILYRATION(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 3;
	condition = dia_fortuno_dailyration_condition;
	information = dia_fortuno_dailyration_info;
	permanent = 1;
	description = "� ���� ����� ������� ������ ���������.";
};


func int dia_fortuno_dailyration_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk))
	{
		return 1;
	};
};

func void dia_fortuno_dailyration_info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//� ���� ����� ������� ������ ���������.
	if(FORTUNO_RATIONDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//���, ������. ��� '�������� ������'. ������ �� ����� ������ �� ��� �����!
		CreateInvItems(self,itmijoint_2,3);
		b_giveinvitems(self,other,itmijoint_2,3);
		FORTUNO_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//���� ������� ������ �� ��� �������. ���� ���� ����� ������, ������� �����, ��� ���� ������.
	};
};


instance DIA_FORTUNO_BUYJOINTS(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints_condition;
	information = dia_fortuno_buyjoints_info;
	permanent = 1;
	description = "����� ��������.";
	trade = 1;
};


func int dia_fortuno_buyjoints_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk))
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//��� �� �� ���� ������? ���� �����, ���-������ ������?
};

