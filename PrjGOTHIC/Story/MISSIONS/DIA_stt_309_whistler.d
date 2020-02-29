
instance DIA_WHISTLER_EXIT(C_INFO)
{
	npc = stt_309_whistler;
	nr = 999;
	condition = dia_whistler_exit_condition;
	information = dia_whistler_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_whistler_exit_condition()
{
	return 1;
};

func void dia_whistler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WHISTLER_IAMNEW(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_iamnew_condition;
	information = dia_whistler_iamnew_info;
	permanent = 0;
	description = "������! � ����� �����!";
};


func int dia_whistler_iamnew_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_whistler_iamnew_info()
{
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00");	//������! � ����� �����!
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01");	//��� ���� �� ���� �����?
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02");	//� ���� ����� ����� �� ���, ���� �������������� � ����� ������.
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03");	//����� ����, ��� ���� �� ���� ����������?
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04");	//���� �� ������, ����� � �������������� ���� �����, �� ������ ������ ������� ��� ���� ������.
};


var int whistler_buymysword;
var int whistler_buymysword_day;

instance DIA_WHISTLER_FAVOUR(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_favour_condition;
	information = dia_whistler_favour_info;
	permanent = 0;
	description = "��� � ���� ���� ������?";
};


func int dia_whistler_favour_condition()
{
	if(Npc_KnowsInfo(hero,dia_whistler_iamnew))
	{
		return 1;
	};
};

func void dia_whistler_favour_info()
{
	AI_Output(other,self,"DIA_Whistler_Favour_15_00");	//��� � ���� ���� ������?
	AI_Output(self,other,"DIA_Whistler_Favour_11_01");	//��� ����� ���, ������� ������� ����. �� �������� �� �������� �������.
	AI_Output(self,other,"DIA_Whistler_Favour_11_02");	//��� �������� �����, ���������� ������� � �����������. ������ �� ��� ��� �� �������.
	AI_Output(self,other,"DIA_Whistler_Favour_11_03");	//� ���� ��� ��� ������ ����, � �� ������ ��� ��� ����. ������ �� ������ ���, ��� �� ������ �� ����.
	Info_ClearChoices(dia_whistler_favour);
	Info_AddChoice(dia_whistler_favour,"������, ����� ��� ������. � ������� ���� ���.",dia_whistler_favour_ok);
	Info_AddChoice(dia_whistler_favour,"� �� ��� ������? � �����, � ������ ��� ���� � �����?",dia_whistler_favour_oreaway);
	Info_AddChoice(dia_whistler_favour,"������ �� �� �� ����� ������� ���� ���� ���?",dia_whistler_favour_whynotsell);
};

func void dia_whistler_favour_ok()
{
	var C_NPC fisk;
	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00");	//������, ����� ��� ������. � ������� ���� ���.
	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01");	//��� ����. ��� ������ ��������� ���, ������� �� ���.
	WHISTLER_BUYMYSWORD = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	};
	b_logentry(CH1_JOINOC,"������� ��������� ����, ���� � ����� ��� ���� ��� � �����. ��� ����� �� ��� ��� 100 ������ ����.");
	fisk = Hlp_GetNpc(stt_311_fisk);
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
	WHISTLER_BUYMYSWORD_DAY = Wld_GetDay();
	Info_ClearChoices(dia_whistler_favour);
};

func void dia_whistler_favour_oreaway()
{
	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00");	//� �� ��� ������? � �����, � ������ ��� ���� � �����?
	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01");	//�� �������: ������� ���������. �� ������� ���� � ���� �����, ��� ����� �����!
};

func void dia_whistler_favour_whynotsell()
{
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00");	//������ �� �� �� ����� ������� ���� ���� ���?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01");	//��, �� � ��� ������� �����������.
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02");	//� ���?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03");	//� ��, ��� ���� ��� ����� ������ �������������!
};


instance DIA_WHISTLER_RUNNING110(C_INFO)
{
	npc = stt_309_whistler;
	nr = 4;
	condition = dia_whistler_running110_condition;
	information = dia_whistler_running110_info;
	permanent = 0;
	description = "���� ������� ����. ��� ����� ��� ������ ������.";
};


func int dia_whistler_running110_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (FISK_SCKNOWS110 == TRUE))
	{
		return 1;
	};
};

