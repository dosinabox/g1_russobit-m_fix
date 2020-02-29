
func void b_thoruslearn()
{
	Info_ClearChoices(grd_200_thorus_teach);
	Info_AddChoice(grd_200_thorus_teach,DIALOG_BACK,grd_200_thorus_teach_back);
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),grd_200_thorus_teach_str_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),grd_200_thorus_teach_str_1);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),grd_200_thorus_teach_dex_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),grd_200_thorus_teach_dex_1);
	}
	else
	{
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),grd_200_thorus_teach_str_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),grd_200_thorus_teach_str_1);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),grd_200_thorus_teach_dex_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),grd_200_thorus_teach_dex_1);
	};
};

instance INFO_THORUS_EXIT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 999;
	condition = info_thorus_exit_condition;
	information = info_thorus_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_thorus_exit_condition()
{
	return 1;
};

func void info_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_ENTERCASTLE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 3;
	condition = info_thorus_entercastle_condition;
	information = info_thorus_entercastle_info;
	permanent = 0;
	description = "�������, �� �� ����������� � ����� �����������...";
};


func int info_thorus_entercastle_condition()
{
	if(!c_npcbelongstooldcamp(other) && (DIEGO_GOMEZAUDIENCE == FALSE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_entercastle_info()
{
	AI_Output(other,self,"Info_EnterCastle_15_00");	//�������, �� �� ����������� � ����� �����������...
	AI_Output(self,other,"Info_EnterCastle_09_01");	//������ ���� ������ ����� �������� � �����.
};


instance INFO_THORUS_WORKFORGOMEZ(C_INFO)
{
	npc = grd_200_thorus;
	nr = 3;
	condition = info_thorus_workforgomez_condition;
	information = info_thorus_workforgomez_info;
	permanent = 0;
	description = "� ���� ����� ����� �� ����� ������.";
};


func int info_thorus_workforgomez_condition()
{
	if((Npc_KnowsInfo(hero,info_diego_joinoldcamp) || Npc_KnowsInfo(hero,info_thorus_entercastle)) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_workforgomez_info()
{
	AI_Output(other,self,"Info_WorkForGomez_15_00");	//� ���� ����� ����� �� ����� ������.
	AI_Output(self,other,"Info_WorkForGomez_09_01");	//��, ��� �� ��������? � ������ ��� �� �������, ��� ������ ���� ������� ������?
};


instance INFO_THORUS_DIEGOSENTME(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_diegosentme_condition;
	information = info_thorus_diegosentme_info;
	permanent = 0;
	description = "����� ������, ��� ��� �� ���� �������.";
};


func int info_thorus_diegosentme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_workforgomez) && Npc_KnowsInfo(hero,info_diego_joinoldcamp) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_diegosentme_info()
{
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00");	//����� ������, ��� ��� �� ���� �������.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01");	//��... ���� ����� ������, ��� �� ������ ���� �������, ������ �� ��� �� ���������� �����?
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02");	//��������, ����� ������ ���������, �������� ����. � ���� �� �����, ��� �� ���������, � ������� ���� � �����, � �� ������� ����������� � �������.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03");	//� ��� ��� ��� ������� ������ �� ����, ����?
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04");	//� �������� � �����.
	b_logentry(CH1_JOINOC,"����� ������ ���, ��� � ������ ���������� � �����, ���� � ����, ����� ���� ������� � ������ ������. ����� ���� ��� �������.");
};


instance INFO_THORUS_TRYME(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_tryme_condition;
	information = info_thorus_tryme_info;
	permanent = 0;
	description = "� ������ �� ��� �� ������ ���� ��������?";
};


func int info_thorus_tryme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_workforgomez) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_tryme_info()
{
	AI_Output(other,self,"Info_Thorus_TryMe_15_00");	//� ������ �� ��� �� ������ ���� ��������?
	AI_Output(self,other,"Info_Thorus_TryMe_09_01");	//�����, �� ��� ��� ������! � ������� �������, ������� ����� ����-�� ����� ��������, ������ ���� �����������.
	AI_Output(self,other,"Info_Thorus_TryMe_09_02");	//����������� �� ����� ������. � �� ��� ���� ��������.
	AI_Output(self,other,"Info_Thorus_TryMe_09_03");	//���� �� ����� � ������ �� ���� � �� ���, ��� �� ���������. ����� �����.
};


instance INFO_THORUS_TRYMEAGAIN(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_trymeagain_condition;
	information = info_thorus_trymeagain_info;
	permanent = 0;
	description = "� � ����� �� ���� ���� ������?";
};


func int info_thorus_trymeagain_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_tryme) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_trymeagain_info()
{
	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00");	//� � ����� �� ���� ���� ������?
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01");	//���. ��, ��� �������, ������� �������, ����� ���� ��� ���-�� �������.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02");	//����� ����� ��, ��� ���� ����������� ���� �������.
};


