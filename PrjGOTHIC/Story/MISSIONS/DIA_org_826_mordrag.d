
var int mordragko_playerchoseorebarons;
var int mordragko_playerchosethorus;
var int mordragko_hauab;
var int mordragko_stayatnc;

instance ORG_826_MORDRAG_EXIT(C_INFO)
{
	npc = org_826_mordrag;
	nr = 999;
	condition = org_826_mordrag_exit_condition;
	information = org_826_mordrag_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_826_mordrag_exit_condition()
{
	return 1;
};

func void org_826_mordrag_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_826_MORDRAG_GREET(C_INFO)
{
	npc = org_826_mordrag;
	nr = 1;
	condition = org_826_mordrag_greet_condition;
	information = org_826_mordrag_greet_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_greet_condition()
{
	return 1;
};

func void org_826_mordrag_greet_info()
{
	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00");	//��, ���������! � �������. ������� ����. � ������ ������������ ������ �� ������ ����.
};


instance ORG_826_MORDRAG_TRADE(C_INFO)
{
	npc = org_826_mordrag;
	nr = 800;
	condition = org_826_mordrag_trade_condition;
	information = org_826_mordrag_trade_info;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int org_826_mordrag_trade_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_greet) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01");	//������...
	if(MORDRAG_TRADED == 0)
	{
		if(KAPITEL > 3 || Npc_KnowsInfo(hero,org_801_lares_gotokalom))
		{
			Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
			b_logentry(GE_TRADERNC,"��� ������� ������� ���������� ����� � ���� �� �����.");
		}
		else
		{
			Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
			b_logentry(GE_TRADEROC,"��� ������� ������� �� �������� ������� ���������� �����.");
		};
		MORDRAG_TRADED = 1;
	};
};


instance ORG_826_MORDRAG_COURIER(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_courier_condition;
	information = org_826_mordrag_courier_info;
	permanent = 0;
	description = "�� ������������� ���� �� ������ �����?";
};


func int org_826_mordrag_courier_condition()
{
	if(THORUS_MORDRAGMAGEMESSENGER)
	{
		return 1;
	};
};

func void org_826_mordrag_courier_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00");	//�� ������������� ���� �� ������ �����?
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01");	//� ��� ���� ���?
	//AI_Output(other,self,"Org_826_Mordrag_Courier_15_02");	//� �� ����� ���������� � ������. ��� ����� ������� � �����.
	Info_ClearChoices(org_826_mordrag_courier);
	if(Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02))
	{
		Info_AddChoice(org_826_mordrag_courier,"��� ����� ������� � �����. � ���� ���� ������...",org_826_mordrag_courier_letter);
	};
	Info_AddChoice(org_826_mordrag_courier,"�� � ������ ��� �������.",org_826_mordrag_courier_notletter);
	
};

func void org_826_mordrag_courier_letter()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//��� ����� ������� � �����. � ���� ���� ������ ��� ���������� ���� ����� ����.
	if(Npc_GetDistToWP(hero,"OCR_OUTSIDE_HUT_44") < 1500 || Npc_GetDistToWP(hero,"OCR_OUTSIDE_MCAMP_01") < 1500)
	{
		AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//��... ����!
		AI_PlayAni(self,"T_SEARCH");
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
	};
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03");	//���������� ����� ����� ������, ������� ������ ���������. �� ������� �������� ��, ���� ������� ����� �� ���.
	Info_ClearChoices(org_826_mordrag_courier);
};

func void org_826_mordrag_courier_notletter()
{
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03");	//�� � ������ ��� �������.
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03");	//���������� ����� ����� ������, ������� ������ ���������. �� ������� �������� ��, ���� ������� ����� �� ���.
	Info_ClearChoices(org_826_mordrag_courier);
};

instance ORG_826_MORDRAG_PROBLEM(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_problem_condition;
	information = org_826_mordrag_problem_info;
	permanent = 0;
	description = "� ���� ��������.";
};


func int org_826_mordrag_problem_condition()
{
	if(THORUS_MORDRAGKO == LOG_RUNNING)
	{
		return 1;
	};
};

