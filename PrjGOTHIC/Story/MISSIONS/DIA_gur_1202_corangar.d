
instance DIA_GUR_1202_CORANGAR_EXIT(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 999;
	condition = dia_gur_1202_corangar_exit_condition;
	information = dia_gur_1202_corangar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gur_1202_corangar_exit_condition()
{
	return TRUE;
};

func void dia_gur_1202_corangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORANGAR_LATERTRAINER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = dia_corangar_latertrainer_condition;
	information = dia_corangar_latertrainer_info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_corangar_latertrainer_condition()
{
	return 1;
};

func void dia_corangar_latertrainer_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//������ ����� ������� ������? ��, ���� ������������� ����� ����� �������� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//������. ��, � ���������, � �� ���, ��� ������ ������ ����.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//� ������ ���� ���, ��� ������ � ��������� ���� �������.
};


instance DIA_CORANGAR_WIETEMPLER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = dia_corangar_wietempler_condition;
	information = dia_corangar_wietempler_info;
	permanent = 1;
	description = "��� ��� ����� ����� �� �������?";
};


func int dia_corangar_wietempler_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer) && (Npc_GetTrueGuild(other) != GIL_TPL))
	{
		return 1;
	};
};

func void dia_corangar_wietempler_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//��� ��� ����� ����� �� �������?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//��� ����� ���� ����� �������� ���� � ������� � ����������� ���, ���� �����������.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//����� ����� ������� �� ���, � � ���� ����� ����.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CORANGAR_TEACH(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 10;
	condition = gur_1202_corangar_teach_condition;
	information = gur_1202_corangar_teach_info;
	permanent = 1;
	description = "��� � ���� ��������� ���� � ��������?";
};


func int gur_1202_corangar_teach_condition()
{
	if(c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_teach_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//��� � ���� ��������� ���� � ��������?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//�������� � ���� ����� ������ �������������� �����.
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
};

func void gur_1202_corangar_teach_back()
{
	Info_ClearChoices(gur_1202_corangar_teach);
};

func void gur_1202_corangar_teach_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
};

func void gur_1202_corangar_teach_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
};

func void gur_1202_corangar_teach_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
};

func void gur_1202_corangar_teach_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
	Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
};


instance GUR_1202_CORANGAR_WANNABETPL(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_wannabetpl_condition;
	information = gur_1202_corangar_wannabetpl_info;
	important = 0;
	permanent = 1;
	description = "� ���� ����� �������!";
};


func int gur_1202_corangar_wannabetpl_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_wannabetpl_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//� ���� ����� �������!
	if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//�� ��� � ����� �� �����. � ����� ������� ������ �����, ����� � ���� ����� ������ �����.
		gur_1202_corangar_wannabetpl.permanent = 1;
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//���� ����� ������, �� ������ �������������� � ���.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//�� ������ �����, ��� ����� �� ������ �������� ������ � ������� ����. �� ��������� ������ �������, ������ ����.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//�� � ������ ���� ���������� ���� ���� � ���� ����. ��������� ������� ����� ����� ������ ���, ��� ���� � ��� ��������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//� ���, ��� �� ������� ����� ������� �����������, �������� �� ��� ��� ���� �������. �� ����� ���� �������� � ���� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//�������, ����� ���� ��� ����� � ���� ��������, �� ������ �������� ����� ������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//����� � ��� �� ���� �� ������������� ��������. �� ���� ���� ���� ����� �������.
		gur_1202_corangar_wannabetpl.permanent = 0;
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BECOMETEMPLAR,LOG_NOTE);
		b_logentry(GE_BECOMETEMPLAR,"������� ��� ����� �������� ���� �������. � ����� ����� ���� ����� ������ � ��� �� ����. ������ �� ����� �� ������������� ��������.");
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"��� ����� ����� ������ ��� ��������� ���� � �������� � ������� ���������� � ��������� �����. �� ��� ���������� ����� ����, ��� � ����� ��� � ���������� �������. � ����� ����� ��� �� ������������� �������� �������, �� ������ ������.");
	};
};