instance INFO_THORUS_TRYMEICANDOIT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_trymeicandoit_condition;
	information = info_thorus_trymeicandoit_info;
	permanent = 0;
	description = "�� � ����� ������ � ��, ��� ������� ��� ��.";
};


func int info_thorus_trymeicandoit_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_trymeagain) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_trymeicandoit_info()
{
	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00");	//�� � ����� ������ � ��, ��� ������� ��� ��.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01");	//�� ��? ����, �� �������� ����� ������, ��? ������-�� ���� ���� ���� - ��� ��� ��� ����, ��� �� ���������� � �������.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02");	//�� ������, ��������� ���� - �������� ���� �������������.
};

instance INFO_THORUS_MORDRAGKO_OFFER(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragko_offer_condition;
	information = info_thorus_mordragko_offer_info;
	permanent = 0;
	description = "� ������� ���� �������.";
};


func int info_thorus_mordragko_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_trymeicandoit) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_mordragko_offer_info()
{
	var C_NPC mordrag;
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00");	//� ������� ���� �������.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01");	//���, ��� � ���� �����, ������ �������� ����� ����, �� ����� �������. �����?
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02");	//��.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03");	//� ��� ����� ���� ���� ���������� ������ �� ������ ������ - �������. �� ������ � �������.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04");	//�������, ��� ����� ��� ����� � ����� ������. �� ���� ������ ������ ��������: ������ � ��� � ��� �� �������!
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05");	//�� ������� ����� ���� ���������, ������ ��� �����, ��� � ��� ������ ������� �� ����.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06");	//������?
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07");	//�� ������ ��� ���� ���� ��� ��������.
	Info_ClearChoices(info_thorus_mordragko_offer);
	Info_AddChoice(info_thorus_mordragko_offer,"� ������� ��.",info_thorus_mordragko_offer_back);
	Info_AddChoice(info_thorus_mordragko_offer,"������, ����� � ���� ���?",info_thorus_mordragko_killhim);
	Info_AddChoice(info_thorus_mordragko_offer,"��� � ���� ����� ��������?",info_thorus_mordragko_where);
	Info_AddChoice(info_thorus_mordragko_offer,"� ������ ���� �������� ��������?",info_thorus_mordragko_magesprotect);
	Info_AddChoice(info_thorus_mordragko_offer,"�������, ��� ���� ���� ���������� ���� ������...",info_thorus_mordragko_mageproblem);
	THORUS_MORDRAGKO = LOG_RUNNING;
	Log_CreateTopic(CH1_MORDRAGKO,LOG_MISSION);
	b_logentry(CH1_MORDRAGKO,"����� �����, ����� � ������ �� ������ ���� ��������. ��� �������, ��� � ����� ��� �������. ����� �� ������ �����, ��� ����� ������� ��� ��� ����.");
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_RUNNING);
	mordrag = Hlp_GetNpc(org_826_mordrag);
};

func void info_thorus_mordragko_offer_back()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//� ������� ��.
	Info_ClearChoices(info_thorus_mordragko_offer);
};

func void info_thorus_mordragko_killhim()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00");	//������, ����� � ���� ���?
	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01");	//��� ��� �����. ������� ������ ���, ����� � ��� ������ �� �����.
};

func void info_thorus_mordragko_where()
{
	var int log;
	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00");	//��� � ���� ����� ��������?
	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01");	//�� ������ ������� �����, ����� ����� �����. �� ������������ ������ �������� � ������.
	if(log == FALSE)
	{
		b_logentry(CH1_MORDRAGKO,"�������� � ����� ����� � ����� �����, � ��������������� ������� �����.");
		log = TRUE;
	};
};