func void org_826_mordrag_problem_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00");	//� ���� ��������.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01");	//������? � � ���� �� ���?
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02");	//���� ����, ������� �� �������� ���� ����������� �����. ��� ����� ���������� �� ����.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03");	//�� �� ���? ����� ��� ������ ����� ��������� �� ��� ����-������, ����� ������ �� ������!
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04");	//� ������ �� ������, ��� ��� ������ �� ���������? ��������, ��� ����� ������� ����...
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05");	//������ ��� ��� �������, ��� �� �� ����� �� ������. �� ����� �������, ��� � ������� ���� ����� ���������� ����, ��� ������ �� ������.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		AI_Output(self,other,"Org_826_Mordrag_Problem_11_06");	//� ��� � ����� ������ ���� ����� ��������� ����. � ��� ��� ��� ������, ��� ����� ��������� ����, ��� �����, � ��� ������.
	};
};


instance ORG_826_MORDRAG_NCINFO(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_ncinfo_condition;
	information = org_826_mordrag_ncinfo_info;
	permanent = 0;
	description = "�������� ��� ���-������ � ����� ������.";
};


func int org_826_mordrag_ncinfo_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_problem) || (Npc_KnowsInfo(hero,org_826_mordrag_courier) && !c_npcbelongstonewcamp(hero) && (KAPITEL < 4) && (MORDRAGKO_HAUAB != TRUE)))
	{
		return 1;
	};
};

func void org_826_mordrag_ncinfo_info()
{
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00");	//�������� ��� ���-������ � ����� ������.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01");	//� ����� ������ ����� ��������� ����. ������� ������� ��� ����, ������� ������ ��������.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02");	//� ��� ���� ���� �����. � ��� �� �� ���������� ������� ���� ������!
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03");	//� ����� ��� ��� �����?
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04");	//���� ���� ���� ������ ���������� �������. ��� ��� ����� �� � �������� ���� ����.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05");	//���� ����� � ��� ���� ��������� ��� ����, �� ��������� ��� ���� ���, ����� � ����� ������ �������� �������.
};


instance ORG_826_MORDRAG_JOINNEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_joinnewcamp_condition;
	information = org_826_mordrag_joinnewcamp_info;
	permanent = 0;
	description = "� ���� � ������ �������������� � ������ ������... �� �������� ���?";
};


func int org_826_mordrag_joinnewcamp_condition()
{
	if((Npc_KnowsInfo(hero,org_826_mordrag_problem) || Npc_KnowsInfo(hero,org_826_mordrag_courier)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_joinnewcamp_info()
{
	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00");	//� ���� � ������ �������������� � ������ ������... �� �������� ���?
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01");	//���� �� ����� ������������� ������, �� ����� ����� ���� ����� ������. � ������ ���� � �����. �� ����� ����� �����.
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02");	//�� ���� �� ������ ������ �������� ���� �� ������, ����������, ��������!
};


instance ORG_826_MORDRAG_GOTONEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_gotonewcamp_condition;
	information = org_826_mordrag_gotonewcamp_info;
	permanent = 0;
	description = "����� ������ � ����� ������!";
};


func int org_826_mordrag_gotonewcamp_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_joinnewcamp) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_gotonewcamp_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00");	//����� ������ � ����� ������!
	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01");	//������! ��� �� ����.
	MORDRAG_GOTONC_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_FRIENDLY);
	self.flags = NPC_FLAG_IMMORTAL;
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
		b_logentry(CH1_JOINNC,"������� ���������� �������� ��� ������ � ����� ������. �������, �� �� ��������� ��� �������!");
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance ORG_826_MORDRAG_ATNEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_atnewcamp_condition;
	information = org_826_mordrag_atnewcamp_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_atnewcamp_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_gotonewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21"))
	{
		self.flags = 0;
		return 1;
	};
};

