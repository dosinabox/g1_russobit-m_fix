
instance DIA_WEDGE_EXIT(C_INFO)
{
	npc = org_850_wedge;
	nr = 999;
	condition = dia_wedge_exit_condition;
	information = dia_wedge_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_wedge_exit_condition()
{
	return TRUE;
};

func void dia_wedge_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WEDGE_PSST(C_INFO)
{
	npc = org_850_wedge;
	nr = 1;
	condition = dia_wedge_psst_condition;
	information = dia_wedge_psst_info;
	important = 1;
	permanent = 0;
};


func int dia_wedge_psst_condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void dia_wedge_psst_info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//��, ��!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//���?.. �?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//��, ��, ��... �������-�� ����!
	AI_StopProcessInfos(self);
};


instance DIA_WEDGE_HELLO(C_INFO)
{
	npc = org_850_wedge;
	condition = dia_wedge_hello_condition;
	information = dia_wedge_hello_info;
	important = 0;
	permanent = 0;
	description = "��� ���� �� ���� �����?";
};


func int dia_wedge_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_psst))
	{
		return TRUE;
	};
};

func void dia_wedge_hello_info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//��� ���� �� ���� �����?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//�� ���� �� ��� ����� �����, ��? � ����� ��� �������.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//���� ����� ������ ����� � �����, ����� ������ �����. � ���� ������� ����, ���� ������.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//������ ����� ����� �� ���, � ��� �� ��������������. ��������, ���� - ��� ��� ��� � ������, ����� ������� ���. ������� �� ���� ��������!
};


instance DIA_WEDGE_WARNSOFBUTCH(C_INFO)
{
	npc = org_850_wedge;
	condition = dia_wedge_warnsofbutch_condition;
	information = dia_wedge_warnsofbutch_info;
	important = 0;
	permanent = 0;
	description = "������?";
};


func int dia_wedge_warnsofbutch_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_hello))
	{
		return TRUE;
	};
};

func void dia_wedge_warnsofbutch_info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//������?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//���� � ���� ���� ��������� �������� - ���� ���� ��������. ��� ��� ���������� �� ���������� ��� �� �����.
};


instance DIA_WEDGE_LEHRER(C_INFO)
{
	npc = org_850_wedge;
	nr = 700;
	condition = dia_wedge_lehrer_condition;
	information = dia_wedge_lehrer_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_wedge_lehrer_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_hello))
	{
		return TRUE;
	};
};

func void dia_wedge_lehrer_info()
{
	if(LOG_WEDGELEARN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
		b_logentry(GE_TEACHERNC,"��� ���� ����� ������� ���� ��������������, �������� � ��������� �����.");
		LOG_WEDGELEARN = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//������� �� ����, ��� �� ������ ������!
	Info_ClearChoices(dia_wedge_lehrer);
	Info_AddChoice(dia_wedge_lehrer,DIALOG_BACK,dia_wedge_lehrer_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),dia_wedge_lehrer_pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,LPCOST_TALENT_PICKPOCKET_1,0),dia_wedge_lehrer_pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),dia_wedge_lehrer_lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_1,LPCOST_TALENT_PICKLOCK_1,0),dia_wedge_lehrer_lockpick);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNSNEAK,LPCOST_TALENT_SNEAK,0),dia_wedge_lehrer_schleichen);
	};
};

func void dia_wedge_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//� ���� ��������� ��������������.
	if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//��� ������ ���� ������ ��������� ����������. ��� �� ����������� �������������� ���� �������.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//���������� ������ ������ ��������, ��� ������� ����� �� ������ �������� ����� �����.
	};
};

func void dia_wedge_lehrer_lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//� ���� ��������� ��������� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//�� ���� ����� �� ��� ������, ��? ��������� ����� �� ����� ������.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//����� ����� ������� �� ���, ����� � ���� �� ��������� �������.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//���� �� ������ ����������� ����� ���������, �� ��������, ��� �� ������ ������� ���� �� ����������� ������ ����� �������.
	};
};

func void dia_wedge_lehrer_lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//� ���� ����� �������� ������ ������.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//����� ������� ���������������, � �� ��� � ��������� ������ ������������ ������, ����� ������� ������ ���-��� ���������. ��� ���� �� �������� ������ ����.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//� ������ � ���� ������ ������ ��������� ������ � ����� ��� �������� �������. ��� ���� �� ������ ������ �� ������� ����.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//���������� ������������� ����� ������� ������� �����, �� ������ �� ����� �������.
	};
};

func void dia_wedge_lehrer_pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//� ���� ����� ������� �����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(b_giveskill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//��� �� ������ ��������� �������� ������� �������, ��? ��� �.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//� ����� ���� �����, �� � ���� ������ ���� ��������� ���� ���� ����������� �� ����� ������������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//���� ����� �������� ������ � ��� ������, ���� �� ��������� ���� �� ���� �� ����� �������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//�� ������ ���������������� ��� ����� ���������� ��������� �������� ���-������ ������ �� ������� ������������� ���������!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//���� �� ����� �� ����! ���, ��� �� ����� ��������������, ������� �� ������ �����.
	};
};

func void dia_wedge_lehrer_pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//� ���� ����� ��������-�����������.
	if(b_giveskill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//�����, �� ��� ����� � ����, ����� � �������� ���� � ������� ���������� ����������.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//�� ����, ��� ���� ������ ����� ���� ����� ������� �� ����� ������������.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//���� ���������.
	};
};

func void dia_wedge_lehrer_back()
{
	Info_ClearChoices(dia_wedge_lehrer);
};