func void info_thorus_mordragko_magesprotect()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00");	//� ������ ���� �������� ��������?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01");	//���� ���� �������� � ������ �� ������ ������, � �� �� ���������.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02");	//�����, ���� � ���� ��� �������� �� ������ ������ �� �� ������, ��� ���� �� �����.
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03");	//� ��� �� �? ��� ���� ����� ������� �� ����?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04");	//�� ���������, � ���� ��� �� ������. � ��� � ������� ������� �� �������� ����� ������, � ������ �����, ����� �� ������ ���� ��� �� �����.
	THORUS_MORDRAGMAGEMESSENGER = TRUE;
};

func void info_thorus_mordragko_mageproblem()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00");	//�������, ��� ���� ���� ���������� ���� ������...
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01");	//��, � � ���� �� ��� ������ �������. ���� ��� ����� ���� �� ��������� ��������� ����� ���������� ���� ����� ����, ���� ��� ����.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02");	//����� ��� ����� �� ������� ������... ������, ��� �������, ������������ �� ����� ������...
};


instance INFO_THORUS_MORDRAGKO_ANALYZE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragko_analyze_condition;
	information = info_thorus_mordragko_analyze_info;
	permanent = 1;
	description = "� �� ������ ��������...";
};


func int info_thorus_mordragko_analyze_condition()
{
	if((THORUS_MORDRAGKO == LOG_RUNNING) && (MORDRAGKO_PLAYERCHOSETHORUS != TRUE))
	{
		return 1;
	};
};

func void info_thorus_mordragko_analyze_info()
{
	var C_NPC mordrag;
	Info_ClearChoices(info_thorus_mordragko_analyze);
	Info_AddChoice(info_thorus_mordragko_analyze,"� ���������� �� ����.",info_thorus_mordragko_analyze_back);
	Info_AddChoice(info_thorus_mordragko_analyze,"��� � ���� ����� ��������?",info_thorus_mordragko_where);
	if(THORUS_MORDRAGMAGEMESSENGER == FALSE)
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"� ������ ���� �������� ��������?",info_thorus_mordragko_magesprotect);
	};
	mordrag = Hlp_GetNpc(org_826_mordrag);
	if(Npc_IsDead(mordrag))
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"������, ��� ������� �������� ���� ��������� �����!",info_thorus_mordragko_mordragdead);
	}
	else if((MORDRAGKO_HAUAB == TRUE) || (MORDRAGKO_STAYATNC == TRUE))
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"������ �� �� ����� ���� ���� ���!",info_thorus_mordragko_mordraggone);
	};
};

func void info_thorus_mordragko_analyze_back()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00");	//� ���������� �� ����.
	Info_ClearChoices(info_thorus_mordragko_analyze);
};

func void info_thorus_mordragko_mordragdead()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00");	//������, ��� ������� �������� ���� ��������� �����!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01");	//������ �������, �� ������� ���? �������, �����!
	THORUS_MORDRAGKO = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_SUCCESS);
	b_logentry(CH1_MORDRAGKO,"����� ������� ������� ���, ��� �������� ������ ��� � ������ ������.");
	b_givexp(XP_THORUSMORDRAGDEAD);
	Info_ClearChoices(info_thorus_mordragko_analyze);
};

func void info_thorus_mordragko_mordraggone()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00");	//������ �� �� ����� ���� ���� ���!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01");	//���� �� �����, ���� �� �� ���� ���.
	THORUS_MORDRAGKO = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_SUCCESS);
	b_logentry(CH1_MORDRAGKO,"����� ������� ������� ���, ��� �������� ������ ��� � ������ ������.");
	b_givexp(XP_THORUSMORDRAGKO);
	Info_ClearChoices(info_thorus_mordragko_analyze);
};


instance INFO_THORUS_MORDRAGFAILED(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragfailed_condition;
	information = info_thorus_mordragfailed_info;
	permanent = 0;
	important = 1;
};


func int info_thorus_mordragfailed_condition()
{
	if(MORDRAGKO_PLAYERCHOSETHORUS == TRUE)
	{
		return 1;
	};
};

