
instance DIA_SCORPIO_EXIT(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 999;
	condition = dia_scorpio_exit_condition;
	information = dia_scorpio_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scorpio_exit_condition()
{
	return 1;
};

func void dia_scorpio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCORPIO_HELLO(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 1;
	condition = dia_scorpio_hello_condition;
	information = dia_scorpio_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_scorpio_hello_condition()
{
	if(!c_npcbelongstooldcamp(other) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_scorpio_hello_info()
{
	AI_Output(self,other,"DIA_Scorpio_Hello_13_00");	//��� ��������� ����?
	if(THORUS_PASSGATE == TRUE)
	{
		AI_Output(other,self,"DIA_Scorpio_Hello_15_01");	//�����.
	}
	else
	{
		AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//�����. ��� ���� �� ������� ������.
	};
	AI_Output(self,other,"DIA_Scorpio_Hello_13_02");	//� ��� ���� ����� �����?
	Info_ClearChoices(dia_scorpio_hello);
	Info_AddChoice(dia_scorpio_hello,"������ ���������� ����������.",dia_scorpio_hello_justlooking);
	if(Npc_HasItems(hero,cronos_brief))
	{
		Info_AddChoice(dia_scorpio_hello,"� ���� ���� ������ �� ����� ����.",dia_scorpio_hello_cronosbrief);
	};
	if(Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02))
	{
		Info_AddChoice(dia_scorpio_hello,"� ���� ���� �������� ��� �����.",dia_scorpio_hello_mages);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		Info_AddChoice(dia_scorpio_hello,"� ������ �������� ��� ������.",dia_scorpio_hello_kraut);
	};
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez))
	{
		Info_AddChoice(dia_scorpio_hello,"� ���� ����������� � �������. � ��������� �������������� � ���.",dia_scorpio_hello_join);
	};
};

func void dia_scorpio_hello_cronosbrief()
{
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//� ���� ���� ������ �� ����� ����.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//�� ��������� �� �����? �� ��� ��� ��� �������� ����...
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_justlooking()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00");	//������ ���������� ����������.
	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01");	//���������.
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_mages()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00");	//� ���� ���� �������� ��� �����.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//�� ��������� �� �����? �� ��� ��� ��� �������� ����...
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
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_kraut()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00");	//� ������ �������� ��� ������.
	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01");	//����� ������ ��� � ���, ������� ���������� ����� �����������.
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_join()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00");	//� ���� ����������� � �������. � ��������� �������������� � ���.
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01");	//��? � �� ��� �������, ��� ������� � ��� ��������������?
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02");	//�������� ���� ��������...
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03");	//�������� ����� ������ �� ������. ����� ������ ���� ����� ����� ���.
	Info_ClearChoices(dia_scorpio_hello);
};


instance DIA_SCORPIO_REFUSETRAIN(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 1;
	condition = dia_scorpio_refusetrain_condition;
	information = dia_scorpio_refusetrain_info;
	permanent = 1;
	description = "�� ������ ������� ���� ���������?";
};


func int dia_scorpio_refusetrain_condition()
{
	if(Npc_KnowsInfo(hero,dia_scorpio_hello) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_scorpio_refusetrain_info()
{
	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00");	//�� ������ ������� ���� ���������?
	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01");	//� �������� ������ ����������. �� ������� ������������� � ���� ������ �����, ����� ����� �������� ���� ����������.
};


instance GRD_205_SCORPIO_WELCOME(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_welcome_condition;
	information = grd_205_scorpio_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_205_scorpio_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_welcome_info()
{
	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01");	//�� ������ ������� �����, ����� ������� �������������� � ���.
	AI_StopProcessInfos(self);
};


instance GRD_205_SCORPIO_CROSSBOW(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_crossbow_condition;
	information = grd_205_scorpio_crossbow_info;
	important = 0;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int grd_205_scorpio_crossbow_condition()
{
	if(((KAPITEL >= 4) || (Npc_GetTrueGuild(hero) == GIL_GRD)) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_crossbow_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02");	//���� � ���� ���� ����, �� � ���� ������� ���� �������� �� ��������. ��� ����� ������ 200 ������.
	if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL < 4))
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"������� ����� ������� ���� �������� �� ��������.");
		LOG_SCORPIOCROSSBOW = TRUE;
	}
	else if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL >= 4))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"������� ����� ������� ���� �������� �� ��������.");
		LOG_SCORPIOCROSSBOW = TRUE;
	};
	Info_ClearChoices(grd_205_scorpio_crossbow);
	Info_AddChoice(grd_205_scorpio_crossbow,DIALOG_BACK,grd_205_scorpio_crossbow_back);
	Info_AddChoice(grd_205_scorpio_crossbow,b_buildlearnstring(NAME_LEARNCROSSBOW_1,LPCOST_TALENT_CROSSBOW_1,200),grd_205_scorpio_crossbow_ok);
};

func void grd_205_scorpio_crossbow_back()
{
	Info_ClearChoices(grd_205_scorpio_crossbow);
};

