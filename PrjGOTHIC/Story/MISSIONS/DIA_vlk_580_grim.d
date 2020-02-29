
instance DIA_GRIM_EXIT(C_INFO)
{
	npc = vlk_580_grim;
	nr = 999;
	condition = dia_grim_exit_condition;
	information = dia_grim_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grim_exit_condition()
{
	return 1;
};

func void dia_grim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIM_FALLE(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_falle_condition;
	information = dia_grim_falle_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_falle_condition()
{
	if((GRIM_PROTECTIONBULLY == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_grim_falle_info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//��, ��! � ������, �� ������ �������������� � ������ ������?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//��, � ��� �� ����?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//� ���� ������ ����...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//��� ������?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//�� �������� ������ ����� ��� ��������. ��� ������ ���-��� � �������. � ����� ��� ������ ���� ������, ������� ������ � ��������� ������.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//��������, ���� ������ ��� ������ ��� ����. ���� �� ������ ������� �� ���, �� � ���� ������ ���������. ������ ��� ��� �� ��� ����. ��� �������?
	Info_ClearChoices(dia_grim_falle);
	Info_AddChoice(dia_grim_falle,"��� ��� �� �����. ����� ���� �������� ���-������ ���.",dia_grim_falle_deny);
	Info_AddChoice(dia_grim_falle,"� ��� �����, ����� �� ������� � ��� ������?",dia_grim_falle_howshare);
	Info_AddChoice(dia_grim_falle,"��� �, ������ ������. ����!",dia_grim_falle_accepr);
};

func void dia_grim_falle_deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//��� ��� �� �����. ����� ���� �������� ���-������ ���.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//� ����� ���������� � ���� �� ����� ����� �� ���������. ���� �����������, �� ������, ��� ���� �����.
	Info_ClearChoices(dia_grim_falle);
};

func void dia_grim_falle_howshare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//� ��� �����, ����� �� ������� � ��� ������?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//��� ������! � ����� ������ � ������ �������. ��, ��� � ������� ���, ��� �� ������� ���. � �� ������ � ������ �� ������� �����.
	Info_ClearChoices(dia_grim_falle);
	Info_AddChoice(dia_grim_falle,"��� ��� �� �����. ����� ���� �������� ���-������ ���.",dia_grim_falle_deny);
	Info_AddChoice(dia_grim_falle,"� �� ��������. �� ����� ��� �������� �������...",dia_grim_falle_halfhalf);
	Info_AddChoice(dia_grim_falle,"��� �, ������ ������. ����!",dia_grim_falle_accepr);
};

func void dia_grim_falle_halfhalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//� �� ��������. �� ����� ��� �������� �������, ��� ���������� � ���� ���!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//�����, ��� ������, ������� ��� �������. ������� ������ ������� �� �����. ��, � ���� �� ���� ������������?
};

func void dia_grim_falle_accepr()
{
	//AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//� �����.
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//��� �, ������ ������. ����!
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//������.
	Info_ClearChoices(dia_grim_falle);
};


instance DIA_GRIM_READYTOGO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_readytogo_condition;
	information = dia_grim_readytogo_info;
	permanent = 0;
	description = "� ����� ����� � ����� �� ��������!";
};


func int dia_grim_readytogo_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_falle))
	{
		return 1;
	};
};

