
instance DIA_MELVIN_EXIT(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 999;
	condition = dia_melvin_exit_condition;
	information = dia_melvin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_melvin_exit_condition()
{
	return 1;
};

func void dia_melvin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELVIN_HELLO(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_hello_condition;
	information = dia_melvin_hello_info;
	permanent = 0;
	description = "������! �� �� ����� �� ����������. �� �� ����� ������?";
};


func int dia_melvin_hello_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_melvin_hello_info()
{
	AI_Output(other,self,"DIA_Melvin_Hello_15_00");	//������! �� �� ����� �� ����������. �� �� ����� ������?
	AI_Output(self,other,"DIA_Melvin_Hello_03_01");	//��! ������ ������ � ��� ���, ��� � ������� ������ ������. � ��������� ����� ����� ����� ����� �� ����, �� ������������ � ������, ��� �������� ��� �������.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"������� ������ ������������� � ��������. ��� ���� ����� ������� � ������ ������. �� �� ��������� ������ � ���, ����� ���� ���� � �������� ������.");
};


instance DIA_MELVIN_METDUSTY(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_metdusty_condition;
	information = dia_melvin_metdusty_info;
	permanent = 0;
	description = "� ���� �����. ������������ � ��� ������ �������.";
};


func int dia_melvin_metdusty_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_melvin_hello) && (Npc_GetDistToWP(dusty,"PSI_12_HUT_EX_TEACH2") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,dia_dusty_hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty_info()
{
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00");	//� ���� �����. ������������ � ��� ������ �������.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01");	//���� �� ������� ���, �������, ��� �� ��� ������� ���. ����� �� ������� �����, ��� � ������ ������, ��� ��������� ���������� ��� ������� ����������. �������, ��� ���� ����� ����������.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02");	//��, ���� �����, �������, �������.
};

instance DIA_MELVIN_METDUSTY2(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_metdusty2_condition;
	information = dia_melvin_metdusty2_info;
	permanent = 0;
	description = "C� ���� ������ �������...";
};


func int dia_melvin_metdusty2_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(!Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_12_HUT_EX_TEACH2") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,dia_melvin_hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty2_info()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_03");	//C� ���� ������ �������...
	AI_Output(self,other,"SVM_3_YeahWellDone");	//��! �������!
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		c_stoplookat(self);
	};
	AI_TurnToNPC(self,dusty);
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_Output(self,NULL,"SVM_3_SectGreetings");	//���������!
	b_logentry(CH1_RECRUITDUSTY,"����� ������������� � ��������� ������. � �������� ���� �������.");
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_SUCCESS);
	b_givexp(XP_DELIVEREDDUSTY);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};

