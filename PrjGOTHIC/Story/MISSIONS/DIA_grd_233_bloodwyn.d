
instance INFO_BLOODWYN_EXIT_SCHUTZGELD(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 999;
	condition = info_bloodwyn_exit_schutzgeld_condition;
	information = info_bloodwyn_exit_schutzgeld_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_bloodwyn_exit_schutzgeld_condition()
{
	return 1;
};

func void info_bloodwyn_exit_schutzgeld_info()
{
	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00");	//�� �������!
	if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01");	//���� ��������� �����!
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02");	//�� � ��� �� ����������. �� ����������� � ����� ������������.
	};
	AI_StopProcessInfos(self);
};


instance INFO_BLOODWYN_HELLO(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_hello_condition;
	information = info_bloodwyn_hello_info;
	permanent = 0;
	important = 1;
};


func int info_bloodwyn_hello_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_bloodwyn_hello_info()
{
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00");	//��, ��!
	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01");	//�� ������ ����������?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02");	//���� ������������ ����! ���������� �� ������ ���������, ������?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03");	//����������� ���, ��� ���� ��������, ������� � ������.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04");	//��� ������, ��� �� ��� ���������. �� �� ��������� ������� ���������.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05");	//���e� �����, ����� � ������ ���� ��������, � �� ������ �� ����. �� ��� ������ �� �� ������.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06");	//��� ������� � ��������� ���� ���������� ��-�������� ����� � ������� �� ���� �����. �� �������� ��� - �� ������� ����, ���� � ���� ��������� ��������.
	Info_ClearChoices(info_bloodwyn_hello);
	Info_AddChoice(info_bloodwyn_hello,"������ �� � ���? ������� ���� ���� �����?",info_bloodwyn_hello_howmuch);
	Info_AddChoice(info_bloodwyn_hello,"� ������ ������� ������ �� ������? ��� ��...",info_bloodwyn_hello_forgetit);
	Info_AddChoice(info_bloodwyn_hello,"�� ��� ���������?",info_bloodwyn_hello_solldrohungsein);
};

func void info_bloodwyn_hello_forgetit()
{
	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00");	//� ������ ������� ������ �� ������? ��� ��, �������, � � ��� � ���� ����������!
	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01");	//��� ������. ���� �����, �� ��� ���������, ��� ��������� �� ����� ���������� �����������.
	BLOODWYN_PROTECTIONPAID = FALSE;
	HEREK_PROTECTIONBULLY = TRUE;
	GRIM_PROTECTIONBULLY = TRUE;
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};

func void info_bloodwyn_hello_solldrohungsein()
{
	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00");	//�� ��� ���������?
	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01");	//��������! � ��������� ���� ������!
};

func void info_bloodwyn_hello_howmuch()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01");	//������ �� � ���? ������� ���� ���� �����?
	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02");	//�� ��� �����. ����� ������ ������.
	Info_ClearChoices(info_bloodwyn_hello);
	Info_AddChoice(info_bloodwyn_hello,"������ � ���� ��� ������ ������.",info_bloodwyn_hello_notnow);
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		Info_AddChoice(info_bloodwyn_hello,"��� ���� ����. ���� ������ ����� �����������.",info_bloodwyn_hello_oktakeit);
	};
};

func void info_bloodwyn_hello_oktakeit()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00");	//��� ���� ����. ���� ������ ����� �����������.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01");	//� �� ����� ������. ������ �� ������ �� ���� ����������. � ���� �������� ����.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02");	//�� ��� ��� �� ������, ��� ���� ����� ����� ��� ���������, ��� �������?
	b_giveinvitems(other,self,itminugget,10);
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};

