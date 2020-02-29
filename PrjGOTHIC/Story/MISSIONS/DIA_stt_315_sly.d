
instance DIA_STT_315_SLY_EXIT(C_INFO)
{
	npc = stt_315_sly;
	nr = 999;
	condition = dia_stt_315_sly_exit_condition;
	information = dia_stt_315_sly_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_stt_315_sly_exit_condition()
{
	return 1;
};

func void dia_stt_315_sly_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_SLY(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_sly_condition;
	information = dia_stt_315_sly_info;
	important = 1;
	permanent = 0;
};


func int dia_stt_315_sly_condition()
{
	return 1;
};

func void dia_stt_315_sly_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"DIA_STT_315_Sly_10_01");	//� ���� ������ �� �����. �� ���� ���������, �� ��� ��?
	AI_Output(self,other,"DIA_STT_315_Sly_10_02");	//� ����. ��������� ��������� ������.
};


var int sly_lostnek;

instance DIA_STT_315_LOSTNEK(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_lostnek_condition;
	information = dia_stt_315_lostnek_info;
	permanent = 1;
	description = "�� ������ ���������� ��� ������? �����?";
};


func int dia_stt_315_lostnek_condition()
{
	if(SLY_LOSTNEK != LOG_RUNNING && SLY_LOSTNEK != LOG_SUCCESS && SLY_LOSTNEK != LOG_FAILED)
	{
		return 1;
	};
};

func void dia_stt_315_lostnek_info()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_15_00");	//�� ������ ���������� ��� ������? �����?
	AI_Output(self,other,"DIA_STT_315_LostNek_10_01");	//������ ���� �� ���������� - ���! ��������, �� ���� � ����� ������.
	AI_Output(self,other,"DIA_STT_315_LostNek_10_02");	//�� ��������� �����, �� ��������� ����������. ������ �� ������������, ����������.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_STT_315_LostNek_10_03");	//� ������� ���, ��� � �������� �������� �� ���� � ������.
	};
	Info_ClearChoices(dia_stt_315_lostnek);
	Info_AddChoice(dia_stt_315_lostnek,"�����, �����...",dia_stt_315_lostnek_later);
	Info_AddChoice(dia_stt_315_lostnek,"� �������� ����� ����.",dia_stt_315_lostnek_doit);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Info_AddChoice(dia_stt_315_lostnek,"� ��� ��� ��� ���� �����-�� ��� ��������?",dia_stt_315_lostnek_why);
	};
};

func void dia_stt_315_lostnek_later()
{
	AI_Output(other,self,"DIA_Lefty_First_Later_15_00");	//�����, �����...
	AI_StopProcessInfos(self);
};

func void dia_stt_315_lostnek_why()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_Why_15_00");	//� ��� ��� ��� ���� �����-�� ��� ��������?
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_01");	//���� ������ �������������� � ������ ������, �� ��� ������ ���� ���� ���������� ���������� ����� �����.
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_02");	//���� ������ ����� �����, ���� � �������� � �����.
};

func void dia_stt_315_lostnek_doit()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_00");	//� �������� ����� ����.
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_01");	//��������� � ��� ��������. ����� ������������ ����, �� ������������ ��� �����.
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_02");	//��� � ���� ��� �����?
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_03");	//����� �����.
	SLY_LOSTNEK = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"������� ���� �������� ��� ��������� �� ���� ��������, ���� � ����� ����. �� ������, ��� ���� �������� ��������� � ����� ������. �� ����������� ��� ����������� ��������, ������� ������ �� �������� ����� �����.");
	}
	else
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"������� ���� �������� ���� ����� ��������� ����. �� ������, ��� ��� ������ � ����� ������. �� ����������� ��� ���������� � ���������, ������� ������ �� �������� ����� �����.");
	};
	Info_ClearChoices(dia_stt_315_lostnek);
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_LOSTNEKSUCCESS(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_lostneksuccess_condition;
	information = dia_stt_315_lostneksuccess_info;
	permanent = 1;
	description = "� ����� ����.";
};


func int dia_stt_315_lostneksuccess_condition()
{
	if((SLY_LOSTNEK == LOG_RUNNING) && (Npc_HasItems(other,neks_amulett) > 0))
	{
		return 1;
	};
};

func void dia_stt_315_lostneksuccess_info()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_15_00");	//� ����� ����.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_10_01");	//������! � �������� ������?
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	Info_AddChoice(dia_stt_315_lostneksuccess,"���, �� ����.",dia_stt_315_lostneksuccess_noproof);
	Info_AddChoice(dia_stt_315_lostneksuccess,"��, �� ��� ��� ������. ��� ��.",dia_stt_315_lostneksuccess_proof);
};

func void dia_stt_315_lostneksuccess_proof()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_Proof_15_00");	//��, �� ��� ��� ������. ��� ��.
	b_printtrademsg1("����� ������ ������� ���������.");
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_01");	//������. ��-�� ����-�� ��� � ��������. � �� ��������� ������.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_02");	//������, �� ����� �������� ������ ����, �� �� ��������� ������, ��� ����� ���.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_03");	//���� ����� ����� ��������� ��� ������, �� � ���� �� ����.
	};
	SLY_LOSTNEK = LOG_SUCCESS;
	b_giveinvitems(other,self,neks_amulett,1);
	Log_SetTopicStatus(CH1_LOSTNEK,LOG_SUCCESS);
	b_logentry(CH1_LOSTNEK,"� ����� ���� ������ ����. �� ��� ������� ���� ���������.");
	b_givexp(XP_SLYSEARCHFORNEK);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
		b_logentry(CH1_JOINOC,"� ������� ���� ������ ����. �� ��������� � ����� � �������� �� ���� ��������.");
	}
	else
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
		b_logentry(CH1_JOINOC,"� ����� ���� ������ ����. �� ��� ��� ��� ����� ������ �� ����, ���� � ������ �� ����� �������� � ������ ������.");
	};
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	AI_StopProcessInfos(self);
};

func void dia_stt_315_lostneksuccess_noproof()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_00");	//���, �� ����.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_01");	//�����? �� ������? � ���� ��� ���� ������...
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_02");	//�� �����, ����� ��� ���� � ����� �����. ����� ���� ������, �� ������ ���� � ����!
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_03");	//�� ������ ������� � ���, ��� � ����� ������.
	b_logentry(CH1_LOSTNEK,"���� ����� �������� ������ ���� � �������� ��������������.");
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_SLY_AFTERSUCCESS(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_sly_aftersuccess_condition;
	information = dia_stt_315_sly_aftersuccess_info;
	permanent = 1;
	description = "��� � ���� ����?";
};


func int dia_stt_315_sly_aftersuccess_condition()
{
	if((KAPITEL == 1) && (SLY_LOSTNEK == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_stt_315_sly_aftersuccess_info()
{
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_01");	//��� ������! � �� ����, ��� ��� ������ �� ����������� �� ������ �����!
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_02");	//������ �� ������, ��� ������?
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_03");	//��, ��� ������.
};