instance GUR_1202_CORANGAR_ZWEIHAND1(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_zweihand1_condition;
	information = gur_1202_corangar_zweihand1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0);
};


func int gur_1202_corangar_zweihand1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_zweihand1_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//����� ���� ����� ��� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//����� �������� �������� ��� � ��������� �����, ����� ������������ ���� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//�� ���������� � ����� ������� ������ �����, ����� ������� ��������� �� ������ ����� �����, �� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//������ ��� ������� ����������, ������� ���� ���� � ���, �� ������� ���������� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//���� � ����� - ������ ���������������. � ��� ���� � ��� ���������� ������ �����.
		gur_1202_corangar_zweihand1.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};


instance GUR_1202_CORANGAR_ZWEIHAND2(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_zweihand2_condition;
	information = gur_1202_corangar_zweihand2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0);
};


func int gur_1202_corangar_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_zweihand2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//� ���� ��������� ��� ����� ���������� � ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//�� ��� ������ ������ �������� ���� �������. ������ � ����� ���� �������, ��������� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//���� ������ ���� ������� ���� ������������� �������� ���������� �� ����, ��� �� ������� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//���� �� ������ ������� ����������, �� ������ ��� ���������� � ����� �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//�������� - ���� ������������. ��������, ����� �������� ���� �������� � ������������, � ����� - ������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//����� �� �������� �������� �� ����. ����� ����� ����� �������� �� ����� ���� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//�������� ����������� ����. �� ������� �������� ����������, ���� ������ ���� � ��� ��������� � ���������������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//��������� ���� ���� ��������� � �����: ���� ����� �����, ���� �� ��� ���� �������� ��������.
		gur_1202_corangar_zweihand2.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};


instance GUR_1202_CORANGAR_SENDS(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_sends_condition;
	information = gur_1202_corangar_sends_info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ������ ������?";
};


func int gur_1202_corangar_sends_condition()
{
	if((KAPITEL == 3) && (CORANGAR_GOTOOGY == FALSE))
	{
		return 1;
	};
};

func void gur_1202_corangar_sends_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//��� �� ��� ������ ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//���� ������� ���� ����� �������. ��� �������� ��� ������ ��������, ��� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//�� ���� ����� ����: �� ������ ���� � ������ ������. �������� ������ ���� ����������� ���� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//������ ���� �������� ��� �������, ������� ��� ����� ���������� � ��� ��������� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//���� ���� ����� ���� � ����� ���������� ������� � ���������� ����. ����� ����, ��� �� ������ ��, ��� �������� ������� �� ���� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//��� ����� �������, ������� ������ ����� � ���, � ����� ��������� �� ��� � ���������� � ���, ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//������ �� �� ������ ����� ���� ���? �� �� ������������ �������!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//��� ������ - �������� �������������. � �������� ����� � ��������� � ���� �������� ���.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//�� ��� ������ �������� ������ ������. � ������� ���� ������, ��� ���� ��-�� �� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//������� � ����� ����, ����������� �� �������� ����� � �������� ���, ��� ������� ����� ����� �������.
	Info_ClearChoices(gur_1202_corangar_sends);
	Info_AddChoice(gur_1202_corangar_sends,"� ��� � �� ��� ������?",gur_1202_corangar_sends_earn);
	Info_AddChoice(gur_1202_corangar_sends,"� ������ �� ����� ����!",gur_1202_corangar_sends_know);
};

func void gur_1202_corangar_sends_earn()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//� ��� � �� ��� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//���� ����� ����? ��������, � ������ � ����. �� ��� ��� ����� ����� ���� ������. ��� ��� ������ ����. ������ � ���� ���!
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
};

func void gur_1202_corangar_sends_know()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//� ������ �� ����� ����!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//������ ��� ��� ������. ��� ������ �������� ���� � �����!
	b_story_gotoorcgraveyard();
	CreateInvItem(self,schutzring_geschosse1);
	b_giveinvitems(self,hero,schutzring_geschosse1,1);
	Info_ClearChoices(gur_1202_corangar_sends);
};


