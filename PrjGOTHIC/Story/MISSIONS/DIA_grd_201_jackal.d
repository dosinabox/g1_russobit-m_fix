
instance INFO_JACKAL_EXIT(C_INFO)
{
	npc = grd_201_jackal;
	nr = 999;
	condition = info_jackal_exit_condition;
	information = info_jackal_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_jackal_exit_condition()
{
	return 1;
};

func void info_jackal_exit_info()
{
	AI_StopProcessInfos(self);
};


var int jackal_protectionpaid;
var int jackal_payday;

instance INFO_JACKAL_HELLO(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_hello_condition;
	information = info_jackal_hello_info;
	permanent = 0;
	important = 1;
};


func int info_jackal_hello_condition()
{
	if(KAPITEL <= 2)
	{
		return 1;
	};
};

func void info_jackal_hello_info()
{
	AI_Output(self,other,"Info_Jackal_Hello_07_00");	//�! ����� ����!
	AI_Output(other,self,"Info_Jackal_Hello_15_01");	//��� ���� �� ���� �����?
	AI_Output(self,other,"Info_Jackal_Hello_07_02");	//���� ���������� ���� ���� ������. �� ����� ���������, � ����� ����� �������� � ������������... � ����� �������� ���� �� ��������� �� ��� �� ��������� ��������������.
	AI_Output(self,other,"Info_Jackal_Hello_07_03");	//����� ������ ������ ����. ��� �� ������ �������!
	Info_ClearChoices(info_jackal_hello);
	Info_AddChoice(info_jackal_hello,"� ���� � �������� ������� ����?",info_jackal_hello_whatif);
	Info_AddChoice(info_jackal_hello,"� ��� �����, ����� ���� ��� � ����� �� ����?",info_jackal_hello_whatdoiget);
	Info_AddChoice(info_jackal_hello,"��� ������, ������ ������. ���� ������ ����� ��� �����������.",info_jackal_hello_pay);
};

func void info_jackal_hello_pay()
{
	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00");	//��� ������, ���� ������ ������. ���� ������ ����� ��� �����������.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01");	//���� � ���� ����������, �� ������ �� ���� ������������. �� ������ ������� ����� ���� ����� ������ � ������ ��������.
		AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02");	//�� �������� � ������ ������� ������ ������� � �������.
		JACKAL_PROTECTIONPAID = TRUE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		JACKAL_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00");	//��, ������ �������� ���� ��������! �������, ����� � ���� ����� ����!
	};
	Info_ClearChoices(info_jackal_hello);
};

func void info_jackal_hello_whatdoiget()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//� ��� �����, ����� ���� ��� � ����� �� ����?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_01");	//���� �� ������ � ���� ������, � ���� ������������ �� �����.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_02");	//���� �� ���� ������� ���-������ �� ������ ������, ��� �� ����������� � �����-������ ������������ �� ������ ���������, � ����� � ���� �� ������.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_03");	//���� �� ����������� � ���-������ �� ���������, �� ������� ����, ��� ��� ������ �� ������.
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_04");	//� ���� �������� ���?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_05");	//����� �� ����������� �� ������. �� ����� ������� ����� ����� �������.
};

func void info_jackal_hello_whatif()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatIf_15_00");	//� ���� � �������� ������� ����?
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_01");	//��, �� ����� �������� ���� �������������! �� ��� �������� � ������ ���������. ������������ ������� ����, � ����� ������ �����, ��� ����� ���������!
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_02");	//��� ����� ������� � ����� �����. ��� ������ ���� �� �� ���������, �� ����������� �� ��� ������. ��� �������?
	Info_AddChoice(info_jackal_hello,"�� ��� ��������.",info_jackal_hello_later);
};

