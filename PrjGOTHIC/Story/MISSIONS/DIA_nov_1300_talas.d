
instance NOV_1300_TALAS_EXIT(C_INFO)
{
	npc = nov_1300_talas;
	nr = 999;
	condition = nov_1300_talas_exit_condition;
	information = nov_1300_talas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int nov_1300_talas_exit_condition()
{
	return TRUE;
};

func void nov_1300_talas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_UR(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ur_condition;
	information = nov_1300_talas_ur_info;
	important = 0;
	permanent = 0;
	description = "�� �����? ��� ���� ��������, ��?";
};


func int nov_1300_talas_ur_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringbook) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void nov_1300_talas_ur_info()
{
	AI_Output(other,self,"Nov_1300_Talas_UR_Info_15_01");	//�� �����? ��� ���� ��������, ��?
	AI_Output(self,other,"Nov_1300_Talas_UR_Info_02_02");	//������ ���� � �����, � �� ���� �� ���� ��������!
};


instance NOV_1300_TALAS_HELP(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_help_condition;
	information = nov_1300_talas_help_info;
	important = 0;
	permanent = 0;
	description = "� ���� ������ ���� ������� ��������.";
};


func int nov_1300_talas_help_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_ur) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void nov_1300_talas_help_info()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_Info_15_01");	//� ���� ������ ���� ������� ��������.
	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_02");	//������? ������, �� ���� ������ �������... � ������ � ������ ��������� ���� � ������ �����.
	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_03");	//��������, � ���� ���� ����: ����� � ������ ����, ��� ��� ���������, � �� �������� ��������.
	Info_ClearChoices(nov_1300_talas_help);
	Info_AddChoice(nov_1300_talas_help,"������.",nov_1300_talas_help_ok);
	Info_AddChoice(nov_1300_talas_help,"��� ��������� ���� � �������� ������ ����.",nov_1300_talas_help_bring);
	Info_AddChoice(nov_1300_talas_help,"� ������ ���, �� ������ �� ��������� ������.",nov_1300_talas_help_more);
};

func void nov_1300_talas_help_ok()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_OK_15_01");	//������.
	AI_Output(self,other,"Nov_1300_Talas_HELP_OK_02_02");	//����� �� ����� ����������� ����� ������.
	Info_ClearChoices(nov_1300_talas_help);
};

func void nov_1300_talas_help_bring()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_BRING_15_01");	//��� ��������� ���� � �������� ������ ����.
	AI_Output(self,other,"Nov_1300_Talas_HELP_BRING_02_02");	//�����. �� ����� ����������� ����� ������.
	b_printtrademsg1("�������� ����: 30");
	CreateInvItems(self,itminugget,30);
	b_giveinvitems(self,hero,itminugget,30);
	Info_ClearChoices(nov_1300_talas_help);
};

func void nov_1300_talas_help_more()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_MORE_15_01");	//� ������ ���, �� ������ �� ��������� ������.
	AI_Output(self,other,"Nov_1300_Talas_HELP_MORE_02_02");	//���? �� ��� �� ������! �� ������... ��� ��� �����, ����� ������ �����.
	b_printtrademsg1("�������� ����: 50");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,hero,itminugget,50);
	Info_ClearChoices(nov_1300_talas_help);
};


instance NOV_1300_TALAS_READY(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ready_condition;
	information = nov_1300_talas_ready_info;
	important = 0;
	permanent = 0;
	description = "� �����, �� ����� ����.";
};


func int nov_1300_talas_ready_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_help) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void nov_1300_talas_ready_info()
{
	AI_Output(other,self,"Nov_1300_Talas_READY_Info_15_01");	//� �����, �� ����� ����.
	AI_Output(self,other,"Nov_1300_Talas_READY_Info_02_02");	//��� �� ����.
	b_logentry(CH2_BOOK,"� ��������� ������ ������ ������� ��������. �� ������� ���� � ���� �����, ��� ��������� �����.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GOBBOCAVE");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_BRIDGE(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_bridge_condition;
	information = nov_1300_talas_bridge_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_bridge_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_ready) && (Npc_GetDistToWP(self,"LOCATION_29_02") < 1000))
	{
		return 1;
	};
};

func void nov_1300_talas_bridge_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_01");	//�� ������ � ������ ������� ��� ������� �����. ���� ���������.
	AI_Output(other,self,"Nov_1300_Talas_BRIDGE_Info_15_02");	//�� �� ���� �� �������?
	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_03");	//� ������� �����... ��... ���� ���������� �����.
	b_logentry(CH2_BOOK,"�� ����� � ����� � ������ ��������. ����� �� ����� ������������ ���� ������. ��� �������� ��� ������ ������.");
};


instance NOV_1300_TALAS_BACK(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_back_condition;
	information = nov_1300_talas_back_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_back_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_bridge) && Npc_HasItems(hero,itwrfokusbuch))
	{
		return 1;
	};
};

func void nov_1300_talas_back_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BACK_Info_02_01");	//�������� � ����! �������! ������ �� ����� ��������� � ������.
	b_logentry(CH2_BOOK,"� ����� ��������. ������ � ������� �� ������� ��� � �������� ������.");
	Npc_ExchangeRoutine(self,"RETURNTOCAMP");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_RETURNED(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_returned_condition;
	information = nov_1300_talas_returned_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_returned_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_back) && Npc_HasItems(hero,itwrfokusbuch) && (Npc_GetDistToWP(self,"PSI_START") < 1000) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void nov_1300_talas_returned_info()
{
	AI_Output(self,other,"Info_Talas_RETURNED_02_01");	//��� �� � ����. ���� ����� �������� ������ �������� ��� ������.
	AI_Output(other,self,"Info_Talas_RETURNED_15_02");	//���� ��������� � �� ��������� �� ����!
	AI_Output(self,other,"Info_Talas_RETURNED_02_03");	//�� ����� �� ����! �� ����� ���� � �����������.
	b_logentry(CH2_BOOK,"�� ������ � �������� ������. ����� �������� ��� ��� ������. � ��� ������ �������� ��� ������.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BackInCamp");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_OGY(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ogy_condition;
	information = nov_1300_talas_ogy_info;
	important = 0;
	permanent = 0;
	description = "���� ������� ��� �����.";
};


func int nov_1300_talas_ogy_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_where))
	{
		return 1;
	};
};

func void nov_1300_talas_ogy_info()
{
	AI_Output(other,self,"Nov_1300_Talas_OGY_15_01");	//���� ������� ��� �����. �� ������, ��� �� ������� ������� ���� � �������� �����. ��� ����� ����� ����� ������ � �������, ������� ���� � ���.
	AI_Output(self,other,"Nov_1300_Talas_OGY_02_02");	//���, � ����� ���������. ����! ���� �� � �� ������� ���� ��������...
	AI_Output(self,other,"Nov_1300_Talas_OGY_02_03");	//�� ������, ��� �� ����.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OGY");
};


instance NOV_1300_TALAS_BACKAGAIN(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_backagain_condition;
	information = nov_1300_talas_backagain_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_backagain_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_011") < 1000)
	{
		return 1;
	};
};

func void nov_1300_talas_backagain_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_01");	//����� ���� � � ����� �� �����, ����� ��� ��� ������.
	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_02");	//����� ���� ������������, ����� �������� ����. ���� ����� �� ������ �������� - � ��� �� ��������.
	AI_Output(other,self,"Nov_1300_Talas_BACKAGAIN_Info_15_03");	//��� �, ���������, ��� ��� �����. ����������� � ������, � � ����� ���� �����.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ReturnToCampAgain");
};

