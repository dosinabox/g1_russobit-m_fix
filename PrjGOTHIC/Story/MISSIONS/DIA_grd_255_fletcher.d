
instance DIA_FLETCHER_EXIT(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 999;
	condition = dia_fletcher_exit_condition;
	information = dia_fletcher_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_fletcher_exit_condition()
{
	return 1;
};

func void dia_fletcher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FLETCHER_FIRST(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_first_condition;
	information = dia_fletcher_first_info;
	permanent = 0;
	important = 1;
};


func int dia_fletcher_first_condition()
{
	if(Wld_IsTime(0,0,6,0) && KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_fletcher_first_info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//��, ��!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//�� ���� ������?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//��� ������ ���� � ����!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//������, ��������, ��� � ���� �����: ��� ��� �����. � ��� ������������ �� �����!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//�� �� �������� ���� ���� ������ ���� ��������, �������� ����� ������� ��� �� �����.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//�����, ���� ����� ����������� ����� � ������ �� ������������ ��� �� �����. �������, ����� ����� ���� ��������� ��� � �������. ��� ��� ��� ����� �����.
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//�� ���� � ������ ���� � ����� ����, ���� ������ � ����������, ����� �� �� ���� �������.
	AI_StopProcessInfos(self);
};


var int fletcher_whytalk;

instance DIA_FLETCHER_HELLO(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 2;
	condition = dia_fletcher_hello_condition;
	information = dia_fletcher_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_fletcher_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_fletcher_hello_info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//��, ��!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//���� ������ ��������� �� ������, �� ������� �� ������ ��� ����� ����.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//��? ��� ������?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//������ ��� ���� ����� ���.
	Info_ClearChoices(dia_fletcher_hello);
	Info_AddChoice(dia_fletcher_hello,"��� �������.",dia_fletcher_hello_isee);
	Info_AddChoice(dia_fletcher_hello,"������ �� �, ��-������, � ����� ����� ������������?",dia_fletcher_hello_whytalk);
	Info_AddChoice(dia_fletcher_hello,"� ��� �� ����?",dia_fletcher_hello_whereelse);
};

func void dia_fletcher_hello_whereelse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//� ��� �� ����?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//�� ����� ���� � � ����� � �������� ������, � � ���� � ���� ����� � �����.
};

func void dia_fletcher_hello_whytalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//������ �� �, ��-������, � ����� ����� ������������?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//������ ��� ��� ������, � �� ������������ �� ���� �����.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//����� �������� ��� ������ �� ������, ���� �� �� ���������.
	FLETCHER_WHYTALK = TRUE;
	Info_ClearChoices(dia_fletcher_hello);
};

func void dia_fletcher_hello_isee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//��� �������.
	Info_ClearChoices(dia_fletcher_hello);
};


instance DIA_FLETCHER_WONEK(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_wonek_condition;
	information = dia_fletcher_wonek_info;
	permanent = 0;
	description = "�� ������, ��� ������ ����� ���� ���?";
};


func int dia_fletcher_wonek_condition()
{
	if((Npc_KnowsInfo(hero,dia_stt_315_lostnek) || FLETCHER_WHYTALK == TRUE) && SLY_LOSTNEK != LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_fletcher_wonek_info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//�� ������, ��� ������ ����� ���� ���?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//���, �� � ��� ������ ����� �� ����.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//��� ��� �����, ������� �������� ������ ���-������ �����, �� ������ �� ���������� ��� �������� �� �����.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//��� �����, ������. ��� �����, ��� � �������� ���� ������ � ������, ��� ������� � ���� �� ������!
	if((SLY_LOSTNEK != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"�������, ��� �������� ����� ����� ����� �����, ���� ����� ���.");
	};
};


instance DIA_FLETCHER_TROSCHU(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_troschu_condition;
	information = dia_fletcher_troschu_info;
	permanent = 0;
	description = "��� ������ �� ���� ������ �� ������� � ��� ��� ���� �� ������?";
};


func int dia_fletcher_troschu_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_hello))
	{
		return 1;
	};
};

func void dia_fletcher_troschu_info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//��� ������ �� ���� ������ �� ������� � ��� ��� ���� �� ������?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//��� ������ ����� ����� ��� ��� ������. ��� ��� ������ � ��� ������ �����.
};


var int fletcher_foundnek;

instance DIA_FLETCHER_WEGENNEK(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_wegennek_condition;
	information = dia_fletcher_wegennek_info;
	permanent = 1;
	description = "� �� ������ ����...";
};


func int dia_fletcher_wegennek_condition()
{
	if((Npc_KnowsInfo(hero,dia_fletcher_wonek) || (SLY_LOSTNEK == LOG_SUCCESS && FLETCHER_WHYTALK == TRUE)) && (FLETCHER_FOUNDNEK == FALSE))
	{
		return 1;
	};
};