func void org_826_mordrag_atnewcamp_info()
{
	var C_NPC lares;
	if(MORDRAG_GOTONC_DAY > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00");	//��� �� � �� �����.
	}
	else
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00");	//� �����, ��� �� ��� ������� �� �������. ��� ��� �������, �� ������.
	};
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01");	//���� �������� ����� ��� ������, �� �������� ����� � ����� ������. �������� � ������. �� ������� ����. ��� ���� ������.
	b_printtrademsg1("�������� ������ ��������.");
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02");	//��� ����� ����� ��������� � ����. ���� �� ������ �������� � ������ ���������.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03");	//� ��� ������� � ����� �������� ����� ���������. � ���������� ���������. � ���� ��, ���������� � ������ ������ ��������� ����������.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04");	//���� �������� ���� �����, ����� � ���. �� ��������� �� �����. ��������. �� �������!
	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05");	//��� ��������!
	CreateInvItems(self,mordragsring,1);
	b_giveinvitems(self,other,mordragsring,1);
	b_givexp(XP_ARRIVEDWITHMORDRAG);
	b_logentry(CH1_JOINNC,"�� ����� ����� �������� � ����� ������. ������� ��� ��� ������, ������� ����� ������� �����, ������� �����. ��� �� �� ��������� ��������� �����, � ������.");
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
	MORDRAGKO_STAYATNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance ORG_826_MORDRAG_FIGHT(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_fight_condition;
	information = org_826_mordrag_fight_info;
	permanent = 0;
	description = "� ���� ������ ��������� ������ ���� �� ���!";
};


func int org_826_mordrag_fight_condition()
{
	if((THORUS_MORDRAGKO == LOG_RUNNING) && !Npc_KnowsInfo(hero,org_826_mordrag_gotonewcamp))
	{
		return 1;
	};
};

func void org_826_mordrag_fight_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00");	//� ���� ������ ��������� ������ ���� �� ���!
	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01");	//������, �� � �� ���������...
	Info_ClearChoices(org_826_mordrag_fight);
	Info_AddChoice(org_826_mordrag_fight,"����� �� ����� ������!",info_mordrag_fight_getaway);
	Info_AddChoice(org_826_mordrag_fight,"����� �� ����� ��� ���, ��� ������ ���� �������!",info_mordrag_fight_orebarons);
	Info_AddChoice(org_826_mordrag_fight,"���� ������� �����. �� ������ �� ����� ���� ����� ������.",info_mordrag_fight_thorus);
};

func void info_mordrag_fight_getaway()
{
	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00");	//����� �� ����� ������!
	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01");	//������� ������� ����� ��� ������ ���������, ��� ��...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void info_mordrag_fight_orebarons()
{
	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00");	//����� �� ����� ��� ���, ��� ������ ���� �������!
	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01");	//�, ��� �� � ���! ��� �� ����� � ������...
	MORDRAGKO_PLAYERCHOSEOREBARONS = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void info_mordrag_fight_thorus()
{
	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00");	//���� ������� �����. �� ������ �� ����� ���� ����� ������.
	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01");	//��? �����? ��� �, �� ������ ���, ��� ��� ���� �����...
	MORDRAGKO_PLAYERCHOSETHORUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance ORG_826_MORDRAG_HAUAB(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_hauab_condition;
	information = org_826_mordrag_hauab_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_hauab_condition()
{
	var C_NPC mordrag;
	mordrag = Hlp_GetNpc(org_826_mordrag);
	if((mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1) && (THORUS_MORDRAGKO == LOG_RUNNING))
	{
		return 1;
	};
};

func void org_826_mordrag_hauab_info()
{
	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00");	//�����...
	AI_StopProcessInfos(self);
	MORDRAGKO_HAUAB = TRUE;
	b_logentry(CH1_MORDRAGKO,"� ����� �������� � ������ ���, ��� �� �� ������ ������������ � ������ ������.");
	Npc_ExchangeRoutine(self,"Start");
};


instance ORG_826_MORDRAG_GOTOKALOM(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_gotokalom_condition;
	information = org_826_mordrag_gotokalom_info;
	permanent = 0;
	description = "���� ������� ���� ��������.";
};


func int org_826_mordrag_gotokalom_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_ORG) && (LARES_INFORMMORDRAG == LOG_RUNNING))
	{
		return 1;
	};
};

func void org_826_mordrag_gotokalom_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00");	//���� ������� ���� ��������.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01");	//��-��, ���������.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02");	//�� ����� �����, ��� �������� � ������ ���������.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03");	//� ���� ����� �������, ��� ��� ��� ������� ���� �����...
	b_logentry(CH1_JOINNC,"� ������� �������� ��, ��� ������ ��� ����. �� ���-�� ������� � ���, ��� ���� ����� ������� ����. �� ����, ��� �� ���� � ����!");
};


var int mordrag_gotokalom;