func void info_jackal_hello_later()
{
	AI_Output(other,self,"Info_Jackal_Hello_Later_15_00");	//�� ��� ��������.
	AI_Output(self,other,"Info_Jackal_Hello_Later_07_01");	//���������� �� ����������� � ������������!
	JACKAL_PROTECTIONPAID = FALSE;
	npc_setpermattitude(self,ATT_NEUTRAL);
	JACKAL_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_jackal_hello);
};


instance INFO_JACKAL_SCHUTZ(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_schutz_condition;
	information = info_jackal_schutz_info;
	permanent = 0;
	description = "� ������� ���� �����������. ��� ���� ������ ������.";
};


func int info_jackal_schutz_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_hello) && (JACKAL_PROTECTIONPAID == FALSE))
	{
		return 1;
	};
};

func void info_jackal_schutz_info()
{
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(other,self,"Info_Jackal_Schutz_15_00");	//� ������� ���� �����������. ��� ���� ������ ������.
		AI_Output(self,other,"Info_Jackal_Schutz_07_01");	//������� �������! ������ � ���� ���� ��������!
		JACKAL_PROTECTIONPAID = TRUE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		JACKAL_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_07_02");	//�� ��� �� �������� ������ ������. �������, ����� � ���� ����� ����.
	};
};


instance INFO_JACKAL_PERMPAID(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_permpaid_condition;
	information = info_jackal_permpaid_info;
	permanent = 1;
	description = "��, ��� ����?";
};


func int info_jackal_permpaid_condition()
{
	if(JACKAL_PROTECTIONPAID == TRUE)
	{
		return 1;
	};
};

func void info_jackal_permpaid_info()
{
	AI_Output(other,self,"Info_Jackal_PermPaid_15_00");	//��, ��� ����?
	AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//�� ������ ������������ �� ��� ������!
};


instance GRD_201_JACKAL_WELCOME(C_INFO)
{
	npc = grd_201_jackal;
	condition = grd_201_jackal_welcome_condition;
	information = grd_201_jackal_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_201_jackal_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_201_jackal_welcome_info()
{
	AI_Output(self,other,"GRD_201_Jackal_WELCOME_Info_07_01");	//�� ������ ������� ������ � ����� ������! ��� �������!
};


instance INFO_JACKAL_PAYDAY(C_INFO)
{
	npc = grd_201_jackal;
	condition = info_jackal_payday_condition;
	information = info_jackal_payday_info;
	permanent = 0;
	important = 1;
};


func int info_jackal_payday_condition()
{
	if(FMTAKEN)
	{
		return TRUE;
	};
};

func void info_jackal_payday_info()
{
	if(c_npcbelongstonewcamp(hero))
	{
		if((OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF) || (OLDHEROGUILD == GIL_STT))
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_01");	//���, ��� ��� � ���? ���������, ������� ������� � ������ ������!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_02");	//���� �� �� �� �������� � ����� ������������, �� �� ��� ��� ���� �������������� � ���!
		}
		else
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_03");	//����������-�� �� ����! ��� �� ��� ��� �� ������ ������, ������� ��������� ��������� ��� �� �����!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_04");	//���� �� �� � ���� ����� ������ ���������� �������, �� �� ��� ���� �� ��� - �����������!
		};
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_05");	//���, ���, ��� ��� ���? ���� �� ����������� �� ��������� ������!
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_06");	//�� ��� ����� � ���� �������, ��� ��� ���� ����� �� ���� ����������!
	};
	if(JACKAL_PROTECTIONPAID)
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_07");	//������ �� ����, ������� �� ��� ��������, ���� �� �������.
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_08");	//���� ������ ������ ��� ���� �����, ����� � ���� ���� ����� �����������.
	};
	AI_Output(other,self,"Info_Jackal_PAYDAY_15_09");	//�� ������� ������ �����! ��� �� ����� �� �����!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_10");	//�� ��� ���������� ��� ������ �����. � ���� ��� ������ �� ������� ��������. �� ��� � �������!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_11");	//��, �� �� ������ ���� �� ��� �����!
	AI_StopProcessInfos(self);
	b_story_jackalfight();
};