func void dia_whistler_running110_info()
{
	AI_Output(other,self,"DIA_Whistler_Running110_15_00");	//���� ������� ����. ��� ����� ��� ������ ������.
	AI_Output(self,other,"DIA_Whistler_Running110_11_01");	//� ������ �� ������, ����� � ������� ���� ��� ������ ������?
	AI_Output(other,self,"DIA_Whistler_Running110_15_02");	//� �-�� �����, ���� ���� ��� ������������� �����.
	AI_Output(self,other,"DIA_Whistler_Running110_11_03");	//���, ������ � ����������!
	CreateInvItems(self,itminugget,10);
	b_giveinvitems(self,hero,itminugget,10);
};


instance DIA_WHISTLER_RUNNINGPAYBACK(C_INFO)
{
	npc = stt_309_whistler;
	nr = 5;
	condition = dia_whistler_runningpayback_condition;
	information = dia_whistler_runningpayback_info;
	permanent = 1;
	description = "� �� ���� ������ ���. ��� ���� ���� ����� ������.";
};


func int dia_whistler_runningpayback_condition()
{
	if(WHISTLER_BUYMYSWORD == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_whistler_runningpayback_info()
{
	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00");	//� �� ���� ������ ���. ��� ���� ���� ����� ������.
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01");	//�����! ����� � ��� � ��� ���� �������! ��������!
		b_giveinvitems(hero,self,itminugget,100);
		WHISTLER_BUYMYSWORD = LOG_OBSOLETE;
		b_logentry(CH1_JOINOC,"� ��� ��������. ������ �������� ������� �� ������ ������ ����.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02");	//��� �� ����� ������ ��� ������? ������� ��� ����, ����� � ���� ����� ������������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_WHISTLER_MYSWORD_TOOLATE(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_mysword_toolate_condition;
	information = dia_whistler_mysword_toolate_info;
	permanent = 0;
	important = 1;
};


func int dia_whistler_mysword_toolate_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY <= (Wld_GetDay() - 2)))
	{
		return 1;
	};
};

func void dia_whistler_mysword_toolate_info()
{
	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00");	//�, ��� �� ���! ����� ������� ��� ����, ��? ��-��, ��� ����!
	WHISTLER_BUYMYSWORD = LOG_FAILED;
	b_logentry(CH1_JOINOC,"� ��� ��������. ������� ��������� �� ����.");
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_ANGRY);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance DIA_WHISTLER_MYSWORD_SUCCESS(C_INFO)
{
	npc = stt_309_whistler;
	nr = 800;
	condition = dia_whistler_mysword_success_condition;
	information = dia_whistler_mysword_success_info;
	permanent = 1;
	description = "� ������ ���� ���...";
};


func int dia_whistler_mysword_success_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY > (Wld_GetDay() - 2)) && (Npc_HasItems(other,whistlers_schwert) >= 1))
	{
		return 1;
	};
};

func void dia_whistler_mysword_success_info()
{
	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00");	//� ������ ���� ���...
	b_giveinvitems(other,self,whistlers_schwert,1);
	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01");	//��, ���� ��� ���� ������ ��������, ��? �����, ��� � � �������, � ������ ����.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02");	//���� ����� ������� ���� � ����, � �����, ��� ���� ����� ��������. �� �������!
		b_logentry(CH1_JOINOC,"� ������ ��� ��� ��������. �� ������� �������. ������ �� ��������� ����, ���� � ������ �������� � ������.");
	}
	else
	{
		b_logentry(CH1_JOINOC,"������� ��� ������� ���, ��� � ������ ��� ���. ����, �� ��� ��� ������ �� ����������. � ������ �� ���� ����� ���������.");
	};
	WHISTLER_BUYMYSWORD = LOG_SUCCESS;
	b_givexp(XP_WHISTLERSSWORD);
	AI_StopProcessInfos(self);
};


instance DIA_WHISTLER_STANDARDKAP1(C_INFO)
{
	npc = stt_309_whistler;
	nr = 800;
	condition = dia_whistler_standardkap1_condition;
	information = dia_whistler_standardkap1_info;
	permanent = 1;
	description = "��� ����?";
};


func int dia_whistler_standardkap1_condition()
{
	if(WHISTLER_BUYMYSWORD == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_whistler_standardkap1_info()
{
	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01");	//������! �� ����� ��� - � ������ ����. � ����� �����, ��� ���� ����� ��������.
};

