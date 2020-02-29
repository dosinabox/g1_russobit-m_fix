
instance DIA_STT_331_FINGERS_EXIT(C_INFO)
{
	npc = stt_331_fingers;
	nr = 999;
	condition = dia_stt_331_fingers_exit_condition;
	information = dia_stt_331_fingers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_stt_331_fingers_exit_condition()
{
	return 1;
};

func void dia_stt_331_fingers_exit_info()
{
	AI_StopProcessInfos(self);
};


var int fingers_canteach;

instance DIA_FINGERS_BECOMESHADOW(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_becomeshadow_condition;
	information = dia_fingers_becomeshadow_info;
	permanent = 1;
	description = "� ���� ����� ���������.";
};


func int dia_fingers_becomeshadow_condition()
{
	if((FINGERS_CANTEACH == FALSE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_fingers_becomeshadow_info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//� ���� ����� ���������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//� ���?
	Info_ClearChoices(dia_fingers_becomeshadow);
	Info_AddChoice(dia_fingers_becomeshadow,DIALOG_BACK,dia_fingers_becomeshadow_back);
	if(Npc_KnowsInfo(hero,info_diego_teachers))
	{
		Info_AddChoice(dia_fingers_becomeshadow,"��� ����� �������, ������� ������ ���� ����-������ �������.",dia_fingers_becomeshadow_teachme);
	};
	Info_AddChoice(dia_fingers_becomeshadow,"�� ��� �� ������ ���?",dia_fingers_becomeshadow_anytips);
};

func void dia_fingers_becomeshadow_back()
{
	Info_ClearChoices(dia_fingers_becomeshadow);
};

func void dia_fingers_becomeshadow_anytips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//�� ��� �� ������ ���?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//� �� ����, ���...
};

func void dia_fingers_becomeshadow_teachme()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//��� ����� �������, ������� ������ ���� ����-������ �������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//����� �� ���� �����?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//���� ������� �����.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//�� ������ ��� ����� ������� ��� ���.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//���� �� ������, ����� ���� ������� � ������, �� ������ ����� ������� ����� ��� ������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//����������� �������� ����� ���������� ����. ��� ����� �������, �� ������� �� �� ������ ���������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//������� ��� ������ ���� ������� ������� ���� ����.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//� �������, � ������ ���, ������ ������ ����� ����� � ������ ������.
	FINGERS_CANTEACH = TRUE;
	Info_ClearChoices(dia_fingers_becomeshadow);
};


var int fingers_wherecavalorn;

instance DIA_FINGERS_LEHRER(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_lehrer_condition;
	information = dia_fingers_lehrer_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_fingers_lehrer_condition()
{
	if(FINGERS_CANTEACH == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_lehrer_info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//�� ������ ������� ���� ����-������?
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 2))
	{
		AI_Output(self,other,"SVM_5_NoLearnOverMax");	//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//������� �� ����, ��� �� ������ ������.
		Info_ClearChoices(dia_fingers_lehrer);
		Info_AddChoice(dia_fingers_lehrer,DIALOG_BACK,dia_fingers_lehrer_back);
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),dia_fingers_lehrer_pickpocket2);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,LPCOST_TALENT_PICKPOCKET_1,0),dia_fingers_lehrer_pickpocket);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),dia_fingers_lehrer_lockpick2);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_1,LPCOST_TALENT_PICKLOCK_1,0),dia_fingers_lehrer_lockpick);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,"� ���� ��������� ��������������.",dia_fingers_lehrer_schleichen);
		};
	};
};

func void dia_fingers_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//� ���� ��������� ��������������.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//� �����, ��� ������ ��������� ������, ��� � ������ ���, �����-���� ���������� � ��� �������.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//�� ���� �� ������������� ������ ��������� ��������������, �� ���� ������� ���������� � ���������!
	FINGERS_WHERECAVALORN = TRUE;
};