func void info_thorus_mordragfailed_info()
{
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00");	//�� ��� ��������! � �� ������������ ����: �� �������� ����� �����!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01");	//�� �������� ���! ������ ���, ��� � ���� ������� � ������ �� ���� ����� � ��� ����!
	THORUS_MORDRAGKO = LOG_FAILED;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
	b_logentry(CH1_MORDRAGKO,"� ������ ��������, ��� ������� ������� ���. ������ ��� ������ �� �����������. ������ ��� ����� �� ���������� � ���� �� ����.");
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_BRIBEGUARD(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_bribeguard_condition;
	information = info_thorus_bribeguard_info;
	permanent = 0;
	description = "�� ������� �������� � �����, ���� � �������� ����� ������� ����?";
};


func int info_thorus_bribeguard_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_entercastle) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_GRD) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_bribeguard_info()
{
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00");	//� �� ������� �������� ���� � �����, ���� � �������� � ����� ����� ������� ����?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01");	//����� �������...
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02");	//�������?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02");	//��... �������� ���� ���� ������ ������ ����� �������. �� � ������� ������ ������� ���������� �����, ����� �� ����� ����������.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03");	//��, ����� ������� ������?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03");	//�����, ������ ������ ����� � ����� ���.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04");	//������ ������?!
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04");	//��, ������ ������ ���������, ����� ������ ����� �� ����� ������.
};


instance INFO_THORUS_GIVE1000ORE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_give1000ore_condition;
	information = info_thorus_give1000ore_info;
	permanent = 1;
	description = "� ���� ���� ������ ������ ����. �������� ����!";
};


func int info_thorus_give1000ore_condition()
{
	var C_NPC wache212;
	wache212 = Hlp_GetNpc(grd_212_torwache);
	if(Npc_KnowsInfo(hero,info_thorus_bribeguard) && (wache212.aivar[AIV_PASSGATE] != TRUE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_give1000ore_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00");	//� ���� ���� ������ ������ ����. �������� ����!
	if(Npc_HasItems(other,itminugget) >= 1000)
	{
		b_printtrademsg1("������ ����: 1000");
		b_giveinvitems(other,self,itminugget,1000);
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//�����, �������. �� �� ������� ��� ���������, �����?
		wache212 = Hlp_GetNpc(grd_212_torwache);
		wache213 = Hlp_GetNpc(grd_213_torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		THORUS_PASSGATE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02");	//�� ������� ������ ����, �����! � ���� ��� ������ ������!
		AI_StopProcessInfos(self);
	};
};


instance INFO_THORUS_LETTERFORMAGES(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_letterformages_condition;
	information = info_thorus_letterformages_info;
	permanent = 0;
	description = "��� ����� ������� � �����. � ���� ���� ������...";
};


func int info_thorus_letterformages_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_entercastle) && (Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02)) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_letterformages_info()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//��� ����� ������� � �����. � ���� ���� ������ ��� ���������� ���� ����� ����.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03");	//������, ������ ��� ��� ������.
	Info_ClearChoices(info_thorus_letterformages);
	Info_AddChoice(info_thorus_letterformages,"��� ���.",info_thorus_letter_yes);
	Info_AddChoice(info_thorus_letterformages,"�������, � ������� ���� ������������ ���? ������ ��� ����!",info_thorus_letter_no);
};

func void info_thorus_letter_yes()
{
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04");	//��� ���.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01");	//� �� ���������, ��� � ������ ������� ���� � �����, ����� �� ��� �������� ���� �������?
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02");	//��.
	AI_Output(self,other,"SVM_9_GetOutOfHere");	//����� ���!
	if(LETTER_TOLD == 0)
	{
		LETTER_TOLD = 1;
	}
	else if(LETTER_TOLD == 1)
	{
		LETTER_TOLD = 2;
		if(!Npc_IsDead(vlk_505_buddler))
		{
			b_exchangeroutine(vlk_505_buddler,"letterwait");
		};
		if(!Npc_IsDead(vlk_506_buddler))
		{
			b_exchangeroutine(vlk_506_buddler,"letterwait");
		};
	};
	AI_StopProcessInfos(self);
};

