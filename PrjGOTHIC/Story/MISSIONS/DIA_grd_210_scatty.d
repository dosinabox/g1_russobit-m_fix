
instance DIA_SCATTY_EXIT(C_INFO)
{
	npc = grd_210_scatty;
	nr = 999;
	condition = dia_scatty_exit_condition;
	information = dia_scatty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scatty_exit_condition()
{
	return 1;
};

func void dia_scatty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCATTY_WHATDOYOUDO(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_whatdoyoudo_condition;
	information = dia_scatty_whatdoyoudo_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_scatty_whatdoyoudo_condition()
{
	return 1;
};

func void dia_scatty_whatdoyoudo_info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//� ������� �� ��� �� �����: ��������� ������, ������� ������, ��, ��� ���-�� �����.
};


var int scatty_chargekirgo;
var int scatty_chargekharim;
var int scatty_chargegorhanis;

instance DIA_SCATTY_JOINOC(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_joinoc_condition;
	information = dia_scatty_joinoc_info;
	permanent = 0;
	description = "� ���� �������������� � ����� ������. �� ������ ��� ������?";
};


func int dia_scatty_joinoc_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_scatty_joinoc_info()
{
	var C_NPC kirgo;
	var C_NPC kharim;
	var C_NPC gorhanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//� ���� �������������� � ����� ������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//���� �� ������� ������� ����, ��, ����� ����, ������.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//� ���� �� ����� ����������� ������ ����� ���� �������.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//������ ����-������ �� ��� �� ���, � � ��������, ��� �� ���� ��������. ��, � ��� ������, ����� �� � ���� ������.
	SCATTY_CHARGEKIRGO = LOG_RUNNING;
	SCATTY_CHARGEKHARIM = LOG_RUNNING;
	SCATTY_CHARGEGORHANIS = LOG_RUNNING;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	kharim = Hlp_GetNpc(sld_729_kharim);
	kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
	gorhanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	gorhanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"������, ������������� ���� �� �����, ����� �������, ���� � ������ ������ �� ������.");
};


instance DIA_SCATTY_KIRGOSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_kirgosuccess_condition;
	information = dia_scatty_kirgosuccess_info;
	permanent = 0;
	description = "� �������� � �����!";
};


func int dia_scatty_kirgosuccess_condition()
{
	var C_NPC kirgo;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	if((SCATTY_CHARGEKIRGO == LOG_RUNNING) && (KIRGO_CHARGED == TRUE) && ((kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)) && (KAPITEL == 1))
	{
		return 1;
	};
};

func void dia_scatty_kirgosuccess_info()
{
	var C_NPC kirgo;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//� �������� � �����!
	if(kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//� �� ������ ��� ����� ��� ������?!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//�����, �� ��� ������, ��� ���� ���� �� �������...
		SCATTY_CHARGEKIRGO = LOG_FAILED;
		b_logentry(CH1_JOINOC,"��� ��������� � ��� � ����� �� �������� ��� ������������ ������.");
	}
	else if(kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//�� ������� ���! ������� ��� �������! �� ������������� ������ ����!
		SCATTY_CHARGEKIRGO = LOG_SUCCESS;
		b_logentry(CH1_JOINOC,"������ ��� ������� ����� �������� � ��� � �����.");
		b_givexp(XP_KIRGOVICTORY);
	};
	Npc_ExchangeRoutine(kirgo,"START");
};


instance DIA_SCATTY_KHARIMSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_kharimsuccess_condition;
	information = dia_scatty_kharimsuccess_info;
	permanent = 0;
	description = "� �������� � �������!";
};


func int dia_scatty_kharimsuccess_condition()
{
	var C_NPC kharim;
	kharim = Hlp_GetNpc(sld_729_kharim);
	if((SCATTY_CHARGEKHARIM == LOG_RUNNING) && (KHARIM_CHARGED == TRUE) && ((kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)) && (KAPITEL == 1))
	{
		return 1;
	};
};

