
instance DIA_VIRAN_EXIT(C_INFO)
{
	npc = nov_1302_viran;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_viran_exit_condition()
{
	return 1;
};

func void dia_viran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VIRAN_WHAT(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_what_condition;
	information = dia_viran_what_info;
	permanent = 0;
	description = "��� � ���� �� ������?";
};


func int dia_viran_what_condition()
{
	return 1;
};

func void dia_viran_what_info()
{
	AI_Output(other,self,"DIA_Viran_What_15_00");	//��� � ���� �� ������?
	AI_Output(self,other,"DIA_Viran_What_07_01");	//������� ��������. ������ ������ ���������� ��� ������� �������, � ��� ����� ����� ������.
	AI_Output(self,other,"DIA_Viran_What_07_02");	//������ ����� ������, ����� ������� �����, ��������� ���� ��� �������, �� �������� ������ ������ �����. �� ��� ������ � �������.
	AI_Output(other,self,"DIA_Viran_What_15_03");	//������?
	AI_Output(self,other,"DIA_Viran_What_07_04");	//������ ��� ����� �� ���� ������ ������� ���� �� �����������. �� ���� ����� � ������� ������ �� ����� �������� ��������.
	AI_Output(self,other,"DIA_Viran_What_07_05");	//�� ������� ��� ������ �������, � ���� ��������� ����.
};


instance DIA_VIRAN_FETCHWEED(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_fetchweed_condition;
	information = dia_viran_fetchweed_info;
	permanent = 0;
	description = "� �� ����� �����. � ������ ��������� ��� ������ ������ ���������.";
};


func int dia_viran_fetchweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_viran_fetchweed_info()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00");	//���� ������� ���� ����. � ������ ��������� ��� ������ ������ ���������.
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01");	//�� �������, ��� ��� ������, ��?
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02");	//��� ����� ����� ������ � �������: '���� ������� ���� ����', � ����� �� ������� �� ���, �� ���������.
	Info_ClearChoices(dia_viran_fetchweed);
	Info_AddChoice(dia_viran_fetchweed,"�� ����� � ������ � ���� ���, ���� ��� �� ������!",dia_viran_fetchweed_gotohim);
	Info_AddChoice(dia_viran_fetchweed,"�� ���� ������������� ������ ���� ����!",dia_viran_fetchweed_really);
};

func void dia_viran_fetchweed_really()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00");	//�� ���� ������������� ������ ���� ����!
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//�� ��, ��� ��.
};

func void dia_viran_fetchweed_gotohim()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00");	//�� ����� � ������ � ���� ���, ���� ��� �� ������!
	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01");	//� ���� ���� ���� �������. �� ��������, ��� ��������� �� ���, ���� ��������� ���� ��������� �������!
	Info_ClearChoices(dia_viran_fetchweed);
};


var int viran_bloodflies;

instance DIA_VIRAN_BLOODFLIES(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_bloodflies_condition;
	information = dia_viran_bloodflies_info;
	permanent = 0;
	description = "� ��� � ������ �������?";
};


func int dia_viran_bloodflies_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_fetchweed))
	{
		return 1;
	};
};

func void dia_viran_bloodflies_info()
{
	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00");	//� ��� � ������ �������?
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01");	//��� ����� ������. ��� � ��� �������, ����� ������ ��������. �� ��� ������� ������ ��� ������ ������.
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02");	//��� ��� ��� ���� �� ������� �����! ������ ���� ��� �������?
	VIRAN_BLOODFLIES = LOG_RUNNING;
	b_logentry(CH1_DELIVERWEED,"������ ������ ��� ������ ��������� ����� ����, ��� � ���� ���� ������� � ������.");
};


var int viran_botenday;

instance DIA_VIRAN_RUNNING(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_running_condition;
	information = dia_viran_running_info;
	permanent = 1;
	description = "�� � �� ���� ����� ������� �������.";
};


