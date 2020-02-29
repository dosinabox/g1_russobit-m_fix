
instance DIA_BAALCADAR_EXIT(C_INFO)
{
	npc = gur_1208_baalcadar;
	nr = 999;
	condition = dia_baalcadar_exit_condition;
	information = dia_baalcadar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalcadar_exit_condition()
{
	return 1;
};

func void dia_baalcadar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baalcadar_ansprechbar;
var int baalcadar_sakrileg;

instance DIA_BAALCADAR_NOTALK(C_INFO)
{
	npc = gur_1208_baalcadar;
	nr = 2;
	condition = dia_baalcadar_notalk_condition;
	information = dia_baalcadar_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baalcadar_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALCADAR_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_baalcadar_notalk_info()
{
	Info_ClearChoices(dia_baalcadar_notalk);
	Info_AddChoice(dia_baalcadar_notalk,DIALOG_ENDE,dia_baalcadar_notalk_ende);
	Info_AddChoice(dia_baalcadar_notalk,"� ����� ��� ���������, ������?",dia_baalcadar_notalk_imp);
	Info_AddChoice(dia_baalcadar_notalk,"�� �������� � ����� ������!",dia_baalcadar_notalk_sleeper);
	Info_AddChoice(dia_baalcadar_notalk,"������! � ����� ���������!",dia_baalcadar_notalk_hi);
};

func void dia_baalcadar_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00");	//������! � ����� ���������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//
	BAALCADAR_SAKRILEG = TRUE;
};

func void dia_baalcadar_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00");	//�� �������� � ����� ������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01");	//
	BAALCADAR_SAKRILEG = TRUE;
};

func void dia_baalcadar_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00");	//� ����� ��� ���������, ������?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01");	//
	BAALCADAR_SAKRILEG = TRUE;
};

func void dia_baalcadar_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_SLEEPSPELL(C_INFO)
{
	npc = gur_1208_baalcadar;
	nr = 1;
	condition = dia_baalcadar_sleepspell_condition;
	information = dia_baalcadar_sleepspell_info;
	permanent = 0;
	important = 1;
};


func int dia_baalcadar_sleepspell_condition()
{
	var C_NPC nov1336;
	var C_NPC nov1340;
	var C_NPC nov1345;
	nov1336 = Hlp_GetNpc(nov_1336_novize);
	nov1340 = Hlp_GetNpc(nov_1340_novize);
	nov1345 = Hlp_GetNpc(nov_1345_novize);
	if(Npc_IsInState(nov1336,zs_magicsleep) || Npc_IsInState(nov1340,zs_magicsleep) || Npc_IsInState(nov1345,zs_magicsleep))
	{
		return 1;
	};
};

func void dia_baalcadar_sleepspell_info()
{
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00");	//��� �� �������? � �������� ������������ ������ � ����� ���������.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01");	//��� ������ ���� ������������ ���������� ���� �������?
	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//�����. ��� ���� �� ������� ������.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03");	//�����, �� ��������� ������������� � ��������. � ���� ����� ����.
	BAALCADAR_ANSPRECHBAR = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	};
	b_logentry(CH1_JOINPSI,"���� ����� ������� ���� ��������� ��������!");
	b_givexp(XP_IMPRESSBAALCADAR);
};


instance GUR_1208_BAALCADAR_TEACH(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_teach_condition;
	information = gur_1208_baalcadar_teach_info;
	permanent = 1;
	description = "� ���� ��������� ���� ���������� ����.";
};


func int gur_1208_baalcadar_teach_condition()
{
	if((BAALCADAR_ANSPRECHBAR == TRUE) || (Npc_GetTrueGuild(other) != GIL_NONE))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_teach_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01");	//� ���� ��������� ���� ���������� ����.
	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02");	//���� � ����� ������� � ���� ������ ����.
	if(LOG_BAALCADARTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"���� ����� ����� ������ ��� ��������� ��� ���������� ����.");
		LOG_BAALCADARTRAIN = TRUE;
	};
	Info_ClearChoices(gur_1208_baalcadar_teach);
	Info_AddChoice(gur_1208_baalcadar_teach,DIALOG_BACK,gur_1208_baalcadar_teach_back);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_5);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_1);
};

func void gur_1208_baalcadar_teach_back()
{
	Info_ClearChoices(gur_1208_baalcadar_teach);
};

func void gur_1208_baalcadar_teach_man_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1208_baalcadar_teach);
	Info_AddChoice(gur_1208_baalcadar_teach,DIALOG_BACK,gur_1208_baalcadar_teach_back);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_5);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_1);
};

func void gur_1208_baalcadar_teach_man_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1208_baalcadar_teach);
	Info_AddChoice(gur_1208_baalcadar_teach,DIALOG_BACK,gur_1208_baalcadar_teach_back);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_5);
	Info_AddChoice(gur_1208_baalcadar_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),gur_1208_baalcadar_teach_man_1);
};