func void info_bloodwyn_hello_notnow()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//������ � ���� ��� ������ ������.
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01");	//��, ����� � ������ � ���� ��, ��� ����. ��������� ������ � ��������� ���.
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02");	//��-��, ���������...
	if(Npc_HasItems(other,itminugget) > 0)
	{
		if(Npc_HasItems(other,itminugget) > 9)
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00");	//��� � ��� ��� ����? ����� ���-�� �� ����� ������� �� ������, ��?
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01");	//� ������ ������ ���, ��� � ���� ����. ����� � ������, ��� �� ������� ���� ��������.
			b_giveinvitems(other,self,itminugget,Npc_HasItems(other,itminugget));
		}
		else
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00");	//��, � ���� ���� ����, �� ��� ������ � �����. �������, �� ���������� �������. �������.
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01");	//������ � ���� ������������ �� �����, ���� �� ������ � ������.
			b_giveinvitems(other,self,itminugget,Npc_HasItems(other,itminugget));
		};
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00");	//� ���� ������ ������ ���... ��, ��� � ������, ��������� � ��������� ���...
	};
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};


instance INFO_BLOODWYN_PAYDAY(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_payday_condition;
	information = info_bloodwyn_payday_info;
	permanent = 1;
	important = 1;
};


func int info_bloodwyn_payday_condition()
{
	if((KAPITEL <= 2) && (BLOODWYN_PAYDAY <= (Wld_GetDay() - 1)) && (Npc_HasItems(other,itminugget) >= 10) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void info_bloodwyn_payday_info()
{
	if(BLOODWYN_PROTECTIONPAID == TRUE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00");	//������, ��� � ���� ��������!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01");	//�� ������ ��� ������ ������ �� ������ - ������� �����. �� ������ �������?
		Info_ClearChoices(info_bloodwyn_payday);
		Info_AddChoice(info_bloodwyn_payday,"���, ������ ������ ������. ��� ����� �� �����.",info_bloodwyn_payday_payagain);
		Info_AddChoice(info_bloodwyn_payday,"� ������ �� ���� �������. �� � ��� ������� � ���� ������� �����.",info_bloodwyn_payday_paynomore);
	}
	else if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00");	//��, ��!
		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01");	//��� ��� ���� �� ���� �����?
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02");	//� ���� ���� ����������� ��������, ��� �� ������.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03");	//�����-�� ������ ������ ����, �� ��������?
	};
	BLOODWYN_PAYDAY = b_setdaytolerance();
};

func void info_bloodwyn_payday_payagain()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00");	//���, ������ ������ ������. ��� ����� �� �����.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01");	//� ���� ��� �����.
	b_giveinvitems(other,self,itminugget,10);
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	Info_ClearChoices(info_bloodwyn_payday);
};

func void info_bloodwyn_payday_paynomore()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00");	//� ������ �� ���� �������. �� � ��� ������� � ���� ������� �����.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01");	//�� ���� �����������. � ����� ������� ���������. ������ ���� ������ �������� �������� ���� �� ���, ��� ������� �������� ��� ����� ����.
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02");	//� � ��� ����� �������� ����.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03");	//��� �� ���������...
	BLOODWYN_PROTECTIONPAID = FALSE;
	HEREK_PROTECTIONBULLY = TRUE;
	GRIM_PROTECTIONBULLY = TRUE;
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(info_bloodwyn_payday);
};


instance INFO_BLOODWYN_DOCH(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_doch_condition;
	information = info_bloodwyn_doch_info;
	permanent = 1;
	description = "� ���������. � ������� ���� ������ ������ ����.";
};


func int info_bloodwyn_doch_condition()
{
	if(BLOODWYN_PROTECTIONPAID == FALSE && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void info_bloodwyn_doch_info()
{
	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00");	//� ���������. � ������� ���� ������ ������ ����.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01");	//��� ������! �� ���-���� ������ ��������� ���������� �������.
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02");	//� ������ �� ������ ������� ��� �� ������ ������ ����, ��?
		b_giveinvitems(other,self,itminugget,10);
		BLOODWYN_PROTECTIONPAID = TRUE;
		HEREK_PROTECTIONBULLY = FALSE;
		GRIM_PROTECTIONBULLY = FALSE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		BLOODWYN_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00");	//��� �������, ����� �������� ����� ������� ���.
		AI_StopProcessInfos(self);
	};
};


instance INFO_BLOODWYN_PAYFORJESSE(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 5;
	condition = info_bloodwyn_payforjesse_condition;
	information = info_bloodwyn_payforjesse_info;
	permanent = 1;
	description = "����� ������ ���� ��������� �� ���� ������ ������ ����.";
};