func void info_thorus_letter_no()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04");	//�������, � ������� ���� ������������ ���? ������ ��� ����!
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05");	//������, ��� �����.
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02");	//��� ������ �� ����� �� ����, ��� ��� ��������� ��������� ���, ������?
	Info_ClearChoices(info_thorus_letterformages);
};

instance INFO_THORUS_READYFORGOMEZ(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_readyforgomez_condition;
	information = info_thorus_readyforgomez_info;
	permanent = 0;
	description = "����� ������, ��� ��� ����� ������� ������!";
};


func int info_thorus_readyforgomez_condition()
{
	if(DIEGO_GOMEZAUDIENCE == TRUE)
	{
		return 1;
	};
};

func void info_thorus_readyforgomez_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	var C_NPC wache218;
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00");	//����� ������, ��� ��� ����� ������� ������!
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01");	//��� ������, ��� ���� �����!
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02");	//� ��� �� �����?
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03");	//��...
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04");	//������ �����������, �� ��� ��� �� ����� ��� ��� ����.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05");	//������! ������ ����������� � �������. ��� ������ ������ - ������ �� �� ���� �� ��� ��� ���.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06");	//������ ��� ������� ������ �� ���� ������.
	wache212 = Hlp_GetNpc(grd_212_torwache);
	wache213 = Hlp_GetNpc(grd_213_torwache);
	wache218 = Hlp_GetNpc(grd_218_gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
	THORUS_PASSGATE = TRUE;
	THORUS_KRAUTBOTE_PASS = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_KRAUTBOTE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 4;
	condition = info_thorus_krautbote_condition;
	information = info_thorus_krautbote_info;
	permanent = 1;
	description = "��� ����� ������� ������ ��������.";
};


func int info_thorus_krautbote_condition()
{
	if((KALOM_KRAUTBOTE == LOG_RUNNING) && (THORUS_KRAUTBOTE_PASS == FALSE))
	{
		return 1;
	};
};

func void info_thorus_krautbote_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	var C_NPC wache218;
	AI_Output(other,self,"Info_Thorus_Krautbote_15_00");	//��� ����� ������� ������ ��������.
	AI_Output(self,other,"Info_Thorus_Krautbote_09_01");	//������!
	if(Npc_HasItems(other,itmijoint_3) >= 30)
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//��� ��...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_02");	//��...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_03");	//������! �������. ����������� � ���� �������. ������� �������� ���� ���.
		wache212 = Hlp_GetNpc(grd_212_torwache);
		wache213 = Hlp_GetNpc(grd_213_torwache);
		wache218 = Hlp_GetNpc(grd_218_gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
		THORUS_KRAUTBOTE_PASS = TRUE;
		THORUS_PASSGATE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//��...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_04");	//� ���� ������� ���� ���������! �������, �� �� ������ ��� �� �������. ����� ���������� �����, ����� � �������.
		AI_StopProcessInfos(self);
	};
};


var int thorus_amulettgezeigt;

instance INFO_THORUS_KDWSIEGEL(C_INFO)
{
	npc = grd_200_thorus;
	nr = 4;
	condition = info_thorus_kdwsiegel_condition;
	information = info_thorus_kdwsiegel_info;
	permanent = 1;
	description = "���� �������� ���� ����. ��� ����� ������� � �����.";
};