instance GUR_1202_CORANGAR_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_where_condition;
	information = gur_1202_corangar_where_info;
	important = 0;
	permanent = 0;
	description = "��� ��������� �������� �����?";
};


func int gur_1202_corangar_where_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_sends))
	{
		return 1;
	};
};

func void gur_1202_corangar_where_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//��� ��������� �������� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//��� ��������. ��������� ����� ����� ������. �� ������� ����� ��� �� ������� ����� ������. �� ������ ���� ����.
	b_logentry(CH3_ORCGRAVEYARD,"��������� ����� ������ �������� ��� ������ �� �������� �����. �� ���� ���� �� ������� ����� ������.");
};


instance GUR_1202_CORANGAR_AFTER(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_after_condition;
	information = gur_1202_corangar_after_info;
	important = 0;
	permanent = 0;
	description = "� ��� �� �������� �����. �� �� ������ ��� ������ �����...";
};


func int gur_1202_corangar_after_condition()
{
	if(BAALLUKOR_BRINGPARCHMENT == 4)
	{
		return 1;
	};
};

func void gur_1202_corangar_after_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//� ��� �� �������� �����. �� �� ������ ��� ������ �����. ������� ������, ����������� �� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//� ��� � ������ ������� � ��������?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//��� ��� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//������? �� ������, ��� ���� ����� ��?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//� ������� ����� ����� �����. ��� ��� ����� ���� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//���� ����� ���� �������� �� ���, ��, � ���������, �� ����� � ���.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//�� ���� �������, ��� ������ �������� ��� ����� ����, � ��������� ��������� ���� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//��������, ��� �� ��������� ��-�� �������� �������������. �� ��� ����� ����� ���-������ ���.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//� �� ����, ��� ��� �������� ��� ������ ����� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//������ �� �����... ����������... �������!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//�������, ��� ���� ����� �� ���� ����������� ���� ���������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//������ ��� ���� ������� �� ��������.
	b_givexp(XP_REPORTTOCORANGAR);
	b_story_backfromorcgraveyard();
};


instance INFO_CORANGAR_FINDHERB(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_findherb_condition;
	information = info_corangar_findherb_info;
	permanent = 0;
	important = 0;
	description = "��� ���� � ��������?";
};


func int info_corangar_findherb_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_after))
	{
		return 1;
	};
};

func void info_corangar_findherb_info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//��� ���� � ��������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//��� �� �� ������ ����������. �� ������ �������. � ����, ��� ����� ��� ���������, �� ��� ����� ��� ����� ���� ������.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//��� � ���� ��� ������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//����� ��� �������� �������� �����. ������� ��� ���� ����� ����������� �� ���.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//�, ����������, ����������!
	AI_StopProcessInfos(self);
	CORANGAR_FINDHERB = LOG_RUNNING;
	Log_CreateTopic(CH3_FINDHERBS,LOG_MISSION);
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_RUNNING);
	b_logentry(CH3_FINDHERBS,"������� ��� ��� ��� ��������. ��� ����� �������� ���� ����� ��� ���� ���� ������ ����� ������� �������� ����.");
};


instance INFO_CORANGAR_FINDHERB_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_where_condition;
	information = info_corangar_findherb_where_info;
	permanent = 0;
	important = 0;
	description = "� ��� ������ ��� �����?";
};


func int info_corangar_findherb_where_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_where_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//� ��� ������ ��� �����?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//����� � ������� �� �������. ��� ������ ���������� ������ ������, �� ���� ���������, ��� ���� ����� ��������� ����������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//�� ����� ������ �������. ��� ��!
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"��� ����� � ����� ����� ������ �� ������� �� ������� ��������. ��� ������� ������� ����������. � ������ ���� ����� ���������.");
};


instance INFO_CORANGAR_FINDHERB_LOOK(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_look_condition;
	information = info_corangar_findherb_look_info;
	permanent = 0;
	important = 0;
	description = "��� ��� ������ �� �����, ������� ������� ��������?";
};