func void dia_fletcher_wegennek_info()
{
	var C_NPC nek;
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//� �� ������ ����...
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01");	//��?
	nek = Hlp_GetNpc(grd_282_nek);
	if((SLY_LOSTNEK == LOG_SUCCESS) || !Hlp_IsValidNpc(nek))
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//��-�����, � ����� ���.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//���? � ��� �� ������?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//���� ������ ��� ����...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//�, ���! ����! ������ � ����� �������� ����� ��������. � � ��� �������� �� ��� �����������.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//������ � ����� ��������.
		FLETCHER_FOUNDNEK = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//������ ������.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//���� ��� �������, ����� ������.
	};
};


instance DIA_FLETCHER_PROBLEM(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_problem_condition;
	information = dia_fletcher_problem_info;
	permanent = 0;
	description = "� � ��� ��������?";
};


func int dia_fletcher_problem_condition()
{
	if(FLETCHER_FOUNDNEK == TRUE)
	{
		return 1;
	};
};

func void dia_fletcher_problem_info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//� � ��� ��������?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//� �������� �������� ������. ������ �� ������, ��� � ������ ����, � ����� ������ ���� �� ��� ���������...
};


instance GRD_255_FLETCHER_WELCOME(C_INFO)
{
	npc = grd_255_fletcher;
	condition = grd_255_fletcher_welcome_condition;
	information = grd_255_fletcher_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_255_fletcher_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void grd_255_fletcher_welcome_info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//�� ������ ��������, ���������. ����� ���������� � ���������!
};


instance INFO_FLETCHER_DIE(C_INFO)
{
	npc = grd_255_fletcher;
	condition = info_fletcher_die_condition;
	information = info_fletcher_die_info;
	permanent = 0;
	important = 1;
};


func int info_fletcher_die_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void info_fletcher_die_info()
{
	AI_GotoNpc(self,hero);
	if((OLDHEROGUILD == GIL_STT) || (OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF))
	{
		if(OLDHEROGUILD == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//���������! �� �������� ����, ��������� ����� ����������!
		}
		else if(OLDHEROGUILD == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//��� ���� �� ����������, �������� ����� ����!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//������, ���������! ���� �� � ������� ������, ���� ��� ��� ����� �� �������!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//�������, � ��� �� ��������?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//�� ���� �� ���� � ���� ���������� �� ������ ������, ��?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//������...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//���? �����, ����� � �� ����������, �?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//���� ��������� �� ������������ ���� ����!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//���. ��� ���� ������������... ������������ ���� ������, ������ ��� ����� �� � ���� �� �����.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//����, ���������!
		if(Npc_KnowsInfo(hero,info_cutter_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"�������, ������� ������ �������� ������, ����� ���� ����� ��� ��, ��� � �����. �� ���-�� ����� � ���, ��� � ��� ������� ��� ������ ������.");
		}
		else if(!Npc_KnowsInfo(hero,info_jackal_payday) && !Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"�������, ������� ������ ������ � ������� ���������� �������� ������� ������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
			b_logentry(CH4_BANNEDFROMOC,"�������, ��� ������, ��� ���� �������� �� ������� ������!");
		};
	}
	else
	{
		if(c_npcbelongstonewcamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//��������-��. ������� �� ������ ������!
			AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//�� � ���? ����� ���� �� ����� ����?
			AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//����� ���� ����� ����� ����� ������������ ���.
			AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//��, ��, ������� �� ������.
			AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//������, �� � �� ���� ��������� ���� �� ���� ���� ������������ �������.
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//��������-��. ������� �� ��������� ������!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//�������, � �� ����� �������������.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//���� ���� ������ ������, ����� ��� ����!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//��, ��� ��...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//�����, �����, ����� ���!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	b_exchangeroutine(grd_252_gardist,"FMTaken2");
	b_exchangeroutine(grd_253_gardist,"FMTaken2");
	b_exchangeroutine(grd_244_gardist,"FMTaken2");
	b_exchangeroutine(grd_214_torwache,"FMTaken2");
	b_exchangeroutine(grd_215_torwache,"FMTaken2");
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
	if(GETNEWGUY_STARTED == TRUE && OC_BANNED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	b_setpermattitude(grd_255_fletcher,ATT_HOSTILE);
	b_setpermattitude(grd_252_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_253_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_244_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_214_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_215_torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		b_logentry(CH4_FIREMAGES,"������ � ������ ������ ������� � ���������� �����������. ��� �������� �� ������, ��� �������� ������� �����������, ����� ������� � ���.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
};