func int info_thorus_kdwsiegel_condition()
{
	if((Npc_HasItems(other,kdw_amulett) >= 1) && (THORUS_AMULETTGEZEIGT == FALSE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_kdwsiegel_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00");	//���� �������� ���� ����. ��� ����� ������� � �����.
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03");	//�������, �������! � ������ � ���� ��� ����� ����, �?
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01");	//�� ������ ������ ���� ������, ������ ���� � ���� ���� ������.
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//��� ��...
	AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//�����, �������. �� �� ������� ��� ���������, �����?
	wache212 = Hlp_GetNpc(grd_212_torwache);
	wache213 = Hlp_GetNpc(grd_213_torwache);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	THORUS_AMULETTGEZEIGT = TRUE;
	THORUS_PASSGATE = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_STTGESCHAFFT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_sttgeschafft_condition;
	information = info_thorus_sttgeschafft_info;
	permanent = 0;
	description = "� ���� ��� ����������. �������-�� ���� ������� � ���� ������!";
};


func int info_thorus_sttgeschafft_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

func void info_thorus_sttgeschafft_info()
{
	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00");	//� ���� ��� ����������. �������-�� ���� ������� � ���� ������!
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01");	//��� ������������, �����! ����� �� ������� - ������� ������� � �����.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02");	//�� ������ ���������� � ������ � ������ ������ �� ����� ������ �����.
};


instance INFO_THORUS_PERM2(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_perm2_condition;
	information = info_thorus_perm2_info;
	permanent = 0;
	description = "��� ����?";
};


func int info_thorus_perm2_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void info_thorus_perm2_info()
{
	AI_Output(other,self,"Info_Thorus_PERM2_15_00");	//��� ����?
	AI_Output(self,other,"Info_Thorus_PERM2_09_01");	//�������. ����� ������ ��� �� ������ ������. � ��� �������� �������� ������� �������.
};


instance GRD_200_THORUS_GARDIST(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_gardist_condition;
	information = grd_200_thorus_gardist_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ��� ���-�� �������?";
};


func int grd_200_thorus_gardist_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_214_torwache_seethorus) || Npc_KnowsInfo(hero,grd_216_torwache_seethorus)) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_200_thorus_wannabemage))
	{
		return TRUE;
	};
};

func void grd_200_thorus_gardist_info()
{
	var C_NPC kdfwache;
	kdfwache = Hlp_GetNpc(grd_245_gardist);
	kdfwache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01");	//�� ����� ��� ���-�� �������?
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02");	//��. ��, ��� �� ������ � �����, ��� ��� ���������� ���� ��������, � ����� ���� ���� � ������ �������.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03");	//� ����� ������� ���� � ���������.
	if(hero.level < 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04");	//�� � ���� ��� �������� ��� ����� �����. �������� ��� ������� � �������.
		AI_StopProcessInfos(self);
		b_printguildcondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05");	//��� ���� ����. ��� �������?
	};
};


instance GRD_200_THORUS_AUFNAHME(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_aufnahme_condition;
	information = grd_200_thorus_aufnahme_info;
	permanent = 0;
	description = "� ���� ����� ����������.";
};


func int grd_200_thorus_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_gardist) && (hero.level >= 10) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_200_thorus_aufnahme_info()
{
	var C_NPC kdfwache;
	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01");	//� ���� ����� ����������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02");	//������� ������� ���. �� ������� ��������, ��� ������ ����� ����� �������. ������ �����������, ������ ��� ��������� �� ����.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03");	//������ �� ��� ��� �� ����, ������ ������ ����� ������ �� ����. ��� ���� ����� ����� �� ������ ��������. ��, ���������, �������� ����� �������, ����, ����� � ������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04");	//�������� �������� ����, � ���� ������ �������, ����� �� �� ������� �������. � ���� � ������� ���������� ����� ������, ������ ���� ������� �� ���.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05");	//���� � ����� �� ��������� � �����. ���� � ����� �� ����� �� ������ � ����� ������ � ������ �� ���, ����� ��� ��������� ����� ����� ��������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06");	//������ �� ���� ���������������� ������ ��������, �� ������ �� - ����, � � ���� ����� ���������. ���� ����� ��� ���������� ����� ��������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07");	//�� ����� ������ ��� ����� ���� - ������������. ������ ������ �� ������ ���������� � ������ ����������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08");	//� �������� � �����.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09");	//���������� �� ����� ���������. ���� �����, ��� ����-�� ����� ������������ ���� ������ � ���� ���� ����� ������� ���, ��� ��� ����� �����������.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10");	//��� � ������. �� ���� ���� ������� � ���.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11");	//�� ������� ��� � ��������� ����� �� ���������� ������.
	kdfwache = Hlp_GetNpc(grd_245_gardist);
	kdfwache.aivar[AIV_PASSGATE] = FALSE;
	Npc_SetTrueGuild(hero,GIL_GRD);
	hero.guild = GIL_GRD;
};


instance GRD_200_THORUS_NOCHWAS(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_nochwas_condition;
	information = grd_200_thorus_nochwas_info;
	important = 1;
	permanent = 0;
};


