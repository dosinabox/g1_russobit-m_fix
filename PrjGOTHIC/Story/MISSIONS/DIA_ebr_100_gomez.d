
instance DIA_GOMEZ_EXIT(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 999;
	condition = dia_gomez_exit_condition;
	information = dia_gomez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gomez_exit_condition()
{
	return 1;
};

func void dia_gomez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_FAULT(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_fault_condition;
	information = dia_gomez_fault_info;
	permanent = 0;
	description = "� ������ ���������� ���� ������.";
};


func int dia_gomez_fault_condition()
{
	if(!Npc_KnowsInfo(hero,dia_raven_there))
	{
		return 1;
	};
};

func void dia_gomez_fault_info()
{
	AI_Output(other,self,"DIA_Gomez_Fault_15_00");	//� ������ ���������� ���� ������.
	AI_Output(self,other,"DIA_Gomez_Fault_11_01");	//�� ���������� ���� � �������, ��� � ����� ������� ����, ������?! ������!
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


var int gomez_kontakte;

instance DIA_GOMEZ_HELLO(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_hello_condition;
	information = dia_gomez_hello_info;
	permanent = 1;
	description = "� ������, ����� ���������� ���� ������.";
};


func int dia_gomez_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_there) && (GOMEZ_KONTAKTE < 4))
	{
		return 1;
	};
};

func void dia_gomez_hello_info()
{
	AI_Output(other,self,"DIA_Gomez_Hello_15_00");	//� ������, ����� ���������� ���� ������.
	AI_Output(self,other,"DIA_Gomez_Hello_11_01");	//� ���� �� ����, ��� ��� ����� ���� ������?
	Info_ClearChoices(dia_gomez_hello);
	Info_AddChoice(dia_gomez_hello,"�������, ��� �� �������� ������� ��� ������...",dia_gomez_hello_kopfab);
	Info_AddChoice(dia_gomez_hello,"�� ����� ���� �������, ������� �� ����� ��������.",dia_gomez_hello_spinner);
	Info_AddChoice(dia_gomez_hello,"� ����� �������������, � � ���� ����� �������� � ������ �������.",dia_gomez_hello_kontakte);
	Info_AddChoice(dia_gomez_hello,"� ������ ���������, � ����� ������, ��� � ���� ���� �������.",dia_gomez_hello_thorussays);
};

func void dia_gomez_hello_thorussays()
{
	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00");	//� ������ ���������, � ����� ������, ��� � ���� ���� �������.
	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01");	//�������, ���� �� ��� ���� �� ���, �� ��� ��� �� �����. �� � �������, ��� �� �������� �� �������.
};

func void dia_gomez_hello_kontakte()
{
	GOMEZ_KONTAKTE = 0;
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00");	//� ����� ������������� �� ������� � � ���� ����� �������� � ������ �������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01");	//��, ������� ������. � � ��� �� �� ��� ������?
	Info_ClearChoices(dia_gomez_hello);
	Info_AddChoice(dia_gomez_hello,"��� ����� ����������� ����.",dia_gomez_hello_kontakte_thatsall);
	Info_AddChoice(dia_gomez_hello,"��������� ������� �� ������ ������.",dia_gomez_hello_kontakte_nlhehler);
	Info_AddChoice(dia_gomez_hello,"����.",dia_gomez_hello_kontakte_lares);
	Info_AddChoice(dia_gomez_hello,"���� ������ �� ��������.",dia_gomez_hello_kontakte_baals);
	Info_AddChoice(dia_gomez_hello,"��� �����.",dia_gomez_hello_kontakte_kalom);
	if(GOMEZ_KONTAKTE < 3)
	{
		Info_AddChoice(dia_gomez_hello,"�������.",dia_gomez_hello_kontakte_yberion);
	};
};

func void dia_gomez_hello_spinner()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00");	//�� ����� ���� �������, ������� �� ����� �������� � ��� ��� �����, ��� ��� ������������� ��� �� ����� ��������.
	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01");	//����� ����, ����� ���, ��� �� ������, ������. �� � ��� ��� �� �������, ����� ��� �������� �� ������ ���������� �������.
};

func void dia_gomez_hello_kopfab()
{
	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00");	//�������, ��� �� �������� ������� ��� ������ � �������������� ����� ������ ������� �������.
	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01");	//���������. � ���� ���������� �������� � ���������.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_gomez_hello_kontakte_yberion()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00");	//�������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01");	//������� ���� �� ���� �� ����� � ����� ����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02");	//�� ����� ���. �������, ���� ��� ������ ��������?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03");	//��� �� ����� ���� ���. �� ����������� ����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04");	//� � �������� �������������.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_gomez_hello_kontakte_kalom()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00");	//��� �����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01");	//�?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_baals()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00");	//���� ������ �� ��������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01");	//�?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_lares()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00");	//����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01");	//�?
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_nlhehler()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00");	//��������� ������� �� ������ ������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01");	//���.
	GOMEZ_KONTAKTE = GOMEZ_KONTAKTE + 1;
};

