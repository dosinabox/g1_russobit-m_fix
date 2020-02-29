
instance DIA_JORU_EXIT(C_INFO)
{
	npc = nov_1305_joru;
	nr = 999;
	condition = dia_joru_exit_condition;
	information = dia_joru_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_joru_exit_condition()
{
	return 1;
};

func void dia_joru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORU_GREET(C_INFO)
{
	npc = nov_1305_joru;
	nr = 1;
	condition = dia_joru_greet_condition;
	information = dia_joru_greet_info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int dia_joru_greet_condition()
{
	return 1;
};

func void dia_joru_greet_info()
{
	AI_Output(other,self,"DIA_Joru_Greet_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Joru_Greet_07_01");	//� ��������� ����������� � ���� �� ������ �������.
	AI_Output(self,other,"DIA_Joru_Greet_07_02");	//� � ��� ��� ���������, �� ����� � ����� ������ - ����� �� ����.
	AI_Output(self,other,"DIA_Joru_Greet_07_03");	//� ���� ������� � ���������. �� ���������. �� ������ ���, ��� ���� � ���� ������� � ���������� ������ ������, � � ��� ����� ����� ��������.
	AI_Output(self,other,"DIA_Joru_Greet_07_04");	//��, ������, ��� ������� ������. �������� � ���� ����� � ����� ������.
	AI_Output(self,other,"DIA_Joru_Greet_07_05");	//��� �������� ��, ��� � ��������� ������, ������� � �� ���������.
};


instance DIA_JORU_TESTER(C_INFO)
{
	npc = nov_1305_joru;
	nr = 1;
	condition = dia_joru_tester_condition;
	information = dia_joru_tester_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_joru_tester_condition()
{
	if(Npc_KnowsInfo(hero,dia_joru_greet))
	{
		return 1;
	};
};

func void dia_joru_tester_info()
{
	AI_Output(other,self,"DIA_Joru_Tester_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Joru_Tester_07_01");	//� ���������� ������� ������������ �� ���������� �����, �������������� ��� �������.
	AI_Output(self,other,"DIA_Joru_Tester_07_02");	//��� � ��������� ���� ��� �������� �������� ��� ����� �����, � �� �� ���������.
	AI_Output(self,other,"DIA_Joru_Tester_07_03");	//�����, �������� �� �������, ����������� ���� ���. ���� ��������� �� ����������, ��� ������� �������� ����� �������.
};


instance DIA_JORU_SLEEPERCONTACT(C_INFO)
{
	npc = nov_1305_joru;
	nr = 1;
	condition = dia_joru_sleepercontact_condition;
	information = dia_joru_sleepercontact_info;
	permanent = 0;
	description = "�� ��� ������� �� ������?";
};


func int dia_joru_sleepercontact_condition()
{
	if(Npc_KnowsInfo(hero,dia_joru_tester))
	{
		return 1;
	};
};

func void dia_joru_sleepercontact_info()
{
	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00");	//�� ��� ������� �� ������?
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01");	//���, ��� �� ���� �� ������. ����� ��������� ����������� ������������.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02");	//����� ������� ��������� ��� ����� ���������� ���� � ���, ����� ��� ���������, �� ��� �������, ��� ��� ������ ��� ������ �� ����������.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03");	//���� ����� �������� ������� ����������, �� ������ ��� ����...
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04");	//�� ����� � ��� ����� ����, � ����� � ����� ��������� ���������� �������� � �������� ����� �������.
};


var int joru_bringjoints;

instance DIA_JORU_JOINPSI(C_INFO)
{
	npc = nov_1305_joru;
	nr = 5;
	condition = dia_joru_joinpsi_condition;
	information = dia_joru_joinpsi_info;
	permanent = 0;
	description = "� ���� �������������� � ����� ������. �� ������ ��� ������?";
};


func int dia_joru_joinpsi_condition()
{
	if(Npc_KnowsInfo(hero,dia_joru_greet) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_joru_joinpsi_info()
{
	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00");	//� ���� �������������� � ����� ������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01");	//�� ������ ����� ����� �� ���? ������! �������... ��, �����, � ����� ���� ������.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02");	//���� � � �� ����, �� ��� �� ��� ����� ����� ��������� ��� � ��������.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03");	//����� ��� ���� ��������� ������. �� ��� ������� � �������?
	Info_ClearChoices(dia_joru_joinpsi);
	Info_AddChoice(dia_joru_joinpsi,"���.",dia_joru_joinpsi_nein);
	Info_AddChoice(dia_joru_joinpsi,"��.",dia_joru_joinpsi_ja);
};

func void dia_joru_joinpsi_ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//��.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00");	//���� ���, �� �� ��� ��� ���� ������� ���� ���������. ��� �� ���, � ����� ������ ����.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01");	//� �������.
	AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00");	//��� '�������� ������', � � �������� ���� ���, ��� ����.
	JORU_BRINGJOINTS = LOG_RUNNING;
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"���� �������� ���� ������ ��� ��� ������� ������ ���������, ������� � ���� �������� � �������.");
	Info_ClearChoices(dia_joru_joinpsi);
};

func void dia_joru_joinpsi_nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//���.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00");	//����� ����� � ���� � ������ ���� ������� ����. ���� ������ �� ���, � ��������, ��� ���� ����� ������.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01");	//� �������.
	AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00");	//��� '�������� ������', � � �������� ���� ���, ��� ����.
	JORU_BRINGJOINTS = LOG_RUNNING;
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"���� �������� ���� ������ ��� ��� ������� ������ ���������, ������� � ����� �������� � �������.");
	Info_ClearChoices(dia_joru_joinpsi);
};


