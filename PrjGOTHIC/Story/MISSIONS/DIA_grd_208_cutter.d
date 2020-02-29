
instance DIA_CUTTER_EXIT(C_INFO)
{
	npc = grd_208_cutter;
	nr = 999;
	condition = dia_cutter_exit_condition;
	information = dia_cutter_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_cutter_exit_condition()
{
	return 1;
};

func void dia_cutter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_HELLO(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_hello_condition;
	information = dia_cutter_hello_info;
	permanent = 0;
	description = "��, ����� ������� �����.";
};


func int dia_cutter_hello_condition()
{
	if(!c_npcbelongstooldcamp(other) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_cutter_hello_info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//��, ����� ������� �����.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//������ � ���� ����� �� �����. ��� ��?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//� ����� �������. ���� ������� ��������� ��� �����.
};


instance DIA_CUTTER_BURG(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_burg_condition;
	information = dia_cutter_burg_info;
	permanent = 0;
	description = "�� ������ ���������� ��� ���-������ � �����?";
};


func int dia_cutter_burg_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_hello) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_cutter_burg_info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//�� ������ ���������� ��� ���-������ � �����?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//����� �������� ��������� �� ��� ����� ������� � ��� ������. ������ ����� ������ �� ����� ������������ � ����.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//� ��� ����� �����, ��� ����� ����� ����� �������������� � ������.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//��� � �� �������, ����� ��� �� ������ � ����������� � �������� �� �����, �� ��� ����� ����������� ����� �����������.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//��� ��� ������ ���� ����������?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//��, �� ������ ��� �����. �� ������ ��������� ���� ����� �� ���������.
};


instance DIA_CUTTER_PERM(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_perm_condition;
	information = dia_cutter_perm_info;
	permanent = 1;
	description = "��� ������� ����� ����������?";
};


func int dia_cutter_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_burg) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_cutter_perm_info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//��� ������� ����� ����������?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//�������� �������. ��� ������ ���������� � �������. � ���� ����� �� ���������.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//� ��� �����.
	AI_StopProcessInfos(self);
};


instance GRD_208_CUTTER_WELCOME(C_INFO)
{
	npc = grd_208_cutter;
	condition = grd_208_cutter_welcome_condition;
	information = grd_208_cutter_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_208_cutter_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void grd_208_cutter_welcome_info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//�� ������ ���������� �������. �����, ���� ���������� ���� ����������.
	AI_StopProcessInfos(self);
};

instance INFO_CUTTER_DIE(C_INFO)
{
	npc = grd_208_cutter;
	condition = info_cutter_die_condition;
	information = info_cutter_die_info;
	permanent = 0;
	important = 1;
};


func int info_cutter_die_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void info_cutter_die_info()
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
		AI_Output(hero,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//� ��� �� ��������?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//�� ������ �����-�� ���� � ����� �������, ��?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//������, �� � ��� ���...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//� �� �����, ��� ��� ����� ������������ �����?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//�������� ����� ���� ���� �����...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//���������� ������ �������.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//��� ����, ���������!
		if(Npc_KnowsInfo(hero,info_fletcher_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"�����, ������� ������ �������� ������� ������, ����� ���� ����� ��� ��, ��� � �������. �� ���-�� ����� � ���, ��� � ��� ������� ��� ������ ������.");
		}
		else if(!Npc_KnowsInfo(hero,info_jackal_payday) && !Npc_KnowsInfo(hero,info_fletcher_die) && !Npc_KnowsInfo(hero,info_grd238_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"�����, ������� ������ ������ � ������� ���������� �������� �������� ������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
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
	if(GETNEWGUY_STARTED == TRUE && OC_BANNED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	b_setpermattitude(grd_208_cutter,ATT_HOSTILE);
	b_setpermattitude(grd_232_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_229_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_216_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_217_torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_fletcher_die) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		b_logentry(CH4_FIREMAGES,"������ � ������ ������ ������� � ���������� �����������. ��� �������� �� ������, ��� �������� ������� �����������, ����� ������� � ���.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
};