instance ORG_826_MORDRAG_GOTOKALOMNOW(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_gotokalomnow_condition;
	information = org_826_mordrag_gotokalomnow_info;
	permanent = 0;
	description = "���� ������, ����� � ����� ���� � ����������.";
};


func int org_826_mordrag_gotokalomnow_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_ORG) && Npc_KnowsInfo(hero,org_801_lares_gotokalom))
	{
		return TRUE;
	};
};

func void org_826_mordrag_gotokalomnow_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00");	//���� ������, ����� � ����� ���� � ����������.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01");	//��� ������... � ����, ��� ��� �� �������� ���� ���� ������.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02");	//��� � ������ ���� ������ ��� ���?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03");	//�����, � ���� ��� ���������. ������ �����������: ���� ����� ������, ���� ��� ��� ����� ���������.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04");	//� ����, ��� ��� �������� ����� �������� �����-�� ���������. ����� � �� ���� �� � ������ �������, �� ���� � ���� �����:
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05");	//���� ����� ������� ����. � ���� �� �����, ���� �� �� �����, ��� � ��� ����������. ���� ��� �������?
	b_logentry(CH1_GOTOPSICAMP,"������� ������ ���� � �������� ������ ����������� � ��������. ���� ������� �����-�� ���������, �� ��� ��� �����, �������� �������� �� �����.");
	b_givexp(XP_ASSISTMORDRAG);
	LARES_INFORMMORDRAG = LOG_SUCCESS;
	MORDRAG_GOTOKALOM = LOG_RUNNING;
	Info_ClearChoices(org_826_mordrag_gotokalomnow);
	Info_AddChoice(org_826_mordrag_gotokalomnow,"�� ������ �������� �����?",org_826_mordrag_gotokalomnow_precise);
	Info_AddChoice(org_826_mordrag_gotokalomnow,"� ��������, ��� ��� ����� �������.",org_826_mordrag_gotokalomnow_doit);
};

func void org_826_mordrag_gotokalomnow_precise()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00");	//�� ������ �������� �����?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01");	//�������� � ��������. � ��������� ����� ��� � ������ ���������, � �� ������� ��� �����. �� ������� �������.
	b_logentry(CH1_GOTOPSICAMP,"� ������ �������� � ������ ���������� � ����������� �� ����� ������. �� ������ �������� �� ������� ���, ����� ��� ��� � �������� ������. �������, ��� ����� ��������.");
};

func void org_826_mordrag_gotokalomnow_doit()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00");	//� ��������, ��� ��� ����� �������.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01");	//��� ������ �� ������� ���-������ ������, ����������� � ���.
	Info_ClearChoices(org_826_mordrag_gotokalomnow);
	AI_StopProcessInfos(self);
};


instance ORG_826_MORDRAG_RUNNING(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_running_condition;
	information = org_826_mordrag_running_info;
	permanent = 1;
	description = "� ����� ���-��� � ���������...";
};


func int org_826_mordrag_running_condition()
{
	if(MORDRAG_GOTOKALOM == LOG_RUNNING)
	{
		return 1;
	};
};

func void org_826_mordrag_running_info()
{
	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00");	//� ����� ���-��� � ���������...
	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01");	//��, ����� ���-������?
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		if(KAPITEL >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//��� ������� ������� ���������.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09");	//�� ����� ����! �� ��� ��� ������ � ����� �����������?
		}
		else
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06");	//��. ��� ��������� ���� �������� ���� � ������� ������ �����, ��������������� �� ��� ��������, � ���������� �������� �������.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07");	//������� � ��� ������ �� ������! ��� ��� �� ��� ��� �����, ��?
		};
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10");	//�������� �� ����������, ��� �� ����� ������.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11");	//��� ����. ����������, ����� ��� �������� ���� ������ ����������.
		MORDRAG_GOTOKALOM = LOG_SUCCESS;
		b_givexp(XP_REPORTTOMORDRAG);
		Log_SetTopicStatus(CH1_GOTOPSICAMP,LOG_SUCCESS);
		b_logentry(CH1_GOTOPSICAMP,"������� ������� ��� �������, ������ ��� ����������� � ��������� �� �����. �������, ��� ������ �� ���������� ���� ��������. � ������, ��� �������� ���� �������!");
	}
	else
	{
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02");	//� ���� �� ���� ������ ���������.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03");	//��� ������� �����...
	};
};