instance DIA_JORU_JOINTSRUNNING(C_INFO)
{
	npc = nov_1305_joru;
	nr = 5;
	condition = dia_joru_jointsrunning_condition;
	information = dia_joru_jointsrunning_info;
	permanent = 0;
	description = "� ���� ���� ��������. ������ ���.";
};


func int dia_joru_jointsrunning_condition()
{
	if(JORU_BRINGJOINTS == LOG_RUNNING && (Npc_HasItems(other,itmijoint_2) >= 3))
	{
		return 1;
	};
};

func void dia_joru_jointsrunning_info()
{
	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00");	//� ���� ���� ��������. ������ ���.
	AI_Output(self,other,"DIA_Joru_JointsRunning_07_01");	//������! ��������, �� ��� �������, ��� �� ���� �� ���� �� ����� � ����� �������������.
	AI_Output(self,other,"DIA_Joru_JointsRunning_07_02");	//��� ��������� � ����� ������ �����, ����� �� ������� ���������� �� ��� �����������. � ���� ���������� ����, ��� ��� �������.
	b_giveinvitems(other,self,itmijoint_2,3);
	b_logentry(CH1_JOINPSI,"� ����� �������� ����. ������ ���������, ��� �� ������ ��� ������.");
	JORU_BRINGJOINTS = LOG_SUCCESS;
	b_givexp(XP_WEEDFORJORU);
};


var int joru_tips;

instance DIA_JORU_IMPRESSGURUS(C_INFO)
{
	npc = nov_1305_joru;
	nr = 5;
	condition = dia_joru_impressgurus_condition;
	information = dia_joru_impressgurus_info;
	permanent = 1;
	description = "��� ��� ���������� ����������� �� ����?";
};


func int dia_joru_impressgurus_condition()
{
	if(JORU_BRINGJOINTS == LOG_SUCCESS && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_joru_impressgurus_info()
{
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00");	//��� ��� ���������� ����������� �� ����?
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01");	//���� ����� ������� ����������� ������������ ����� �������.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02");	//���� �� ������ �������� ��� ��������, ��������� �����.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03");	//�� ���� �� ������� ���������� �� ��� ����� �����! ����� ����� ��� �� ������ �� ����������� ��� �������� ������ �������� ����������.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04");	//���� ����� - ����, ������� � ����� � ������, ������� ������. �����, ������ ������ ������ ���� ����������� ���. �������� � ���, ����� ��� ������� �� ����� ����������.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05");	//� ������� ���� ����� ����� ����������. ������ ���������� �������� ���� � ������ �������.
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06");	//������� �� ���� ������.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07");	//��, ������ ���� ������.
	if(JORU_JOINPSI == FALSE)
	{
		b_logentry(CH1_JOINPSI,"����� ���������� ����������� �� ����� ������, � ������ ������� ��� �� ������ �� ��� ��������.");
		b_logentry(CH1_JOINPSI,"������ ����� ���������� ���, ��� �������� ������������ ����� ������, �������� � ������� �����. ������ �� ����� ������������� ��� ������ �� ����!");
		JORU_JOINPSI = TRUE;
	};
	JORU_TIPS = TRUE;
};


instance DIA_JORU_GETMAGIC(C_INFO)
{
	npc = nov_1305_joru;
	nr = 5;
	condition = dia_joru_getmagic_condition;
	information = dia_joru_getmagic_info;
	permanent = 1;
	description = "��� � ���� ����� ����� �������?";
};


func int dia_joru_getmagic_condition()
{
	if(JORU_TIPS == TRUE && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_joru_getmagic_info()
{
	AI_Output(other,self,"DIA_Joru_GetMagic_15_00");	//��� � ���� ����� ����� �������?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_01");	//���� ����� ������� ���� � ������. �� � ���� ��� ����� �� ���������� �� ������, ���� �� �� ������� � ����� �������������, �����?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_02");	//����� ����, ���� � ���� ������� �����-������ ������ ����.
	if(JORU_TIPS_MAGE == FALSE)
	{
		Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
		b_logentry(GE_TRADERPSI,"���� ����� ������� ���� � ���������� ������.");
		JORU_TIPS_MAGE = TRUE;
	};
};