func int grd_200_thorus_nochwas_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_aufnahme) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_nochwas_info()
{
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01");	//��, � ��� ��� ���...
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02");	//����� ���������� � ���������!
	AI_StopProcessInfos(self);
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"������� ����� �������� ���� � ���� ����������. � ���� ����� ���� ����� ������ � ������� ������ � �����.");
};


instance GRD_200_THORUS_WANNABEMAGE(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_wannabemage_condition;
	information = grd_200_thorus_wannabemage_info;
	permanent = 0;
	description = "�� ��� �� ���� ���� �����.";
};


func int grd_200_thorus_wannabemage_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_gardist) && !Npc_KnowsInfo(hero,grd_200_thorus_aufnahme) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_200_thorus_wannabemage_info()
{
	var C_NPC corristo;
	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01");	//�� ��� �� ���� ���� �����.
	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02");	//����� ���� ������ � ��������. �� ���� ��������. ����, �� �������� ��������.
	corristo = Hlp_GetNpc(kdf_402_corristo);
	Npc_ExchangeRoutine(corristo,"WAITFORSC");
	AI_ContinueRoutine(corristo);
};


instance GRD_200_THORUS_TEACH(C_INFO)
{
	npc = grd_200_thorus;
	nr = 10;
	condition = grd_200_thorus_teach_condition;
	information = grd_200_thorus_teach_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int grd_200_thorus_teach_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_200_thorus_teach_info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01");	//� ���� ������ ���� �������� ���� ������ � ����� �������.
	if(LOG_THORUSTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"����� ����� ������ ��� ��������� ���� � ��������.");
		LOG_THORUSTRAIN = TRUE;
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_back()
{
	Info_ClearChoices(grd_200_thorus_teach);
};

func void grd_200_thorus_teach_str_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_STRENGTH] < 100)
		{
			b_printtrademsg1("������ ����: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_str_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_STRENGTH] < 96)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_dex_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 100)
		{
			b_printtrademsg1("������ ����: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_dex_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] < 96)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_thoruslearn();
};


instance GRD_200_THORUS_ZWEIHAND1(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_zweihand1_condition;
	information = grd_200_thorus_zweihand1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0);
};


func int grd_200_thorus_zweihand1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_zweihand1_info()
{
	if(LOG_THORUSFIGHT == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"����� ����� ������� ���� ����� ��� ��������� �����, ���� � ����� ���������� � ���������� �������.");
		LOG_THORUSFIGHT = TRUE;
	};
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01");	//����� ���� ������� ��������� �����.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_9_NoLearnNoPoints");	//�� ������������ ������, ����� � ���� ���� �����.
		PrintScreen("��������� ���������� ����������� ������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02");	//������, ����� ����� ������ � �������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03");	//��� ����� ������� �������������. ���� �������� ������ �����������, ����� ��������� ���������� ������� �������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04");	//������� ���� � ��� ����������� ����. ������ ����� ����������, ����� ���������� �� �����.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05");	//��������� ������� ��������, ����� ��������� � �������� �������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06");	//��������� ��� - ��� ��������� ������ ��� ������� ������, ����� ���� ���� ������� ����� �� ����������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07");	//� �����, ������ ������ �������������.
		grd_200_thorus_zweihand1.permanent = 0;
	};
};


instance GRD_200_THORUS_ZWEIHAND2(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_zweihand2_condition;
	information = grd_200_thorus_zweihand2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0);
};


func int grd_200_thorus_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_zweihand2_info()
{
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01");	//� ���� ��������� ����� ������� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02");	//��� ������ ���� ���� ��������� ������. ����� ��� �����������, �������� �� �������� ������ ������ � ������ ��� � �������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03");	//������ ���� ����, ��������� ���� �� ������ �����. � ����� - ������ ���� ������!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04");	//� ���������� �� ����� �� ������� ����� � ���� �����������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05");	//�� ����� �� ��������� ����� ������� ������ ������� ���� ������, ����� �������� �����.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06");	//����������, ����� ������� ���� ������� ������, - � ��� ���� ������� ����!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07");	//���� ����� �������� ������������, �� ������� ����������� � ������� ���������.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08");	//����� ��������� �����, ��������� � ��� �������, ����� ��������� �����.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09");	//������ ������ ������� � ����������� ������ � ������������� ������.
		grd_200_thorus_zweihand2.permanent = 0;
	};
};

