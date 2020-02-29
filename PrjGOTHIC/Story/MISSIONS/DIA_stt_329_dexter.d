
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = stt_329_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return 1;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_FIRST(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_first_condition;
	information = dia_dexter_first_info;
	permanent = 0;
	important = 1;
};


func int dia_dexter_first_condition()
{
	return 1;
};

func void dia_dexter_first_info()
{
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00");	//��, ��! � ������ �������� � �������� �� ������ ���������. ���-������ ������ ������?
};


instance DIA_DEXTER_KRAUT(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_kraut_condition;
	information = dia_dexter_kraut_info;
	permanent = 0;
	description = "��� ����� ��������?";
};


func int dia_dexter_kraut_condition()
{
	return 1;
};

func void dia_dexter_kraut_info()
{
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00");	//��� ����� ��������?
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01");	//���������, ��? ����������� �� ��� ����� ��������, ����� ������������.
};


instance DIA_DEXTER_TRADE(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_trade_condition;
	information = dia_dexter_trade_info;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int dia_dexter_trade_condition()
{
	return 1;
};

func void dia_dexter_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_Dexter_Trade_10_01");	//� ���� ��� ����� ������...
	if(DEXTER_TRADED == FALSE)
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"������� ������� �� �������� ������� ������� �������� � ����� �� ������ ���������.");
		DEXTER_TRADED = TRUE;
	};
};

instance DIA_DEXTER_JOINOC(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_joinoc_condition;
	information = dia_dexter_joinoc_info;
	permanent = 0;
	description = "� ���� �������������� � ������. ���� ����� ���������.";
};


func int dia_dexter_joinoc_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_dexter_joinoc_info()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00");	//� ���� �������������� � ������. ���� ����� ���������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01");	//��? ������ ��������, ��� �� ����-�� ������?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02");	//��, ������. ������ ������ ���. ���� �������� ��� ��� ����, � �������� � �����.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03");	//��� �� ������ �� ����?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04");	//� ������ ��������� ���� ���� ��� - �����. ������ ������ - ���� �� ����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05");	//�� �������. � � ���� ���� ������ ����� ������������ ��������� ��������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06");	//���� � ���� ����� ���� ������, � ����� �������� ����� �� �������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07");	//�� � ������ ������ ��� �� �����������.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08");	//� ��� � ������ �������?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09");	//�������� ��������� ��������� ����� ����� ����. �� ����� ��������� � ���� ����� ����� ������������, ��� �� ������ �������������� � ���.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10");	//����� - ���� �� ����, � ������ �� ���������� ��������. ����� ����������� � ���, �������� �������� ������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11");	//��� �� ��� �������� ��� ��� �����. ������ ������ ��� ��� �������.
	Info_ClearChoices(dia_dexter_joinoc);
	Info_AddChoice(dia_dexter_joinoc,"�����, � �������� ��� �������.",dia_dexter_joinoc_ok);
	Info_AddChoice(dia_dexter_joinoc,"��� �������, ��� �� ��� �� ������. ��� � �� ��� ������?",dia_dexter_joinoc_howmuch);
};

func void dia_dexter_joinoc_ok()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00");	//�����, � �������� ��� �������.
	DEXTER_GETKALOMSRECIPE = LOG_RUNNING;
	Log_CreateTopic(CH1_KALOMSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_RUNNING);
	b_logentry(CH1_KALOMSRECIPE,"������� ������� � �������� ������� ������� ��� ������� ������ ���� ��� ������ �� ������ ���������.");
	b_logentry(CH1_KALOMSRECIPE,"������� ����������� ��� ������� ���, ����� � ���� �������������� � ���.");
	Info_ClearChoices(dia_dexter_joinoc);
};

func void dia_dexter_joinoc_howmuch()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00");	//��� �������, ��� �� ��� �� ������. ��� � �� ��� ������?
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01");	//����� �� �������� �������������� � ������, ����� ������� � ����. ������, ��� � ��� �����?
	Info_AddChoice(dia_dexter_joinoc,"����� ����, �������� ��������� �� ������. �� ���� 50 ������ ����.",dia_dexter_joinoc_advance);
};

func void dia_dexter_joinoc_advance()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00");	//����� ����, ��� �������� ��������� �� ���� ������. �� ������ ���� ��� 50 ������ ����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01");	//���� �� ����� �� ����.
	Info_AddChoice(dia_dexter_joinoc,"��� ���� - ��� �������!",dia_dexter_joinoc_threat);
};