func void dia_scatty_kharimsuccess_info()
{
	var C_NPC kharim;
	kharim = Hlp_GetNpc(sld_729_kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//� �������� � �������!
	if(kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//��, ��� �� � �� ���� �����!
		if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//������, ��� �� ������ ������ ����� ����������! � ������� �� ���� ���� ������� �� ������ ������.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//��� �������, �� ���� ��� �������. ����� �������, ��� ��, ��� ��� ����������!
		};
		SCATTY_CHARGEKHARIM = LOG_FAILED;
		b_givexp(XP_KHARIMLOST);
		b_logentry(CH1_JOINOC,"� �������� ��� � �������! ��� �������� ���������� ������, � ��� ������ ������� - �� �����.");
	}
	else if(kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//�� ������� ���! ����������, � �� ���� ������ �� ������. �� �������� ����� �� ����� ������� ������.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//�� ������������� ������ ����!
		SCATTY_CHARGEKHARIM = LOG_SUCCESS;
		b_logentry(CH1_JOINOC,"� ������� ������, ��� ����� �������! ������ ��� ���������.");
		b_givexp(XP_KHARIMVICTORY);
	};
	Npc_ExchangeRoutine(kharim,"START");
};


instance DIA_SCATTY_OTHERCAMPS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_othercamps_condition;
	information = dia_scatty_othercamps_info;
	permanent = 0;
	description = "������ �� ���� �� ������� � ������ ������ ��������� �����?";
};


func int dia_scatty_othercamps_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo))
	{
		return 1;
	};
};

func void dia_scatty_othercamps_info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//� �����, ��� ��������� ����� ������ �� ������� � ������ ������ �� ����� ���������. ������ �� ��� ��������� �����?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//��� ������: ��� � ������ �� ����� ������������ ���, � �������� ����� ������� ������ � ������������� �������� ����������, ��� ���� ����� ���� ������� �� ������ ������.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//������ ���� ���� ������ ������ ������, ����� ������� ���-������ �� ���.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//����� ��� �� �������� ���� �� ������ ������, �� ���� ���� ����...
};

instance DIA_SCATTY_WANNAFIGHT(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_wannafight_condition;
	information = dia_scatty_wannafight_info;
	permanent = 0;
	description = "� ���� ��������� �� �����!";
};


func int dia_scatty_wannafight_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_scatty_wannafight_info()
{
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//� ���� ��������� �� �����!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//�� ��� �� ������� �� � ���� �� �������, ������� � �� ������� ���� �������� �� �����!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//����� �� ������� ������ ����� ������������ �����-��������!
};


instance DIA_SCATTY_TRAIN(C_INFO)
{
	npc = grd_210_scatty;
	nr = 10;
	condition = dia_scatty_train_condition;
	information = dia_scatty_train_info;
	permanent = 1;
	description = "� �� ���������� ������?";
};


func int dia_scatty_train_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2) && (KIRGO_KILLED == FALSE && GORHANIS_KILLED == FALSE && KHARIM_KILLED == FALSE))
	{
		return 1;
	};
};

func void dia_scatty_train_info()
{
	if(LOG_SCATTYTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"������, ������������� ���� �� �����, ����� ������� ���� ���������� � ���������� �����.");
		LOG_SCATTYTRAIN = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//� �� ���������� ������?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//�������, �� � ����� ��� �� ���� �����������. ���� ������, ����� � ���� ����������, �������� ���������.
	Info_ClearChoices(dia_scatty_train);
	Info_AddChoice(dia_scatty_train,DIALOG_BACK,dia_scatty_train_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,150),dia_scatty_train_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,50),dia_scatty_train_1h);
	};
};

func void dia_scatty_train_back()
{
	Info_ClearChoices(dia_scatty_train);
};

func void dia_scatty_train_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//� ����� �� ��������� ����� ������� ���������� �����.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(b_giveskill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//������� �����! ����� �������� ������� ������� ���, �� ������ ��������� ��������� ������� ������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//������� �������������, ������ ��������� ����� ��������� ������� ������� ���� ����� ������. ��� �������� ��������, ������� ����� �������� ���� � ����������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//����� ��� ����� �����. ������ ������� ����� � �� ����� ��� ����������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//�� ������ ��������� ����������� ��� ��� ����� ������ ����, � ����� ��� �������� ����� ����������� � ���������� ������ ����. ��� �������� �������� �����.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//���� �� ������ ��������� ���� �������, �� ������� ��������� ����� ���. �� ����� �������, ���� �������� ������ �������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//��, ���� ��� ���-���: ��������� ����� ������� ������� ����������� ����������. �� ��� �������, ������� � ���� �� ��� ����� ������ �� �������� ����.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//�� ������ ���������� ������� ���� ������������������ � �������� ��� ������ ����� ������.
			b_giveinvitems(other,self,itminugget,50);
			Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,150),dia_scatty_train_2h);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//����� ���� ������������!
	};
};

