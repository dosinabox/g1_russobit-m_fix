
instance INFO_KIRGO_EXIT(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 999;
	condition = info_kirgo_exit_condition;
	information = info_kirgo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_kirgo_exit_condition()
{
	return 1;
};

func void info_kirgo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_KIRGO_WHAT(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_what_condition;
	information = info_kirgo_what_info;
	permanent = 0;
	description = "������! � ���������.";
};


func int info_kirgo_what_condition()
{
	if(KAPITEL <= 2)
	{
		return 1;
	};
};

func void info_kirgo_what_info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//������! � ���������.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//�������! �������� ��� ���-������ � ������� ����. � ��� ����� ����� �� ������� ������ ������� ��������.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//� �����. � �������� � ���� �� �����.
};


instance INFO_KIRGO_GOOD(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_good_condition;
	information = info_kirgo_good_info;
	permanent = 0;
	description = "� ��� �������� ���� ���?";
};


func int info_kirgo_good_condition()
{
	if(Npc_KnowsInfo(hero,info_kirgo_what))
	{
		return 1;
	};
};

func void info_kirgo_good_info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//� ��� �������� ���� ���?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//��� �� �����? � ������ ������� ����� ���� ����������, �� �� ���� ��� ���� ���� ������!
};


instance INFO_KIRGO_CHARGE(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_charge_condition;
	information = info_kirgo_charge_info;
	permanent = 0;
	description = "� ������� ���� �� ���! ������, �������� �� �����!";
};


func int info_kirgo_charge_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_joinoc) && Npc_KnowsInfo(hero,info_kirgo_what) && (KAPITEL <= 1))
	{
		return 1;
	};
};

func void info_kirgo_charge_info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//� ������� ���� �� ���! �������� �� �����!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//���? �� ������ ��� �� ������� �������. ������ ����� ������ ����, � �� ���������� ���, ��� �������� � �������.
	Info_ClearChoices(info_kirgo_charge);
	Info_AddChoice(info_kirgo_charge,"���! � ���� �������. ������!",info_kirgo_charge_now);
	Info_AddChoice(info_kirgo_charge,"�����, ����� ������ ����! ",info_kirgo_charge_beer);
};

func void info_kirgo_charge_now()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//���! � ���� �������. ������!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//��� ���������... � �����, �����, ����� ��������.
	Info_ClearChoices(info_kirgo_charge);
};

func void info_kirgo_charge_beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//�����, ����� ������ ����! 
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//��� ����!
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//�������! �����, � �� ������� ����� ����� ���������� � ������� ����. ���� ��� ������ ������� � ���, ����� ��� ��� ��������� ����.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//����... ��, ��� �... ��� ��������, ������� ��� ������ ������� � ���, �� ��������� ����� �������.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//���������� �������� ����� � � ����������.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//����� ���� ������� � ����� �� ���?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//� ����, ����� ��� ��� ������ � ������.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//�� ������, ��������? ��, �� ���� �� ����� ����������� ����� �������� ������...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//�� ���� �� ������������� ������ ���������� ��� ����������, �� ������ �������� ������. ����� ������, ���� � ��� �� ����������!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//���� �� ��� ��� ������ ��������� �� ����, ����� ���. �� ��� �� ����� ������� �������� ����.
	CreateInvItem(other,itfobeer);
	b_giveinvitems(other,self,itfobeer,1);
	self.npctype = NPCTYPE_FRIEND;
	Info_ClearChoices(info_kirgo_charge);
};


var int kirgo_charged;

instance INFO_KIRGO_CHARGEREAL(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_chargereal_condition;
	information = info_kirgo_chargereal_info;
	permanent = 0;
	description = "�� ����� ���������, �� �����?";
};


func int info_kirgo_chargereal_condition()
{
	if(Npc_KnowsInfo(hero,info_kirgo_charge) && (KAPITEL <= 1))
	{
		return 1;
	};
};

func void info_kirgo_chargereal_info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//�� ����� ���������, �� �����?
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//������ �� ����!
	AI_StopProcessInfos(self);
	KIRGO_CHARGED = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance INFO_KIRGO_INARENA(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_inarena_condition;
	information = info_kirgo_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_kirgo_inarena_condition()
{
	if((KIRGO_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_kirgo_inarena_info()
{
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//����, ������. ����� ������� ����������!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight");	//����� ������� �� ���� �����, �����?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