func void dia_dexter_joinoc_threat()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00");	//��� ���� - ��� �������!
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01");	//�����! ������! ����� ������ ����� � ����, ����� � ��������� � ����.
	Info_AddChoice(dia_dexter_joinoc,"���! � ���� �������� ���� ������, ��� �� ������� �� ��� ���.",dia_dexter_joinoc_orenoworelse);
};

func void dia_dexter_joinoc_orenoworelse()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00");	//���! � ���� �������� ���� ������, ��� �� ������� �� ��� ���.
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01");	//������, ����� ����� � ������ ���������. ��� ���... ������ � ��� ������ ����-������ �������...
	Info_AddChoice(dia_dexter_joinoc,"�����! ����� ������ ������� �� ����.",dia_dexter_joinoc_forgetit);
};

func void dia_dexter_joinoc_forgetit()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00");	//�����! ����� ������ ������� �� ����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01");	//������! �� ��� ������! � ����� ���� ���������� �����... 50 ������ - ��� �� ������� ����� ��� ����������.
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02");	//������ ������� �����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03");	//��, ��, ������! � ���� �������� ������ 50 ������ ��� ����. ������ �� ������� ����, �������!
	DEXTER_GETKALOMSRECIPE = LOG_RUNNING;
	Log_CreateTopic(CH1_KALOMSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_RUNNING);
	b_logentry(CH1_KALOMSRECIPE,"������� ������� � �������� ������� ������� ��� ������� ������ ���� ��� ������ �� ������ ���������.");
	b_logentry(CH1_KALOMSRECIPE,"������� �����, ����� � ����� � ������ ��������� � ������ ���, ����� ���� �������������� � ���.");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,other,itminugget,50);
	DEXTER_ORE_PREPAID = 1;
	Info_ClearChoices(dia_dexter_joinoc);
};


var int dexter_psicamp;

instance DIA_DEXTER_WHEREST(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_wherest_condition;
	information = dia_dexter_wherest_info;
	permanent = 0;
	description = "��� ��������� ������ ���������?";
};


func int dia_dexter_wherest_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_dexter_wherest_info()
{
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00");	//��� ��������� ������ ���������?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01");	//�������� �� ������ ����� ����� ������ � ����� �� ������. ���� �� �������� �� �����.
	if(Npc_HasItems(self,itwrworldmap) > 0)
	{
		AI_Output(self,other,"DIA_Dexter_WhereST_10_02");	//������? ������ ������ �� � ���� ����� �� 50 ������ ����...
	};
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02");	//����� ������ - ��� ���, ��� ����������� �����?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03");	//�����.
	if(!DEXTER_PSICAMP)
	{
		b_logentry(CH1_KALOMSRECIPE,"������ ��������� ��������� � ������� �� ������� ������.");
		DEXTER_PSICAMP = TRUE;
	};
};


instance DIA_DEXTER_KALOMSRECIPESUCCESS(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_kalomsrecipesuccess_condition;
	information = dia_dexter_kalomsrecipesuccess_info;
	permanent = 1;
	description = "� ���� ���� ������, ������� �� ������!";
};


func int dia_dexter_kalomsrecipesuccess_condition()
{
	if((DEXTER_GETKALOMSRECIPE == LOG_RUNNING) && (Npc_HasItems(other,kalomsrecipe) > 0))
	{
		return 1;
	};
};

func void dia_dexter_kalomsrecipesuccess_info()
{
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00");	//� ���� ���� ������, ������� �� ������!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01");	//�������! ������ ��� ���!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02");	//������ � ��� ����� �������� ����� �������.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03");	//�� ������ ��� ����! � ����� �� ���� �����!
	if(DEXTER_ORE_PREPAID != 1)
	{
		AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04");	//���, ��� ����... �� ������...
		CreateInvItems(other,itminugget,50);
		b_giveinvitems(self,other,itminugget,50);
	};
	b_giveinvitems(other,self,kalomsrecipe,1);
	Npc_RemoveInvItem(self,kalomsrecipe);
	DEXTER_GETKALOMSRECIPE = LOG_SUCCESS;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_SUCCESS);
		b_logentry(CH1_KALOMSRECIPE,"������� ��� �������. ������ � ���� ���� ������ � ��� ���������.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_SUCCESS);
		b_logentry(CH1_KALOMSRECIPE,"������� ��� �������. �� ��� ������ ��� ��� �� ���������.");
	};
	b_givexp(XP_DEXTERKALOM);
};