func void dia_scatty_train_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//����� ���� ����� ������� ���������� �����.
	if(Npc_HasItems(other,itminugget) >= 150)
	{
		if(b_giveskill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//�� ��� ������� ��������� ������������� � �������� ���� �������. ���� �� ������ ������� ��� ������� ����, �� ������� ������� ������� ���� � ���� ������ ����.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//�������, ��� � ������� � ������� �������? ��������� ��� �� ���� � ���������� - ������ ������������ �������� ������������ ����. ���� �� ����� ������� ��� �����, ������ ��������. ��� �������� ���������� � ���� ���� ����������� ������� ����� ������� �������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//����� ���������� � ������ ���� ������ ������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//� ������� � �������� ������. �� ������� ��� ����, ��� ���������� �������� � ������. � ������ ��� � �� ������� � �����������.
			b_giveinvitems(other,self,itminugget,150);
			Info_ClearChoices(dia_scatty_train);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//�������, ����� � ���� ����� ������ ����!
	};
};


instance DIA_SCATTY_GORHANISSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_gorhanissuccess_condition;
	information = dia_scatty_gorhanissuccess_info;
	permanent = 0;
	important = 1;
};


func int dia_scatty_gorhanissuccess_condition()
{
	var C_NPC hanis;
	hanis = Hlp_GetNpc(tpl_1422_gorhanis);
	if((HANIS_CHARGED == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_gorhanissuccess_info()
{
	var C_NPC hanis;
	hanis = Hlp_GetNpc(tpl_1422_gorhanis);
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//� �� ������ ��� ����� ��� ������?!
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//�� ������� ���! ����������, � �� ���� ������ �� ������. �� �������� ����� �� ����� ������� ������.
		b_givexp(300);
	};
	Npc_ExchangeRoutine(hanis,"START");
};

instance DIA_SCATTY_WTF(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_wtf_condition;
	information = dia_scatty_wtf_info;
	permanent = 0;
	important = 1;
};


func int dia_scatty_wtf_condition()
{
	if(KAPITEL < 4 && (((HANIS_CHARGED_END == TRUE) && (Npc_IsDead(tpl_1422_gorhanis))) || ((KIRGO_CHARGED_END == TRUE) && (Npc_IsDead(grd_251_kirgo))) || ((KHARIM_CHARGED_END == TRUE) && (Npc_IsDead(sld_729_kharim)))))
	{
		return 1;
	};
};

func void dia_scatty_wtf_info()
{
	AI_Output(self,other,"SVM_1_HeKilledHim");	//����� �� ���� ���? ������ ���� �� ����!
	b_logentry(CH1_JOINOC,"������ � ������, ������ ��� � ���� ������ �� ��� ������.");
	SCATTY_CHARGEGORHANIS = LOG_FAILED;
	SCATTY_CHARGEKIRGO = LOG_FAILED;
	SCATTY_CHARGEKHARIM = LOG_FAILED;
	if(Npc_IsDead(tpl_1422_gorhanis))
	{
		GORHANIS_KILLED = TRUE;
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(sld_729_kharim,"nopractice");
	};
	if(Npc_IsDead(grd_251_kirgo))
	{
		KIRGO_KILLED = TRUE;
		b_exchangeroutine(sld_729_kharim,"nopractice");
		b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
	};
	if(Npc_IsDead(sld_729_kharim))
	{
		KHARIM_KILLED = TRUE;
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
	};
	b_exchangeroutine(vlk_513_buddler,"noarena");
	b_exchangeroutine(vlk_514_buddler,"noarena");
	b_exchangeroutine(vlk_515_buddler,"noarena");
	b_exchangeroutine(vlk_530_guy,"noarena");
	b_exchangeroutine(stt_306_schatten,"noarena");
	b_exchangeroutine(stt_316_schatten,"noarena");
	b_exchangeroutine(stt_328_schatten,"noarena");
	AI_StopProcessInfos(self);
};

