
instance DIA_BAALPARVEZ_EXIT(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 999;
	condition = dia_baalparvez_exit_condition;
	information = dia_baalparvez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalparvez_exit_condition()
{
	return 1;
};

func void dia_baalparvez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_GREET(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_greet_condition;
	information = dia_baalparvez_greet_info;
	permanent = 0;
	important = 1;
};


func int dia_baalparvez_greet_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_baalparvez_greet_info()
{
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00");	//�� �������� � ����� ������, ����������!
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01");	//� �����, ����� ��������� ���� �� ���� ��������.
};


instance DIA_BAALPARVEZ_RIGHTWAY(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_rightway_condition;
	information = dia_baalparvez_rightway_info;
	permanent = 0;
	description = "� ����� ���� �������� ����?";
};


func int dia_baalparvez_rightway_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_greet))
	{
		return 1;
	};
};

func void dia_baalparvez_rightway_info()
{
	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00");	//� ����� ���� �������� ����?
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01");	//���� �������. ���� � ��� ���� ���������� ���.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02");	//���� ����� �������� �������, � ������� ������ � ����� ������ ��������� ������� ���������.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03");	//�� ��� ��� �� ������� � ���� ������ � ��������, �� ������ ����� ������� ��� ������.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04");	//����� ������� �����, ��� ���� ���������� ��� ���� �������� ����. ��� ����� ��� ����������� ����� ��������������.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05");	//��� ������ �������� ������, �� ������. ������, � ���� ��������� ���� ����.
};


instance DIA_BAALPARVEZ_MYADVANTAGE(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_myadvantage_condition;
	information = dia_baalparvez_myadvantage_info;
	permanent = 0;
	description = "� ����� ��� ������ �� ����, ��� � ������������ � ���?";
};


func int dia_baalparvez_myadvantage_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_rightway))
	{
		return 1;
	};
};

func void dia_baalparvez_myadvantage_info()
{
	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00");	//� ����� ��� ������ �� ����, ��� � ������������ � ���?
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01");	//��������, �� ������� ����� �� ���������, ��� ������� �� ������� ���������� ���.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02");	//��� �� ������� ������� ������� ����� � ����� �������. ������ ������ �� ��� ����� �������� �����.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03");	//���� ����� �� �� ���� �������, �� ������ ���� ���������� ��� ���� �������.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04");	//������, ���� �������� ������ ����� ���������� ����.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05");	//�������� ������� �� ����, ������ ��� ������ �������������� � ������-������ ������� ������!
};


instance DIA_BAALPARVEZ_SLEEPER(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 2;
	condition = dia_baalparvez_sleeper_condition;
	information = dia_baalparvez_sleeper_info;
	permanent = 0;
	description = "�� ������, ��� ����� ������?";
};


func int dia_baalparvez_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_greet))
	{
		return 1;
	};
};

func void dia_baalparvez_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00");	//�� ������, ��� ����� ������?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01");	//������ ������� � ���� �� ���� � ��������.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02");	//��� ��� ���� ���, �� ����� ��� �� �����, � ��� ��� ��� ������� ������� ������� ���.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03");	//��� ����� �������� ��������� ���� ����� � ������� � �������� ���� �������.
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04");	//��������? �� ����?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05");	//�� ����� ���������� �����, �������! ������ ������ ��� ���� � �������!
};


instance DIA_BAALPARVEZ_SLEEPERSAID(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 2;
	condition = dia_baalparvez_sleepersaid_condition;
	information = dia_baalparvez_sleepersaid_info;
	permanent = 0;
	description = "� ��� ������ ������?";
};


func int dia_baalparvez_sleepersaid_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_sleeper))
	{
		return 1;
	};
};

func void dia_baalparvez_sleepersaid_info()
{
	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00");	//� ��� ������ ������?
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01");	//�� ������ ��� � ���������� ������� ����� �� ������. ������ ��� �� ��������� ���� ������.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02");	//�� ������� ��� ������� �������� - ����� �� ��� �� ������ ����� �� ������.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03");	//�� ������ ��� ���� ���������. �� ������� ��� ������ ������� � ������ �������� ���, ��� ��� ����.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04");	//� ��������� �� ������ ���������� �����. ��� ����� ����� �������������� � �������, ��� ��, ��� ������������ ����������.
};


instance DIA_BAALPARVEZ_PSIMAGIC(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 4;
	condition = dia_baalparvez_psimagic_condition;
	information = dia_baalparvez_psimagic_info;
	permanent = 0;
	description = "�������� ��� � ����� �������.";
};


func int dia_baalparvez_psimagic_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_sleepersaid))
	{
		return 1;
	};
};

func void dia_baalparvez_psimagic_info()
{
	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00");	//�������� ��� � ����� �������.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01");	//���� ��� ��������� �������� ��������� ����� ������ ������.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02");	//������ ���� ��������� � �������� ����� �������.
};


var int baalparvez_gotopsi_day;

instance DIA_BAALPARVEZ_GOTOPSI(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 800;
	condition = dia_baalparvez_gotopsi_condition;
	information = dia_baalparvez_gotopsi_info;
	permanent = 1;
	description = "������� ���� � ���� ������. � ���� ���������� �� ����!";
};


func int dia_baalparvez_gotopsi_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(hero,dia_baalparvez_rightway) && (Npc_GetDistToWP(self,"PATH_OC_PSI_18") > 5000) && !Npc_KnowsInfo(hero,dia_baalparvez_atpsi))
	{
		return 1;
	};
};

func void dia_baalparvez_gotopsi_info()
{
	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00");	//������� ���� � ���� ������. � ���� ���������� �� ����!
	if(PSI_WALK == 0)
	{
		if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
		};
		b_logentry(CH1_JOINPSI,"���� ������, ��������� �� ��������, ���� �������������� ���� � ������� � ������ ������. �� ��������� ��������� ���� � �������� ������.");
		PSI_WALK = 1;
	};
	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01");	//����� ������! � ����� �������. ��� �� ����!
	BAALPARVEZ_GOTOPSI_DAY = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_SetRefuseTalk(self,300);
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_BAALPARVEZ_ATPSI(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_atpsi_condition;
	information = dia_baalparvez_atpsi_info;
	permanent = 0;
	important = 1;
};


func int dia_baalparvez_atpsi_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18"))
	{
		return 1;
	};
};

func void dia_baalparvez_atpsi_info()
{
	var C_NPC kalom;
	if(BAALPARVEZ_GOTOPSI_DAY > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00");	//���, �� �� �����. ������ �� ������ ���� ��������� ������ ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00");	//������ �����? ��� ��� ������.
	};
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01");	//������ � �������� � ����� ��������. ������, ���, ����� ����, �� �� �������� ����� ���.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02");	//������ ��� ������. �� ���������� ��������� � �� ������������.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03");	//� � ����������� � ������. ��� ��� ������ ����� ������ ����� ���� ������.
	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04");	//�����!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_logentry(CH1_JOINPSI,"������ ���� �������� ������. ��� ��������� ����������� ��� ���������� � ���� ��� �������. �� ��������� �� ������������ � ������������.");
	b_givexp(XP_ARRIVEDATPSICAMP);
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	kalom.aivar[AIV_FINDABLE] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