func int info_bloodwyn_payforjesse_condition()
{
	if(JESSE_PAYFORME == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_bloodwyn_payforjesse_info()
{
	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00");	//����� ������ ���� ��������� �� ���� ������ ������ ����.
	if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01");	//�� �� ����� ������� �� ���� ��������.
	};
	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02");	//������ �� ���� ������. �� �� �������� �������, ���������.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03");	//���, � ��� �� ������� �� ����. ��� ���� ������ ������ � ������ ��� � �����.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04");	//��� ������, ���� ����.
		b_giveinvitems(other,self,itminugget,10);
		JESSE_PAYFORME = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05");	//�! �������, ���� ���� �� ������.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06");	//��, ���� ���� ������ ����. ������� ����������, ����� ���� ������� ���� �� ������-�� ����������?
	};
};


instance GRD_233_BLOODWYN_WELCOME(C_INFO)
{
	npc = grd_233_bloodwyn;
	condition = grd_233_bloodwyn_welcome_condition;
	information = grd_233_bloodwyn_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_233_bloodwyn_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_233_bloodwyn_welcome_info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01");	//������ �� ���� �� ���. �������. ��� ����� ����� ���� ��� ��.
};


instance INFO_BLOODWYN_DIE(C_INFO)
{
	//npc = grd_233_bloodwyn;
	condition = info_bloodwyn_die_condition;
	information = info_bloodwyn_die_info;
	permanent = 0;
	important = 1;
};


func int info_bloodwyn_die_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void info_bloodwyn_die_info()
{
	AI_GotoNpc(self,hero);
	if((OLDHEROGUILD == GIL_STT) || (OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF))
	{
		if(OLDHEROGUILD == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//����� ��� �������� ���������! � �� ��� �������� ���� ����������!
		}
		else if(OLDHEROGUILD == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//������, ������ �� �������� ����� ���� �� ����������!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//���� �� ��������� �������� ����������!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04");	//������. �������, � ��� �� ��������?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//�� ������ �����-�� ���� � ����� �������, ��?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//������, �� � ��� ���...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//� �� �����, ��� ��� ����� ������������ �����?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//�������� ����� ���� ���� �����...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//���������� ������ �������.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//��� ����, ���������!
		if(Npc_KnowsInfo(hero,info_fletcher_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"�������, ������� ������ �������� ������� ������, ����� ���� ����� ��� ��, ��� � �������. �� ���-�� ����� � ���, ��� � ��� ������� ��� ������ ������.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"�������, ������� ������ ������ � ������� ���������� �������� �������� ������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
			b_logentry(CH4_BANNEDFROMOC,"�������, ���� �������� �� ������� ������!");
		};
	}
	else
	{
		if(c_npcbelongstonewcamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//� ��� ��� �� ��������� ����� �� ������ ������? ���������� ��������!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//� �� ������� ����� �� ������ ��������� ������? ��� ����� � ����� �������!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//��� �����? � ��� �� ��������?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//��� �� ������ �� ������ � ��������� �� ����� �����, ��?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//� ��� ��...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//������, �� �� �� ����� ��������� ���� ����������� �����. �� ������ ������� �����!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//��, � �� ���� ������� � �����...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//�� ���� ������ ����� ���� ������!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//���, � ���� ������...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//� ������, ������! ����� ���!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	b_exchangeroutine(grd_232_gardist,"FMTaken2");
	b_exchangeroutine(grd_229_gardist,"FMTaken2");
	b_exchangeroutine(grd_216_torwache,"FMTaken2");
	b_exchangeroutine(grd_217_torwache,"FMTaken2");
	b_setpermattitude(grd_233_bloodwyn,ATT_HOSTILE);
	b_setpermattitude(grd_232_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_229_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_216_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_217_torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_fletcher_die))
	{
		b_logentry(CH4_FIREMAGES,"������ � ������ ������ ������� � ���������� �����������. ��� �������� �� ������, ��� �������� ������� �����������, ����� ������� � ���.");
	};
	AI_StopProcessInfos(self);
};