instance GUR_1208_BAALCADAR_FIRSTTEST(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_firsttest_condition;
	information = gur_1208_baalcadar_firsttest_info;
	important = 0;
	permanent = 0;
	description = "����� ���� ������������ ����� ���.";
};


func int gur_1208_baalcadar_firsttest_condition()
{
	if(c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_firsttest_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01");	//����� ���� ������������ ����� ���.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02");	//������ ������� ���� ���, �� ����� �������� ���� ������� ���� �� �����.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03");	//� �������� ������� ����.
	Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
	b_logentry(GE_TEACHERPSI,"���� ����� ����� ��������� ���� � ����� ��� ������� ����� �����.");
};


instance GUR_1208_BAALCADAR_KREIS1(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_kreis1_condition;
	information = gur_1208_baalcadar_kreis1_info;
	important = 0;
	permanent = 1;
	description = "� ����� �������� ������� ������� �����.";
};


func int gur_1208_baalcadar_kreis1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,gur_1208_baalcadar_firsttest) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_kreis1_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01");	//� ����� �������� ������� ������� �����.
	if(b_giveskill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02");	//��� ������ �� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03");	//� ������� ������� �������� ������, � ������ �� ���� ������������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04");	//����� ��������� ������������, � ������ ������� ������� �� ������� ��� ���. 
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05");	//���� ������� � � ��� ��������� ��������� ���������� �� ������ ����� � �������� ��������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06");	//� ��� ������, ����� ��� ����������� ���� �������, ��� ������ ������ ����. ����� ��� ��������� ����, ��� ���� �� ������.
		gur_1208_baalcadar_kreis1.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance GUR_1208_BAALCADAR_KREIS2(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_kreis2_condition;
	information = gur_1208_baalcadar_kreis2_info;
	important = 0;
	permanent = 1;
	description = "� ����� � ���������� �� ������ ����.";
};


func int gur_1208_baalcadar_kreis2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_kreis2_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01");	//� ����� � ���������� �� ������ ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02");	//��� ������ �� ���� � ���������� ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03");	//������ ������ �������� � ��� ������ �������� � ��� �����, ��� ��� �������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04");	//��� ���������, �� �������� ���, ���� �� ����, ������ �� �������, ����� �� �������. ������ ���. ��� ������ � ������ ����� �������������� � ����, ������ ���� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05");	//������ ��� �������� �������� �� ������ �� �������� ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06");	//��� ��� ������ ������ ����.
		gur_1208_baalcadar_kreis2.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance GUR_1208_BAALCADAR_KREIS3(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_kreis3_condition;
	information = gur_1208_baalcadar_kreis3_info;
	important = 0;
	permanent = 1;
	description = "� ����� �������� ������ �������� �����.";
};


func int gur_1208_baalcadar_kreis3_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_kreis3_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01");	//� ����� �������� ������ �������� �����.
	if(b_giveskill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02");	//�������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03");	//������� �����������, �� �������� ���� �������� ���� ������������ ��� ����, ����� �������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04");	//������� ����� ���� �� ����, �������. �� ���������� ������� �� ����� ��������. ������ ������ ��� ����� ��������, � ������� �� ���� ������������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05");	//� �� ����� ����� �� ������ ������� ��������� ����������, ���� ����� ����� ������� � ������� ��������� � �������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06");	//��� ��� �������� ������ ����.
	};
	AI_StopProcessInfos(self);
};


instance GUR_1208_BAALCADAR_KREIS4(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_kreis4_condition;
	information = gur_1208_baalcadar_kreis4_info;
	important = 0;
	permanent = 1;
	description = "� ����� �������� � ��������� ����.";
};


func int gur_1208_baalcadar_kreis4_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_kreis4_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01");	//� ����� �������� � ��������� ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02");	//����� ���� ������ �� ������� ��������� ������. ������ ����������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03");	//���� ����� �����, ���������������� � ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04");	//�� �� ������ ���� ����. �� �� �������� ������� �������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05");	//��������� � ��������������� ���� �������� ��������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06");	//������ ���� ������� ��� ������ ������� � �����. �� ��� ������� ��������.
		gur_1208_baalcadar_kreis4.permanent = 0;
	};
};


instance GUR_1208_BAALCADAR_SELLSTUFF(C_INFO)
{
	npc = gur_1208_baalcadar;
	condition = gur_1208_baalcadar_sellstuff_condition;
	information = gur_1208_baalcadar_sellstuff_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int gur_1208_baalcadar_sellstuff_condition()
{
	if((BAALCADAR_ANSPRECHBAR == TRUE) || (Npc_GetTrueGuild(other) != GIL_NONE))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_sellstuff_info()
{
	if(LOG_BAALCADARSELL == FALSE)
	{
		Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
		b_logentry(GE_TRADERPSI,"���� ���� ����� ������� ����, ������, �����, ������� � ������.");
		LOG_BAALCADARSELL = TRUE;
	};
	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01");	//� ���� ���������� ���������� ������.
};