func int dia_viran_running_condition()
{
	if(VIRAN_BLOODFLIES == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_viran_running_info()
{
	AI_Output(other,self,"DIA_Viran_Running_15_00");	//�� � �� ���� ����� ������� �������.
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,bloodfly,zs_mm_rtn_wusel,-1) && (Npc_GetDistToNpc(self,other) < 2000))
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_00");	//��, ��� ������ � ������� ������ �� ���. ��� ��������!
		AI_Output(self,hero,"DIA_Viran_Running_07_01");	//������ ��� �� �� �����������!
	}
	else
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_02");	//�, ������� ������ ����� �� �����. ������� ������!
		AI_Output(self,hero,"DIA_Viran_Running_07_03");	//�� ���� �� ������� ���� ������ �����, ���� ���� �� ���.
		AI_Output(self,hero,"DIA_Viran_Running_07_04");	//� ������ �� ������ ���, ����� �������� ����, � ����?
		AI_Output(self,hero,"DIA_Viran_Running_07_05");	//���, ������ ������ � ������ ��� ��� ������.
		b_printtrademsg1("������� �������� (50).");
		AI_Output(self,hero,"DIA_Viran_Running_07_06");	//���� �� ������, ��� ����� ������� ����, �������� ��� ������ ����������� ���������� �����, �����-�� �� ������, ��� ��� ��������� ��������.
		b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
		if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
		{
			b_logentry(CH1_DELIVERWEED,"������ ����� ��� ������ �������� ������ ���������. ���������, ��� ������ �� ��� ��� �����.");
		}
		else
		{
			b_logentry(CH1_DELIVERWEED,"������ ��� ��� ������ ���������. ��� ��������� ������� ����. ��� �������, �� ��� ��� ������ ��������.");
		};
		b_givexp(XP_WEEDFROMVIRAN);
		VIRAN_BLOODFLIES = LOG_SUCCESS;
		VIRAN_BOTENDAY = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};


instance DIA_VIRAN_PERM(C_INFO)
{
	npc = nov_1302_viran;
	nr = 1;
	condition = dia_viran_perm_condition;
	information = dia_viran_perm_info;
	permanent = 1;
	description = "��� ���� ���� ������?";
};


func int dia_viran_perm_condition()
{
	if(VIRAN_BLOODFLIES == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_viran_perm_info()
{
	AI_Output(other,self,"DIA_Viran_Perm_15_00");	//��� ���� ���� ������?
	AI_Output(self,other,"DIA_Viran_Perm_07_01");	//��, ��, ��������. ������, ��� ���� �������� ���� ������ �������, ��� � ���.
	AI_Output(self,other,"DIA_Viran_Perm_07_02");	//��, �-�� ��� ����� �� ��� ����� ��� �����. ��� ����� ���� '������'.
};


instance DIA_VIRAN_RIPOFF(C_INFO)
{
	npc = nov_1302_viran;
	nr = 5;
	condition = dia_viran_ripoff_condition;
	information = dia_viran_ripoff_info;
	permanent = 0;
	description = "� ����� ������ �� ������� ��� ��� ������.";
};


func int dia_viran_ripoff_condition()
{
	if((VIRAN_BOTENDAY <= (Wld_GetDay() - 2)) && (VIRAN_BLOODFLIES == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_viran_ripoff_info()
{
	AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//� ����� ������ �� ������� ��� ��� ������.
	AI_Output(self,other,"DIA_Viran_RipOff_07_01");	//���, �����?
	AI_Output(other,self,"DIA_Viran_RipOff_15_02");	//������ �� ������ ���, ��� ������ ����� ��������� ���� ����������� � ������, ����� �������� ����, ��� ��� ������. � ���� ��� �������.
	AI_Output(self,other,"DIA_Viran_RipOff_07_03");	//��, �����! ������� �� ���� ������ ��������!
	b_printtrademsg1("������� �������� (50).");
	CreateInvItems(self,itmi_plants_swampherb_01,50);
	b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
};

