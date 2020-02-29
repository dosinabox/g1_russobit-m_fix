
instance DIA_RICELORD_EXIT(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 999;
	condition = dia_ricelord_exit_condition;
	information = dia_ricelord_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_ricelord_exit_condition()
{
	return 1;
};

func void dia_ricelord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICELORD_HELLO(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 1;
	condition = dia_ricelord_hello_condition;
	information = dia_ricelord_hello_info;
	permanent = 0;
	description = "��� �� ���������� �������� ������, ���� ���?";
};


func int dia_ricelord_hello_condition()
{
	return 1;
};

func void dia_ricelord_hello_info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//��� �� ���������� �������� ������, ���� ���?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//� ���? ���� ����� ������?
};


instance DIA_RICELORD_ARBEIT(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 1;
	condition = dia_ricelord_arbeit_condition;
	information = dia_ricelord_arbeit_info;
	permanent = 0;
	description = "� �� ������ ��� ���-�� ����������?";
};


func int dia_ricelord_arbeit_condition()
{
	if(Npc_KnowsInfo(hero,dia_ricelord_hello) && !Npc_KnowsInfo(hero,dia_lefty_first) && (LEFTYDEAD == FALSE))
	{
		return 1;
	};
};

func void dia_ricelord_arbeit_info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//� �� ������ ��� ���-�� ����������?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//�������� � �����. �����, �� ������� ��� ������ �� �����.
};


instance DIA_RICELORD_TRADE(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 800;
	condition = dia_ricelord_trade_condition;
	information = dia_ricelord_trade_info;
	permanent = 1;
	description = "�� ����� �� �����������...";
	trade = 1;
};


func int dia_ricelord_trade_condition()
{
	return TRUE;
};

func void dia_ricelord_trade_info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//�� ����� �� �����������...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//�� ������ ���-�� ����������?
};


var int ricelord_askedforwater_day;

instance DIA_RICELORD_LEFTYSENTME(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 1;
	condition = dia_ricelord_leftysentme_condition;
	information = dia_ricelord_leftysentme_info;
	permanent = 1;
	description = "���� ������ �����.";
};


func int dia_ricelord_leftysentme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ricelord_hello) && (LEFTY_MISSION == LOG_RUNNING) && (RICELORD_ASKEDFORWATER == FALSE) && (LEFTYDEAD == FALSE) && (RICELORD_ASKEDFORWATER_DAY != (Wld_GetDay() + 1)))
	{
		return 1;
	};
};

func void dia_ricelord_leftysentme_info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//���� ������ �����.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//��, � ��� �� ������?
	RICELORD_ASKEDFORWATER = TRUE;
};


instance DIA_RICELORD_GETWATER(C_INFO)
{
	npc = bau_900_ricelord;
	nr = 1;
	condition = dia_ricelord_getwater_condition;
	information = dia_ricelord_getwater_info;
	permanent = 1;
	description = "� ������ ������� ���������� ����.";
};


func int dia_ricelord_getwater_condition()
{
	if(RICELORD_ASKEDFORWATER == TRUE && (LEFTYDEAD == FALSE) && (LEFTY_MISSION == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_ricelord_getwater_info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//� ������ ������� ���������� ����.
	if(Npc_IsDead(org_844_lefty))
	{
		AI_Output(self,other,"SVM_12_HeKilledHim");	//�� �������� �����. ������ � ���� ������� ������������!
		RICELORD_ASKEDFORWATER = FALSE;
		AI_StopProcessInfos(self);
	}
	else if(LEFTY_WORKDAY == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//�������. �����. ������ ������� � �����.
		b_printtrademsg1("�������� 12 ������� � �����.");
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//�������� ��� ������� ������, ��� ��� �����, ����� ���� ��������� �������.
		CreateInvItems(self,itfo_potion_water_01,12);
		b_giveinvitems(self,other,itfo_potion_water_01,12);
		RICELORD_ASKEDFORWATER_DAY = Wld_GetDay() + 1;
		RICELORD_ASKEDFORWATER = FALSE;
		b_logentry(CH1_CARRYWATER,"���� ��� ��� ������ ������� � �����.");
		AI_StopProcessInfos(self);
	}
	else if(LEFTY_WORKDAY == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//��� ���� �����, ������! ����� ����� � ����, �� ����� ���� ���-�� �������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//��� ���� ��������� ���� �����, ������! ����� ����� � ����, �� ����� � ����� ����������.
		AI_StopProcessInfos(self);
	};
};