func void dia_fingers_lehrer_lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//� ����� �� �����, ��� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//������, � ���� �����? ��� �� ������� ������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//����� ����� ������� �� ���, ����� � ���� �� ��������� �������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//���� �� ������ ����������� ����� ���������, �� ��������, ��� �� ������ ������� ���� �� ����������� ������ ����� �������.
		Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),dia_fingers_lehrer_lockpick2);
	};
};

func void dia_fingers_lehrer_lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//� ���� ����� ��� � ������ ������.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//����� ��������� ���������� �� ������� ���������� ������, ����� ������� ���-��� ���������. ��� ����� ������� �� �����.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//� ������ � ���� ������ ������ ��������� ������ � ����� ��� �������� �������. ��� ���� �� ������ ������ �� ������� ����.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//���������� ������������� ����� ������� ������� �����, �� ������ �� ����� �������.
	};
};

func void dia_fingers_lehrer_pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//� ���� ����� ������� �����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(b_giveskill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//��� �� ������ ��������� �������� ������� �������, ��? ��� �.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//���� ����� �������� ������ � ��� ������, ���� �� ��������� ���� �� ���� �� ����� �������.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//�� ������ ���������������� ��� ����� ���������� ��������� �������� ���-������ ������ �� ������� ������������� ���������!
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//��������� �������� ���� �� �����-�� ������� �� ������� ������ �����, ����� ������� ��������� ��������������.
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),dia_fingers_lehrer_pickpocket2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//������ �� ������! ���, ��� �� ����� ��������������, ������� �� ������ ��������� �����.
	};
};

func void dia_fingers_lehrer_pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//� ���� ����� ��� � ��������� ������.
	if(b_giveskill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//�����, �� ��� ����� ������� ����� ����� ����������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//�� ���� ������� ���� ����� ������� �� ����� ������������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//���� ���������.
	};
};

func void dia_fingers_lehrer_back()
{
	Info_ClearChoices(dia_fingers_lehrer);
};


instance DIA_FINGERS_WHERECAVALORN(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_wherecavalorn_condition;
	information = dia_fingers_wherecavalorn_info;
	permanent = 1;
	description = "��� ����� ����� ���������?";
};


func int dia_fingers_wherecavalorn_condition()
{
	if(FINGERS_WHERECAVALORN == TRUE && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_fingers_wherecavalorn_info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//��� ����� ����� ���������?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//�� �������� � ����� �����. �� ������� ��� �� ���� � ������ ������. � ������ �� ������� ������ ����������� ������� ������.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//� ��� �� ������� ������ ������ ���������. �� ����� ������ ���.
	if(LOG_CAVALORNTRAIN_SNEAK == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"�������� ����� ������� ���� ��������������. ��� ��� ��������� � ���������� ������ � ������ �� ������� ������, �� ������ � ����� ������.");
		LOG_CAVALORNTRAIN_SNEAK = TRUE;
	};
};

var int fingers_learnt;

instance DIA_FINGERS_LEARNT(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_learnt_condition;
	information = dia_fingers_learnt_info;
	permanent = 1;
	description = "�� ������ ��������� �� ���� �������� ����� �����?";
};


func int dia_fingers_learnt_condition()
{
	if((FINGERS_LEARNT != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_fingers_learnt_info()
{
	var int log;
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//�� ������ ��������� �� ���� �������� ����� �����?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//��, �� ��� ������ ������, ���� ������ ���������� ������ ������.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//��� ����� ������� ����. � ����� �� ���� ���� �����.
		FINGERS_LEARNT = LOG_SUCCESS;
		b_givexp(XP_FINGERSTRAIN);
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
		b_logentry(CH1_JOINOC,"�������� ��������, ��� � �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//��� �� ��� ������...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//���� �� �������� ���� � ������ �������, �� ������ ����!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//� ��� ��� �������?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//����� ���� �������� �������. ����� �� ��������� �������������� ��� ��������� �����, ����� � ����� ���� ������.
		FINGERS_LEARNT = LOG_RUNNING;
		if(log == FALSE)
		{
			Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
			b_logentry(CH1_JOINOC,"������� ������ ��������� �� ���� ��������, ���� � ����� ��������� ������ �� ��������� �������.");
			log = TRUE;
		};
	};
};