func void grd_205_scorpio_crossbow_ok()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01");	//��� �������. ����� ���� �������� �� ��������.
	if(Npc_HasItems(hero,itminugget) >= 200)
	{
		if(b_giveskill(other,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02");	//������, ������ ����� ������.
			b_printtrademsg1("������ ����: 200");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03");	//������ �������� ��������. �� ���������� ������� � �����, ��� ������� ���� ������ �����������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04");	//������� ���� ����� ����� ������ �������� � ������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05");	//�� ����� ������ ���������� �� ��� ���� �� �������!
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06");	//��������� � ������� �� �����. ���� ����� ������� �������, ��� ������, � ������� ������� ����������� �����!
			b_giveinvitems(other,self,itminugget,200);
			grd_205_scorpio_crossbow.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07");	//��� ����� ������ � �� ������ ������. ���� �� ��� �� ���������, � ������ ���� �� �����.
	};
};


instance GRD_205_SCORPIO_CROSSBOW2(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_crossbow2_condition;
	information = grd_205_scorpio_crossbow2_info;
	important = 0;
	permanent = 1;
	description = "� ���� ��������� ��� ����� �������� �� ��������.";
};


func int grd_205_scorpio_crossbow2_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1)
	{
		return TRUE;
	};
};

func void grd_205_scorpio_crossbow2_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01");	//� ���� ��������� ��� ����� �������� �� ��������.
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02");	//��� ����� ������ 300 ������ ����.
	if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL < 4))
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"������� ����� ������� ���� �������� �� ��������.");
		LOG_SCORPIOCROSSBOW = TRUE;
	}
	else if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL >= 4))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"������� ����� ������� ���� �������� �� ��������.");
		LOG_SCORPIOCROSSBOW = TRUE;
	};
	Info_ClearChoices(grd_205_scorpio_crossbow2);
	Info_AddChoice(grd_205_scorpio_crossbow2,DIALOG_BACK,grd_205_scorpio_crossbow2_back);
	Info_AddChoice(grd_205_scorpio_crossbow2,b_buildlearnstring(NAME_LEARNCROSSBOW_2,LPCOST_TALENT_CROSSBOW_2,300),grd_205_scorpio_crossbow2_ok);
};

func void grd_205_scorpio_crossbow2_back()
{
	Info_ClearChoices(grd_205_scorpio_crossbow2);
};

func void grd_205_scorpio_crossbow2_ok()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
	if(Npc_HasItems(hero,itminugget) >= 300)
	{
		if(b_giveskill(other,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2))
		{
			b_printtrademsg1("������ ����: 300");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02");	//������������ �������� ������� � ���, ��� �������� �������� ���������� ��� �������� � ������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03");	//�� ���� ����� ��������� ��������� ��������� �������� ����������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04");	//������� ������ ���� ��������� �� ���� ��� ��������, ����� �� ������� � ���� �������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05");	//���� � ���� ��������� �����, �� ��������� �� ����� �� ���, �� ���� �� ��� ���������� ����� �� �������.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06");	//� ������ ���� �����, ��� ���� ���.
			b_giveinvitems(other,self,itminugget,300);
			grd_205_scorpio_crossbow2.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07");	//����� ��� ������� ������ ������ ����.
	};
};


instance GRD_205_SCORPIO_HEYPC(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_heypc_condition;
	information = grd_205_scorpio_heypc_info;
	important = 1;
	permanent = 0;
};


func int grd_205_scorpio_heypc_condition()
{
	if((KAPITEL >= 4) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_heypc_info()
{
	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01");	//��, �� �����, ������� �� ���!
};


instance GRD_205_SCORPIO_BANISHED(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_banished_condition;
	information = grd_205_scorpio_banished_info;
	important = 0;
	permanent = 0;
	description = "� ���� ��� � �������?";
};


func int grd_205_scorpio_banished_condition()
{
	if(Npc_KnowsInfo(hero,grd_205_scorpio_heypc))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_banished_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01");	//� ���� ��� � �������?
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02");	//����� ���� ������ ����� �����. ���� �� ���������� ����, ������� ������������ ���������.
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03");	//�� � ����� ��������� ���-��� �� ��������. ���� ���� ����� ������� ������, ������ �����.
	if(SCORPIO_EXILE == FALSE)
	{
		Log_CreateTopic(GE_TRADEROW,LOG_NOTE);
		b_logentry(GE_TRADEROW,"������� ������� ������ ������ ��-�� ����, ��� ��� ���������. ������ �� ����� � ���� ������ � ����������, �� ������ ����� ������ � ����� ��������.");
		SCORPIO_EXILE = TRUE;
	};
};


instance GRD_205_SCORPIO_TRADE(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_trade_condition;
	information = grd_205_scorpio_trade_info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int grd_205_scorpio_trade_condition()
{
	if(Npc_KnowsInfo(hero,grd_205_scorpio_banished))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_trade_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01");	//������ ��� ���� ������.
};