func int info_corangar_findherb_look_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_look_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//��� ��� ������ �� �����, ������� ������� ��������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//��� ������ �� ������ �� ������ ������� � ��������� �����-�������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//� ������ ���.
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"�������� ����� ������ �� ������ �� ������� ������� � ������� ��������� �������.");
};


instance INFO_CORANGAR_FINDHERB_RUNNING(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_running_condition;
	information = info_corangar_findherb_running_info;
	permanent = 1;
	important = 0;
	description = "��� ����, ������� � �����, ����� ������������.";
};


func int info_corangar_findherb_running_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5) && Npc_KnowsInfo(hero,info_corangar_findherb_where) && Npc_KnowsInfo(hero,info_corangar_findherb_look))
	{
		return 1;
	};
};

func void info_corangar_findherb_running_info()
{
	var C_NPC fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//��� ����, ������� � �����, ����� ������������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//����� ����, ������� ������ ���� ������? �� �� �������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//���� ����� ����������. ������� ���� ������. ������� �� ����� ����� �� ������.
	AI_StopProcessInfos(self);
	if(!FORTUNO_HASYBERIONHERBS)
	{
		fortuno = Hlp_GetNpc(nov_1357_fortuno);
		CreateInvItems(fortuno,itfo_plants_herb_03,5);
		FORTUNO_HASYBERIONHERBS = TRUE;
		b_logentry(CH3_FINDHERBS,"����� ����� ����� ���� ��������� � �������.");
	};
};


instance INFO_CORANGAR_FINDHERB_SUCCESS(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_findherb_success_condition;
	information = info_corangar_findherb_success_info;
	permanent = 0;
	description = "� ����� �������� ����� ��� ��������.";
};


func int info_corangar_findherb_success_condition()
{
	if((Npc_HasItems(other,itfo_plants_herb_03) >= 5) && (CORANGAR_FINDHERB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_findherb_success_info()
{
	var C_NPC yberion;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01");	//� ����� �������� ����� ��� ��������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//�������. ����� �� ������, ������� ������� ���������.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//�� ���-������ ������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//��, �� ������, ��� ������ �� ����� ���� �� �������� ���, ��� �� � ��� ������. �� �� ������ �������� ��������� ���.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//������ ��� �������� ��������� �� ��, ��� �������� ����� ��������.
	YBERION_DEAD = LOG_RUNNING;
	b_giveinvitems(other,self,itfo_plants_herb_03,5);
	Npc_RemoveInvItems(self,itfo_plants_herb_03,5);
	b_givexp(XP_FINDHERBS);
	CORANGAR_FINDHERB = LOG_SUCCESS;
	b_logentry(CH3_FINDHERBS,"� ������� ��� ������ �������� �����. ������ ����� ������ ��������� �� ��, ��� ��� �� ������� ������.");
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_SUCCESS);
	yberion = Hlp_GetNpc(gur_1200_yberion);
	AI_Wait(self,1);
	AI_GotoNpc(self,yberion);
	AI_TurnToNPC(self,yberion);
	AI_PlayAni(self,"T_PLUNDER");
	AI_WaitTillEnd(self,yberion);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//������� ����. ��� �������� ������� ������� ���!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//���� ���� ������ �� ������ ��������� �� ���� ������!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//� ������ ������� ��������. ����� ������� �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//����� ���� �������� �� ������ ����������� � ���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
};


instance INFO_CORANGAR_TELEPORT(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_teleport_condition;
	information = info_corangar_teleport_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_teleport_condition()
{
	if(Npc_KnowsInfo(hero,info_corangar_findherb_success))
	{
		return TRUE;
	};
};

func void info_corangar_teleport_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//�������!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//� ��� ����?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//������ ��� ���� � ���� ����� ������������� �� ���� ������.
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//��� ���� ���� ����������� ������ ����������� �� ������� ����� ����� ������.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//������� ����!
	b_story_senttonc();
};

