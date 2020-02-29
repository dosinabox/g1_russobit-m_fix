
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
	if(Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 4)
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
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		Info_AddChoice(info_jackal_hello,"���, ������ ���� ������ ������. ���� ������ ����� ��� �����������.",info_jackal_hello_pay);
	}
	else
	{
		Info_AddChoice(info_jackal_hello,"������ � ���� ��� ������ ������.",info_jackal_hello_noore);
	};
};

func void info_jackal_hello_pay()
{
	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00");	//���, ������ ���� ������ ������. ���� ������ ����� ��� �����������.
	b_printtrademsg1("������ ����: 10");
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01");	//���� � ���� ����������, �� ������ �� ���� ������������. �� ������ ������� ����� ���� ����� ������ � ������ ��������.
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02");	//�� �������� � ������ ������� ������ ������� � �������.
	b_giveinvitems(other,self,itminugget,10);
	JACKAL_PROTECTIONPAID = TRUE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	JACKAL_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_jackal_hello);
};

func void info_jackal_hello_noore()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//������ � ���� ��� ������ ������.
	AI_Output(self,other,"SVM_7_YouWannaFoolMe");	//�� ��������� ���� ��������, ��?
	//AI_Output(self,other,"Info_Jackal_Schutz_07_02");	//�� ��� �� �������� ������ ������. �������, ����� � ���� ����� ����.
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
	permanent = 1;
	description = "� ������� ���� �����������. ��� ���� ������ ������.";
};


func int info_jackal_schutz_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_hello) && (JACKAL_PROTECTIONPAID == FALSE) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_jackal_schutz_info()
{
	AI_Output(other,self,"Info_Jackal_Schutz_15_00");	//� ������� ���� �����������. ��� ���� ������ ������.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		b_printtrademsg1("������ ����: 10");
		AI_Output(self,other,"Info_Jackal_Schutz_07_01");	//������� �������! ������ � ���� ���� ��������!
		b_giveinvitems(other,self,itminugget,10);
		JACKAL_PROTECTIONPAID = TRUE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		JACKAL_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00");	//��, ������ �������� ���� ��������! �������, ����� � ���� ����� ����!
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
	if(JACKAL_PROTECTIONPAID == TRUE && KAPITEL < 4)
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
	if(Npc_GetTrueGuild(hero) == GIL_GRD && KAPITEL < 4)
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
	self.flags = 0;
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
	else if(c_npcbelongstopsicamp(hero))
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
	b_story_jackalfight();
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(GETNEWGUY_STARTED == TRUE && OC_BANNED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
		if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die) && !Npc_KnowsInfo(hero,info_fletcher_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"�����, ������� �������� ����������� ��������� ����� � ������� ����������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
			b_logentry(CH4_BANNEDFROMOC,"�������, ��� ������, ��� ���� �������� �� ������� ������!");
		};
	};
	if(GORN_JOINEDFORFM)
	{
		var C_NPC gorn;
		gorn = Hlp_GetNpc(pc_fighter);
		AI_SetWalkMode(gorn,NPC_RUN);
		AI_Wait(gorn,3);
		AI_GotoWP(gorn,"FMC_PATH15");
		b_exchangeroutine(gorn,"WaitFM");
	};
};