func void dia_grim_readytogo_info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//� ����� ����� � ����� �� ��������!
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//�����, ��� �� ����...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_GRIM_ATOCDRAUSSEN(C_INFO)
{
	npc = vlk_580_grim;
	nr = 3;
	condition = dia_grim_atocdraussen_condition;
	information = dia_grim_atocdraussen_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_atocdraussen_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_readytogo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void dia_grim_atocdraussen_info()
{
	var C_NPC bu520;
	var C_NPC bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//��� �� � �� �����. ���� ���� ����� �� ����� ����� ��������.
	if(((Npc_GetDistToNpc(self,bu520) < 1000) && !Npc_IsDead(bu520)) || ((Npc_GetDistToNpc(self,bu534) < 1000) && !Npc_IsDead(bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//������� ������ �������� ���� ���� ������� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//������� ������ ���� �������� ���� ������!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	bu520 = Hlp_GetNpc(vlk_520_buddler);
	bu534 = Hlp_GetNpc(vlk_534_buddler);
	if((Npc_GetDistToNpc(self,bu520) < 1000) && !Npc_IsDead(bu520))
	{
		Npc_SetTarget(bu520,other);
		AI_StartState(bu520,zs_attack,1,"");
	};
	if((Npc_GetDistToNpc(self,bu534) < 1000) && !Npc_IsDead(bu534))
	{
		Npc_SetTarget(bu534,other);
		AI_StartState(bu534,zs_attack,1,"");
	};
};


instance DIA_GRIM_NACHFALLE(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_nachfalle_condition;
	information = dia_grim_nachfalle_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_nachfalle_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_atocdraussen) && (Npc_GetDistToNpc(self,other) < ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_grim_nachfalle_info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//��� �� ������� ���� � �������, ���������!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//��! ����� ���� ���������. ��� ���� ������ �� ������� ������� �������� � �����.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//���� � ������ ��������� � ���� ��������, ���� ������ � ������.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//�� ���� ��� ������� � ���, ��� ��� �������� ������ ������ ����. �� ������ ���� ��������� �� �����������.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//����� � ������ ���� ������ �� ����. ��� ��� �� ����� - ������� ��� ��������� � �����?
	Info_ClearChoices(dia_grim_nachfalle);
	Info_AddChoice(dia_grim_nachfalle,"�����, ������ ����� ���� ������ �� ������!",dia_grim_nachfalle_weiterpruegeln);
	Info_AddChoice(dia_grim_nachfalle,"����� ���������� � �����!",dia_grim_nachfalle_frieden);
};

func void dia_grim_nachfalle_weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//�����, ������ ����� ���� ������ �� ������!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//�� ����� ������ �������, �� ����� ����� ���.
	Info_ClearChoices(dia_grim_nachfalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_grim_nachfalle_frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//����� ���������� � �����!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//� ���, ��� �� ��������� ����. ������� �� ����. ������ � ���� �� ����� �������.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//���� � ���� ��������� ������������, �� ������ �� ���� ������������, � �� ���� �������.
	Info_ClearChoices(dia_grim_nachfalle);
	npc_setpermattitude(self,ATT_FRIENDLY);
};


var int firstover;

instance DIA_GRIM_HALLO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 1;
	condition = dia_grim_hallo_condition;
	information = dia_grim_hallo_info;
	permanent = 0;
	description = "� ���������.";
};


func int dia_grim_hallo_condition()
{
	if(GRIM_PROTECTIONBULLY == TRUE)
	{
		FIRSTOVER = TRUE;
	};
	if(FIRSTOVER == FALSE)
	{
		return 1;
	};
};

func void dia_grim_hallo_info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//� ���������.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//�� ������� �����, �����? � ����. ���� ��������� ���� � ������� ���������.
};


instance DIA_GRIM_LEBEN(C_INFO)
{
	npc = vlk_580_grim;
	nr = 2;
	condition = dia_grim_leben_condition;
	information = dia_grim_leben_info;
	permanent = 0;
	description = "� ��� ����� �������?";
};


func int dia_grim_leben_condition()
{
	return 1;
};

func void dia_grim_leben_info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//� ��� ����� �������?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//�������� ������, ���� ������� ���������� �� ������.
};


instance DIA_GRIM_AUFNAHME(C_INFO)
{
	npc = vlk_580_grim;
	nr = 3;
	condition = dia_grim_aufnahme_condition;
	information = dia_grim_aufnahme_info;
	permanent = 0;
	description = "� ���� ���� �������� � ���� ������. ��� ��� ����� �������?";
};


func int dia_grim_aufnahme_condition()
{
	if(KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_aufnahme_info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//� ���� ���� �������� � ���� ������. ��� ��� ����� �������?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//������� �� ������ ����� ���������. ��� ����� ���� ����� ���������� ���������� ������ �� ����������� �����.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//�� ����� ����� � �� ��������� � �����. ������, � ��� � ������. ����� ��� �������.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//�������, ��� � ���� ���������, �� ���� �����-������ ������ �������. � ��������� ��������� ���� �������� ��� ���� ���������.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//���� �� ����������, ���� ������ � ������.
};


var int grim_tests;

instance DIA_GRIM_HOWFARAREYOU(C_INFO)
{
	npc = vlk_580_grim;
	nr = 4;
	condition = dia_grim_howfarareyou_condition;
	information = dia_grim_howfarareyou_info;
	permanent = 1;
	description = "��� �������� ���� ���������?";
};


func int dia_grim_howfarareyou_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_aufnahme) && Npc_KnowsInfo(hero,info_diego_rules) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_howfarareyou_info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//��� �������� ���� ���������?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//� ��� ������������ � ���������, ����� � ���������.
	if(!GRIM_TESTS)
	{
		b_logentry(CH1_JOINOC,"�������, ���� � ������� ����� ����������� �� ���������.");
		GRIM_TESTS = TRUE;
	};
};


instance DIA_GRIM_YOURPDV(C_INFO)
{
	npc = vlk_580_grim;
	nr = 5;
	condition = dia_grim_yourpdv_condition;
	information = dia_grim_yourpdv_info;
	permanent = 0;
	description = "� ��� ����������� ���� ���������?";
};


func int dia_grim_yourpdv_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_aufnahme) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_grim_yourpdv_info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//� ��� ����������� ���� ���������?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//����� � �� ���� ���� �������. � ����� ����� ����� �� �������!
};


instance DIA_GRIM_INEXTREMO(C_INFO)
{
	npc = vlk_580_grim;
	nr = 1;
	condition = dia_grim_inextremo_condition;
	information = dia_grim_inextremo_info;
	permanent = 0;
	important = 1;
};


func int dia_grim_inextremo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grim_inextremo_info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//��, ������ �������?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//����� In Extremo! ��� ����� ��������� �� �����.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//��������! ���� ����� ���������� �� �����������.
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};

