
var int pock_forgetall;

instance DIA_POCK_EXIT(C_INFO)
{
	npc = bau_902_pock;
	nr = 999;
	condition = dia_pock_exit_condition;
	information = dia_pock_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_pock_exit_condition()
{
	return 1;
};

func void dia_pock_exit_info()
{
	POCK_FORGETALL = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_POCK_WASSER(C_INFO)
{
	npc = bau_902_pock;
	nr = 800;
	condition = info_pock_wasser_condition;
	information = info_pock_wasser_info;
	permanent = 1;
	description = "� �� �����. ������ ����.";
};


func int info_pock_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_pock_wasser_info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00");	//� �� �����. ������ ����.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		b_printtrademsg1("������ ������� ����.");
		AI_Output(self,other,"Info_Pock_Wasser_04_01");	//�������, ��������. ���� ��� ��� ��� �� �������!
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00");	//�� � ���� �� �������� �� �����. �����, �� ��������, � ������ � ����-������ ���.
	};
};


instance DIA_POCK_HELLO(C_INFO)
{
	npc = bau_902_pock;
	nr = 1;
	condition = dia_pock_hello_condition;
	information = dia_pock_hello_info;
	permanent = 0;
	description = "������! � ���������!";
};


func int dia_pock_hello_condition()
{
	if(POCK_FORGETALL == FALSE)
	{
		return 1;
	};
};

func void dia_pock_hello_info()
{
	AI_Output(other,self,"DIA_Pock_Hello_15_00");	//������! � ���������!
	AI_Output(self,other,"DIA_Pock_Hello_04_01");	//������� ������ ����� ����� ����.
	AI_Output(other,self,"DIA_Pock_Hello_15_02");	//����, �� ��� ����� �����?
	AI_Output(self,other,"DIA_Pock_Hello_04_03");	//�� ���������� ����, ��������. � ����� ���� ����� �� ������.
};


instance DIA_POCK_KNOWMUCH(C_INFO)
{
	npc = bau_902_pock;
	nr = 1;
	condition = dia_pock_knowmuch_condition;
	information = dia_pock_knowmuch_info;
	permanent = 0;
	description = "����� ��, ���������, ��� ������ �� ���� �����?";
};


func int dia_pock_knowmuch_condition()
{
	if((POCK_FORGETALL == FALSE) && Npc_KnowsInfo(hero,dia_pock_hello))
	{
		return 1;
	};
};

func void dia_pock_knowmuch_info()
{
	AI_Output(other,self,"DIA_Pock_KnowMuch_15_00");	//����� ��, ���������, ��� ������ �� ���� �����?
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_01");	//��, ��� �������... � ����� ��� ����� ������� �����, �� �����, ��������� � ������� ���.
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_02");	//��� ������� � ������ ��� �����. �� �������� ������� ���� � ������, �� ��� ����� �������.
};


instance DIA_POCK_WHYJAIL(C_INFO)
{
	npc = bau_902_pock;
	nr = 2;
	condition = dia_pock_whyjail_condition;
	information = dia_pock_whyjail_info;
	permanent = 0;
	description = "��� �� ���� �����?";
};


func int dia_pock_whyjail_condition()
{
	if((POCK_FORGETALL == FALSE) && Npc_KnowsInfo(hero,dia_pock_hello))
	{
		return 1;
	};
};

func void dia_pock_whyjail_info()
{
	AI_Output(other,self,"DIA_Pock_WhyJail_15_00");	//��� �� ���� �����?
	AI_Output(self,other,"DIA_Pock_WhyJail_04_01");	//��� ��� ������, ����������� ������. ��� ������ ��� ��� �� ����, ��� ��� �������. � ������ �� ��� �������.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_02");	//� ������ �� ���� ������ ������� � �������� ���� ����. �� ����� �� ����, ��� �� ����. �� ������� ���� ����� � �� ���� �� ������.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_03");	//����� ��� � �������� ������ ������. �� ����� �������� ������, �������� �� �����, ����� ���� ����!
};


instance DIA_POCK_FORGOTALL(C_INFO)
{
	npc = bau_902_pock;
	nr = 1;
	condition = dia_pock_forgotall_condition;
	information = dia_pock_forgotall_info;
	permanent = 1;
	description = "��� ��?";
};


func int dia_pock_forgotall_condition()
{
	if(POCK_FORGETALL == TRUE)
	{
		return 1;
	};
};

func void dia_pock_forgotall_info()
{
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_01");	//������� ������ ����� ����� ����.
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_02");	//��, ��, �������, ��� ������������� � �����!
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_03");	//���! ��������, ���� ���� �� �����! � ���� ������ ����� �� �����.
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_04");	//��, �������...
};

instance INFO_POCK_WASSER_NOLEFTY(C_INFO)
{
	npc = bau_902_pock;
	nr = 800;
	condition = info_pock_wasser_nolefty_condition;
	information = info_pock_wasser_nolefty_info;
	permanent = 1;
	description = "� ������ ���� ����.";
};

func int info_pock_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_pock_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//� ������ ���� ����.
	b_printtrademsg1("������ ������� ����.");
	AI_Output(self,other,"SVM_4_YeahWellDone");	//�������!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

instance DIA_POCK_HELLO2(C_INFO)
{
	npc = bau_902_pock;
	nr = 1;
	condition = dia_pock_hello2_condition;
	information = dia_pock_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_pock_hello2_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_pock_hello2_info()
{
	AI_Output(self,other,"SVM_4_ItWasAGoodFight");	//������ ���� ��������� �����, ��� ������.
	AI_StopProcessInfos(self);
};

