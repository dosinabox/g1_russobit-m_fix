
instance DIA_BAALTONDRAL_MUTEEXIT(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 999;
	condition = dia_baaltondral_muteexit_condition;
	information = dia_baaltondral_muteexit_info;
	permanent = 0;
	description = "(������ �� ��������)";
};


func int dia_baaltondral_muteexit_condition()
{
	if(!Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_muteexit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTONDRAL_EXIT(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 999;
	condition = dia_baaltondral_exit_condition;
	information = dia_baaltondral_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baaltondral_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltondral_muteexit) || Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTONDRAL_FANATICTEACHER(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_fanaticteacher_condition;
	information = dia_baaltondral_fanaticteacher_info;
	permanent = 0;
	important = 1;
};


func int dia_baaltondral_fanaticteacher_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_baaltondral_fanaticteacher_info()
{
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00");	//�� �� ����� �� ���, ��� ������ �������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01");	//�� ������ ����� �� ����, ��� ���� ���-��. � �����, �� ����� �������� ����. ����� �� �� ���������� � ���� �������� ������� ������� ����� ������ �����?
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02");	//� ���� � ���� ��������, ��������� ������� ������������ �������. ��� ������ �� �� �������� ������, �� ��-�� ����������, ��� ��� ��� ����!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03");	//��� ����, ����� �������� ������ ��� ����, ��� ���� �����. �� ��� �� ������ ������� ���� ��� ����� �����.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04");	//�� �� ���������� ��� ���������� � �������? ����������, ��� ������� ��� � ����? ��� ���������� ���� ���. �� ����� ���.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05");	//�� ������, ��� ����������, ���� �� ����������� ��� ��������? �� ������ ����� ������ ����! ��������� ���� � ���� ����������� �������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06");	//������� ��������. �� ������ ���� ������! �������� ����� ����������� �������, � �� ��������� ���, � �������� ������� ��������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07");	//����� ��� ����� � ���� ����� ������ ���, � ���� �� ����� ����������. �� ������� �� ����� �� ���������, �� ������� ������ � ��������. ����� ������� ������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08");	//�� ���� �������� ��� �������� ��� ������.
};


instance DIA_BAALTONDRAL_YOUTALKED(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_youtalked_condition;
	information = dia_baaltondral_youtalked_info;
	permanent = 0;
	description = "�� ��������� �� ����. ������, ������ � ����� ���������� � ����?";
};


func int dia_baaltondral_youtalked_condition()
{
	return 1;
};

func void dia_baaltondral_youtalked_info()
{
	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00");	//�� ��������� �� ����. ������, ������ � ����� ���������� � ����?
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01");	//� ����, �� ��� ����������� � ������ ���������. ��� ���������.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02");	//� ���� ������� ������� �������� ����! � �������� ���. ��������, �� ����� ����� ������ ������ � ���� ��������.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03");	//� ��������� � �����, ���� ���� ���� ���� �������� ��� ���� �����������.
};


instance DIA_BAALTONDRAL_LOYALITY(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_loyality_condition;
	information = dia_baaltondral_loyality_info;
	permanent = 0;
	description = "��� � ����� �������� ���� �����������?";
};


func int dia_baaltondral_loyality_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_youtalked) && (GETNEWGUY_DUSTY_JOINED == FALSE) && (KAPITEL < 4) && (GETNEWGUY_DUSTY_MOVING == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_loyality_info()
{
	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00");	//��� � ����� �������� ���� �����������?
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01");	//���� �������� ��������� � ����� ��������������, ��������� ������ �������.
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02");	//���� �� ������� ������ �� �������� �������������� � ���, �� ��������, ��� ���� ��������� ����� ����� ������ � �������� ����, ���������� ��������.
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"���� ������� ������ ���� � ������ ������, ����� ����� ��������, ������� ���������� �������������� � ��������. ��� �������� ����������� ��������� ��� ������������!");
	GETNEWGUY_STARTED = TRUE;
};


instance DIA_BAALTONDRAL_NEWMEMBER(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_newmember_condition;
	information = dia_baaltondral_newmember_info;
	permanent = 0;
	description = "� ��� � ����� ����� ������ ��������?";
};


func int dia_baaltondral_newmember_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_newmember_info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00");	//� ��� � ����� ����� ������ ��������?
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01");	//� ������ ������ �� ������� ����� ���, ��� ���������� ������� ���� ����. ��, ��� ��� �����, ������ ��� ��� � ������. ��� �� ��������� �� ��������� ���������.
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02");	//� ����� ������ ���� �� ������ ���������� ���� �������� ������. � �����, ��� �� �� ������� ������ �������.
};


instance DIA_BAALTONDRAL_NEWMEMBER2(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_newmember2_condition;
	information = dia_baaltondral_newmember2_info;
	permanent = 0;
	description = "����� �������� ����� ����?";
};


func int dia_baaltondral_newmember2_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_newmember2_info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00");	//����� �������� ����� ����?
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01");	//� ����� �� ������� ������ ������� ������ ������� ��������.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02");	//����� �� ���������� � ������ ��� �������� ����, ��� ����� ���� ������, ���� �������� ����.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03");	//������� �� ������� ������� ���������, �� ����� ������� �� ��������� ���� �����. ��� ����� ��� ����������� ����� ����� �����.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04");	//���� �� ������� ������ ������, ��� �� ������� ����� ������. ������ �� ������� ����� ������ �������.
};


instance DIA_BAALTONDRAL_DUSTYSUCCESS(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_dustysuccess_condition;
	information = dia_baaltondral_dustysuccess_info;
	permanent = 0;
	description = "C� ���� ������ �������, ������� ����� ������������� � �����.";
};


func int dia_baaltondral_dustysuccess_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_baaltondral_youtalked) && (Npc_GetDistToWP(dusty,"PSI_PLATFORM_1") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void dia_baaltondral_dustysuccess_info()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00");	//�������, �� ���� ������ �������, ������� ����� ������������� � �����.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01");	//��� ��� � �����? �� �������?
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02");	//��� ����� �������� �����������, �������.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03");	//������. � ����� ��� �� ����� ���� ��������.
	AI_TurnToNPC(self,dusty);
	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04");	//�� ������ ������ ��������� �� ��� ������ ���� � ������� ���� ������. � ��� ���� ������ ���� ����.
	b_logentry(CH1_RECRUITDUSTY,"����� ���� �������� ����� ��������. � �������� ���� �������.");
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_SUCCESS);
	b_givexp(XP_DELIVEREDDUSTY);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};

instance DIA_BAALTONDRAL_SENDTOKALOM(C_INFO)
{
	npc = gur_1203_baaltondral;
	nr = 1;
	condition = dia_baaltondral_sendtokalom_condition;
	information = dia_baaltondral_sendtokalom_info;
	permanent = 0;
	description = "�������! � ���� �������� � ��������. ������ ���.";
};


func int dia_baaltondral_sendtokalom_condition()
{
	if((Npc_KnowsInfo(hero,dia_baaltondral_dustysuccess) || Npc_KnowsInfo(hero,dia_melvin_metdusty2)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && Npc_KnowsInfo(hero,dia_baaltondral_youtalked))
	{
		return 1;
	};
};

func void dia_baaltondral_sendtokalom_info()
{
	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00");	//�������! � ���� �������� � ��������. ������ ���.
	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01");	//�� ������� ��� ���� �����������. ��� � ��� ������. �� ���� ���� ������� ����������.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"� ������ ������ �������� � ������ ���������. ������ ���� ������� ������� ���� ��������� ������ ������ ����������!");
};