func void dia_gomez_hello_kontakte_thatsall()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00");	//��� ����� ����������� ����.
	if(GOMEZ_KONTAKTE >= 4)
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01");	//������� ��� ������ ������� ��� ��...
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02");	//��� �, ����� ���� � ��� ���� ����.
		Info_ClearChoices(dia_gomez_hello);
	}
	else
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00");	//� �� ������ ���� ���� �������? � ����� ������ ���� � ��������� ��������� ����� �������, ��� � ����.
		Info_ClearChoices(dia_gomez_hello);
	};
};


instance DIA_GOMEZ_DABEI(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_dabei_condition;
	information = dia_gomez_dabei_info;
	permanent = 0;
	description = "��� ������, ��� � ������?";
};


func int dia_gomez_dabei_condition()
{
	if((GOMEZ_KONTAKTE >= 3) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_gomez_dabei_info()
{
	AI_Output(other,self,"DIA_Gomez_Dabei_15_00");	//��� ������, ��� � ������?
	AI_Output(self,other,"DIA_Gomez_Dabei_11_01");	//�� ����. ������ �� ���� �� ���.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_02");	//��� � ������. �� ��� ���� ���������.
	Npc_SetTrueGuild(hero,GIL_STT);
	hero.guild = GIL_STT;
	b_givexp(XP_BECOMESHADOW);
	b_logentry(CH1_JOINOC,"� ������������ ��� � ������� �� ������ �� ������� ������. ����� ��������� ���, ��� ����� ������.");
	Log_SetTopicStatus(CH1_JOINOC,LOG_SUCCESS);
	Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINNC,LOG_FAILED);
	b_logentry(CH1_JOINNC,"� ���� ����� �� ����� ������, ������� � ����� ����� ��� ���� �������.");
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_FAILED);
	b_logentry(CH1_JOINPSI,"������ ������ ������ ���� ���� �����. �������� ������� ������ �������� ��� ����.");
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"� ������� � ������ ������ � ������ ��������� ������� ����� �������� ����� ���� ���������.");
	LOG_THORUSTRAIN = TRUE;
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		b_logentry(CH1_DELIVERWEED,"� ������ ������� � ������ �� ���� ���� �� ���������� � ���� �������� ���������. �����, � ��� � ��� ���� ��������, ���� ������� ���� � ������.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
		BAALORUN_FETCHWEED = LOG_FAILED;
	};
	if(GETNEWGUY_STARTED == TRUE)
	{
		b_logentry(CH1_RECRUITDUSTY,"������ �������� ���� ���� ���������, ������� ��������� �� �������. � �� ������ ������ �������� �������� ������� ������.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(KIRGO_CHARGED == TRUE && KIRGO_CHARGED_END == FALSE)
	{
		KIRGO_CHARGED = FALSE;
		b_exchangeroutine(grd_251_kirgo,"START");
	};
	if(KHARIM_CHARGED == TRUE && KHARIM_CHARGED_END == FALSE)
	{
		KHARIM_CHARGED = FALSE;
		b_exchangeroutine(sld_729_kharim,"START");
	};
	b_exchangeroutine(tpl_1422_gorhanis,"START");
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_NURSO(C_INFO)
{
	npc = ebr_100_gomez;
	nr = 1;
	condition = dia_gomez_nurso_condition;
	information = dia_gomez_nurso_info;
	permanent = 1;
	description = "� ����� ���� ����� ��������, ��� ��������.";
};


func int dia_gomez_nurso_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_gomez_nurso_info()
{
	AI_Output(other,self,"DIA_Gomez_NurSo_15_00");	//� ����� ���� ����� ��������, ��� ��������.
	AI_Output(self,other,"DIA_Gomez_NurSo_11_00");	//��� � �������� � �������. � ������� �� ������ ���� ��� ����������!
	AI_StopProcessInfos(self);
};


instance DIA_EBR_100_GOMEZ_WAIT4SC(C_INFO)
{
	npc = ebr_100_gomez;
	condition = dia_ebr_100_gomez_wait4sc_condition;
	information = dia_ebr_100_gomez_wait4sc_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_100_gomez_wait4sc_condition()
{
	if(EXPLORESUNKENTOWER && (Npc_GetDistToNpc(hero,self) < 500))
	{
		return TRUE;
	};
};

func void dia_ebr_100_gomez_wait4sc_info()
{
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01");	//��� �� ���� �����?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02");	//������! � �� �� �� ���� ���� ����� � ��������� �����?
	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03");	//�� ������ ����� ����� �����������. � ������ ������� �� �� ����� �������.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04");	//� �� ����, ���� ������ �� ����, �������, ������������� ����� �����. �� ��� ����� ����� ���� ���������� �����.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05");	//� ����� ��������, ����� �� ������ ����� �� ���� ��������� ���� ������.
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

