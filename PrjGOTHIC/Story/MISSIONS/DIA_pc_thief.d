
func void b_diegolearn()
{
	Info_ClearChoices(info_diego_teach);
	Info_AddChoice(info_diego_teach,DIALOG_BACK,info_diego_teach_back);
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL > 3)
	{
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),info_diego_teach_str_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),info_diego_teach_str_1);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),info_diego_teach_dex_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),info_diego_teach_dex_1);
	}
	else
	{
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),info_diego_teach_str_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),info_diego_teach_str_1);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),info_diego_teach_dex_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),info_diego_teach_dex_1);
	};
};

var int diego_after_gamestart;

instance INFO_DIEGO_GAMESTART(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_gamestart_condition;
	information = info_diego_gamestart_info;
	permanent = 0;
	important = 1;
};


func int info_diego_gamestart_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void info_diego_gamestart_info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00");	//���� ����� �����.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01");	//� ����...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02");	//� �� ���� �����, ��� �� �����. �� ������ ��� �������� �����, � � ������������ �� ���������. ��� ������ ������ � �����.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03");	//���� �� ������ �������� � ����� � ���� ������ �����, ���� �������� ���������� �� ����. �������, ������� �� ������ � ����� �����, � ��� � �����, ����� �������� ����? ��, ��� ��� �� �������?
	Npc_ExchangeRoutine(cs_eskorte1,"flee");
	Npc_ExchangeRoutine(cs_eskorte2,"flee");
	b_kapitelwechsel(1);
};


instance INFO_DIEGO_EXIT_GAMESTART(C_INFO)
{
	npc = pc_thief;
	nr = 999;
	condition = info_diego_exit_gamestart_condition;
	information = info_diego_exit_gamestart_info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int info_diego_exit_gamestart_condition()
{
	return 1;
};

func void info_diego_exit_gamestart_info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00");	//������� �� ������.
	if(!Npc_KnowsInfo(hero,info_diego_kolonie))
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01");	//��, �� ������ ���� �����. ��� ��� �������������.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02");	//���������� � ������ ������.
	};
	AI_StopProcessInfos(self);
	if(KAPITEL < 2)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIEGO_AFTER_GAMESTART = TRUE;
	};
};


instance INFO_DIEGO_EXIT_LATER(C_INFO)
{
	npc = pc_thief;
	nr = 999;
	condition = info_diego_exit_later_condition;
	information = info_diego_exit_later_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_diego_exit_later_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_exit_gamestart))
	{
		return 1;
	};
};

func void info_diego_exit_later_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Diego_EXIT_11_01");	//������.
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_bringlistback) && SATURAS_BRINGFOCI == 0)
	{
		AI_Output(self,hero,"SVM_11_YouKilledOCfolk");	//� ������ ������ ���-�� ����. �������, ��� �� � ���� �������...
		AI_Output(self,hero,"SVM_11_RunCoward");	//������ ����� �� ���������!
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_EXIT_15_00");	//�� �������!
	};
	AI_StopProcessInfos(self);
};


instance INFO_DIEGO_BRIEF(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_brief_condition;
	information = info_diego_brief_info;
	permanent = 0;
	description = "� ���� ���� �������� ��� ���������� ���� ����� ����.";
};


func int info_diego_brief_condition()
{
	if(KAPITEL < 3 && ((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1)))
	{
		return TRUE;
	};
};

func void info_diego_brief_info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00");	//� ���� ���� �������� ��� ���������� ���� ����� ����.
	if(Npc_GetDistToWP(hero,"OCR_OUTSIDE_HUT_1") < 1500)
	{
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
	AI_Output(self,hero,"Info_Diego_Brief_11_01");	//�� ��?!
	AI_Output(hero,self,"Info_Diego_Brief_15_02");	//��� ��� ��� �����-�� ���, ����� ��� ��� ���� �������� ����.
	AI_Output(self,hero,"Info_Diego_Brief_11_03");	//���� �������, ��� � ��������� ����� �� � ����� � ������. ����� ������ ����� ��������� �� ���� ������ �� ��� ������.
	AI_Output(self,hero,"Info_Diego_Brief_11_04");	//���� ������ ������ ������, � ����� ����������� ����� �� ����� �� ����� � �����.
	AI_Output(self,hero,"Info_Diego_Brief_11_05");	//�� ����� ����� � �� ������ ��� �� ����� �� ��� ���, ���� �� �������� ����-������ �� �����. ������, ���� �� ��� �� ����� ������������.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//������?
	AI_Output(self,hero,"Info_Diego_Brief_11_07");	//���� ����� � ����� ������� ������, �� ������ ���� ������ ����� ������� ����.
	Log_CreateTopic(KDFLETTER,LOG_MISSION);
	Log_SetTopicStatus(KDFLETTER,LOG_RUNNING);
	b_logentry(KDFLETTER,"����� ��������� �� ������ �����-�� ����� ��� ����� ��� ������, ������� ���������� ������� ����� ����. ����� ���������, ��� ��� ���� ����� � ������ ������� ������, �� � ��� �������� ������ �������.");
	PYROCAR_MESSENGER = LOG_RUNNING;
};


instance INFO_DIEGO_WARUMGEHOLFEN(C_INFO)
{
	npc = pc_thief;
	nr = 5;
	condition = info_diego_warumgeholfen_condition;
	information = info_diego_warumgeholfen_info;
	permanent = 0;
	description = "������ �� ��� ���������?";
};


func int info_diego_warumgeholfen_condition()
{
	if(!DIEGO_AFTER_GAMESTART && (KAPITEL < 2))
	{
		return 1;
	};
};

func void info_diego_warumgeholfen_info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00");	//������ �� ��� ���������?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01");	//������ ��� ���� ����� ���� ������. ������ �� ���� �� ����� �������� � �����. ��� �������� ������� �����, ��� ��.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02");	//� � �� ����� ������ ������ � ������� � ��������. � �� �� ������ ��� ������ ����. � ���� ���� ��� ���� ���� �����������.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03");	//�����������?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04");	//��. � �����, ����� ���������� � ������ ������� �� �����, ��� ���� ����� ������.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05");	//������, ��� �������� ����, ������ ������� ���� �����. � ������� ���� ��� ������, � �� ������ ������ �������������� � ������ �� ���.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06");	//� ����� ��� ����, ����� �������� ��������, ��� ������ ������ - ������ ����� ��� ���.
};


instance INFO_DIEGO_BULLIT(C_INFO)
{
	npc = pc_thief;
	nr = 5;
	condition = info_diego_bullit_condition;
	information = info_diego_bullit_info;
	permanent = 0;
	description = "� ��� ������ ������ ���� ������?";
};


func int info_diego_bullit_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_warumgeholfen) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_bullit_info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02");	//� ��� ������ ������ ���� ������?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03");	//�� � ���������� ��������� � ������ ������� �� �������� ����. �� ������� ��� ���.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04");	//�� ���� �� ������ ��������� ���, ���� ���������. ������ ������� ����.
};


instance INFO_DIEGO_KOLONIE(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_kolonie_condition;
	information = info_diego_kolonie_info;
	permanent = 0;
	description = "�������� ��� �� ���� �����.";
};


func int info_diego_kolonie_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void info_diego_kolonie_info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00");	//�������� ��� �� ���� �����.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01");	//���, ��� ��������� ������ �������, �� �������� ��������. �� ��� ������, ��� �� ����� �������� ���� ��� ������.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02");	//��, �� ������� ����, � ������ ������...
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03");	//� ������� ���� ��� ������. ������ ������ ����� �������. �� ��� ������.
};


instance INFO_DIEGO_BARRIERE(C_INFO)
{
	npc = pc_thief;
	nr = 3;
	condition = info_diego_barriere_condition;
	information = info_diego_barriere_info;
	permanent = 0;
	description = "�������� ��� � �������.";
};


func int info_diego_barriere_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE))
	{
		return 1;
	};
};

func void info_diego_barriere_info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00");	//�������� ��� � �������.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01");	//� ���� ��� ���� � ��� ����������. �� ����� ������, ��� �� �����������.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02");	//��� ��������, ���� �������� ����� �� ������?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03");	//���������, ��� ���������� - ��� �����. ���� ������ ������ ����� �������� ���� ������, �� ��������� ���� ���.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04");	//���� ���� ���� ���� ������ ���������, � ��� �����.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05");	//��� ������ ��������� ������? �� �� ������ ��� ����� ����!
};


instance INFO_DIEGO_OTHERCAMPS(C_INFO)
{
	npc = pc_thief;
	nr = 2;
	condition = info_diego_othercamps_condition;
	information = info_diego_othercamps_info;
	permanent = 0;
	description = "� ��� � ����� ������� ��������?";
};


func int info_diego_othercamps_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_diego_othercamps_info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00");	//� ��� � ����� ������� ��������?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01");	//��� ������ ������ ���������� �� ���, ����� ����� ������ ������� �� �������.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02");	//����� ������ ��������� �� ������. �������� ���� ������, ��� ������ ��������� ������, ��� ������ ������� ��� ����� ���������� ����.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03");	//���� ��� ����� ��������� �� �������. �� ������ ����� ������� ������, � ��� ����� � ������� ������ ����� ���������� ��.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04");	//�� ���� ���-�� �� ��������.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05");	//�� ����� ����� � �� �� ���� ������� ����� �� ���� ���������.
};


instance INFO_DIEGO_OLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_oldcamp_condition;
	information = info_diego_oldcamp_info;
	permanent = 0;
	description = "�������� ��� ���-������ � ������ ������.";
};


func int info_diego_oldcamp_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE))
	{
		return 1;
	};
};

func void info_diego_oldcamp_info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00");	//�������� ��� ���-������ � ������ ������.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01");	//�� ����� ������� � ������ �� ���� �������. ����� � ��� ���� ������������ ������, � ������ � ��� � ����� �����.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02");	//��� � ����� ������ ��������� ��� ���, ��� �� �������. ������ � ��� � �����, ����?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03");	//�� ��������� ��� ����, ����, ����, ������... ���.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,hero,"Info_Diego_OldCamp_11_04");	//�� ���� ������ ����� ���� �����. ���� �������������� � ������.
	};
};


instance INFO_DIEGO_WHOSGOMEZ(C_INFO)
{
	npc = pc_thief;
	nr = 3;
	condition = info_diego_whosgomez_condition;
	information = info_diego_whosgomez_info;
	permanent = 0;
	description = "��� ����� �����?";
};


func int info_diego_whosgomez_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_oldcamp) || Npc_KnowsInfo(hero,info_diego_brief))
	{
		return 1;
	};
};

func void info_diego_whosgomez_info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00");	//��� ����� �����?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01");	//����� ����� ����������� �� �������. �� ������ � ������ ������, ��� ���������� ������� � �������.
};


instance INFO_DIEGO_JOINOLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_joinoldcamp_condition;
	information = info_diego_joinoldcamp_info;
	permanent = 0;
	description = "� ���� � ������ ����� ����� �� ��� �����, ��� ��� ����� �������?";
};


func int info_diego_joinoldcamp_condition()
{
	if((Npc_KnowsInfo(hero,info_diego_oldcamp) || Npc_KnowsInfo(hero,info_diego_brief)) && !c_npcbelongstooldcamp(hero) && (Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 2))
	{
		return TRUE;
	};
};

func void info_diego_joinoldcamp_info()
{
	var C_NPC thorus;
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00");	//� ���� � ������ ����� ����� �� ��� �����, ��� ��� ����� �������?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01");	//� ����� ����� �� ������� �������� �� ����� �����. ����� ���, ��� ���� ������� �����.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"���� � ����, ����� ���� ����� � ������ ������, � ������ ���������� � �������.");
};


instance INFO_DIEGO_WAYTOOLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_waytooldcamp_condition;
	information = info_diego_waytooldcamp_info;
	permanent = 0;
	description = "��� � ����� ����� ������ ������?";
};


func int info_diego_waytooldcamp_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_waytooldcamp_info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00");	//��� � ����� ����� ������ ������?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01");	//��� �� ���� ������. ������ ������ - ��������� ���������� ����� �� ����� ����.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02");	//����� �������� ������� ����� ����� ������. ����������� ��� ���������� - ������������.
};


instance INFO_DIEGO_WOWAFFE(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_wowaffe_condition;
	information = info_diego_wowaffe_info;
	permanent = 0;
	description = "��� � ���� ����� ������?";
};


func int info_diego_wowaffe_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_waytooldcamp) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_wowaffe_info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00");	//��� � ���� ����� ������?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01");	//����� ������� �� ������ �����, ����� ������. � ������, �� ������� ���-������ �������.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02");	//�� ����� ����� � ���������� ������ �� ������ �� ������.
};


instance INFO_DIEGO_THORUSSAYS(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_thorussays_condition;
	information = info_diego_thorussays_info;
	permanent = 0;
	description = "� ������� � �������.";
};


func int info_diego_thorussays_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_diegosentme))
	{
		return 1;
	};
};

func void info_diego_thorussays_info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00");	//� ������� � �������.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01");	//� ��� �� ������?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02");	//�� ����� ������� ���� � ������, ���� �� ���� �� ��� ���� ��������.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03");	//����, � ���� ��������� ��� ���� ������.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04");	//�� ������ ����� ������?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05");	//������ ����� ���� ����� ������ ��������� �����.
};


instance INFO_DIEGO_RULES(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_rules_condition;
	information = info_diego_rules_info;
	permanent = 0;
	description = "��� � ������ �����, ����� ���� ������� � ������ ������?";
};


func int info_diego_rules_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_thorussays) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_diego_rules_info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00");	//��� � ������ �����, ����� ���� ������� � ������ ������?
	AI_Output(self,hero,"Info_Diego_Rules_11_01");	//���� ������ �������� � ������, �� ������ ���������� ���������.
	AI_Output(self,hero,"Info_Diego_Rules_11_02");	//�� ������� ������ ���� ��������� ����������� ������, � �������� ��������. ���� ������� �� ���� �����, ������, ������� �������.
	AI_Output(self,hero,"Info_Diego_Rules_11_03");	//����� �� ������ ������ ������ ���� �� �����������.
	AI_Output(self,hero,"Info_Diego_Rules_11_04");	//����� ����, ������ ������� ������ ��������� ���������� ������������. ��� ������ �� ������, ��� ������ �� ���� ������ ��� ������.
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"����� ���� ����� � ������ ������, � ������ ���������� ����������� �� ���������� ����� �� �������� ����� � ������ ��������� �� �����������, ������� ���������� �����.");
};


instance INFO_DIEGO_CELEBS(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_celebs_condition;
	information = info_diego_celebs_info;
	permanent = 0;
	description = "��� ����� ���� ����������� �����?";
};


func int info_diego_celebs_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules))
	{
		return 1;
	};
};

func void info_diego_celebs_info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00");	//��� ����� ���� ����������� �����?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01");	//���, ��, ���� �� ��� ����� �����. ����� ��� �����. � ��� �� ��� ������.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02");	//� ���������... �� �� ������� ���. ���� �� ���� �� ��� �� ��������, �� ���� ��� ������ ������.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03");	//������� �� �������� ������, �������� � ������, � �� �������, ��� ���� ���.
};


instance INFO_DIEGO_TEACHERS(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_teachers_condition;
	information = info_diego_teachers_info;
	permanent = 0;
	description = "��� ����� ����� ������� ���� ����-������?";
};


func int info_diego_teachers_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules))
	{
		return 1;
	};
};

func void info_diego_teachers_info()
{
	AI_Output(hero,self,"Info_Diego_Teachers_15_00");	//��� ����� ����� ������� ���� ����-������?
	AI_Output(self,hero,"Info_Diego_Teachers_11_01");	//����� � ��������. �� ����� ������� ����� ���.
	AI_Output(self,hero,"Info_Diego_Teachers_11_02");	//�, ���� � ���� ���� ������ �� ������, �� ����� ������� ���� ��� ��������.
	AI_Output(hero,self,"Info_Diego_Teachers_15_03");	//��� � ����� ��������?
	AI_Output(self,hero,"Info_Diego_Teachers_11_04");	//��� ������ �� ����� ��������. ��� ����� ��� ������ ����� �� ������ ������ � �����.
	AI_Output(self,hero,"Info_Diego_Teachers_11_05");	//� ����� ����� ������� ������ � ��������� ���� � ������� �����.
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"������� ����� ������� ���� �������� � ��������� �����. �� ����� �������� �� �����. ��� ��� ������� � ����� �����.");
};


var int diego_merke_str;
var int diego_merke_dex;

instance INFO_DIEGO_TEACH(C_INFO)
{
	npc = pc_thief;
	nr = 100;
	condition = info_diego_teach_condition;
	information = info_diego_teach_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int info_diego_teach_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_teachers))
	{
		return 1;
	};
};

func void info_diego_teach_info()
{
	if(LOG_DIEGOTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"����� ����� ������ ����� ����� ������� � ������.");
		LOG_DIEGOTRAIN = TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,hero,"Info_Diego_Teach_11_01");	//��. � ���� ������� ���� ��� �������� ���� � ��������.
	DIEGO_MERKE_STR = hero.attribute[ATR_STRENGTH];
	DIEGO_MERKE_DEX = hero.attribute[ATR_DEXTERITY];
	b_diegolearn();
};

func void info_diego_teach_back()
{
	if(DIEGO_MERKE_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00");	//������ �� ���� �������.
	};
	if(DIEGO_MERKE_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01");	//���� ������ �������� �� ���� � �������� ����� �����.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02");	//������ ���, ���� ������� ����� ���������!
	Info_ClearChoices(info_diego_teach);
};

func void info_diego_teach_str_1()
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
		AI_Output(self,other,"SVM_11_Ooh");	//��! ��������!
	};
	b_diegolearn();
};

func void info_diego_teach_str_5()
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
		AI_Output(self,other,"SVM_11_Ooh");	//��! ��������!
	};
	b_diegolearn();
};

func void info_diego_teach_dex_1()
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
		AI_Output(self,other,"SVM_11_Ooh");	//��! ��������!
	};
	b_diegolearn();
};

func void info_diego_teach_dex_5()
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
		AI_Output(self,other,"SVM_11_Ooh");	//��! ��������!
	};
	b_diegolearn();
};

instance INFO_DIEGO_BRINGLIST_OFFER(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_bringlist_offer_condition;
	information = info_diego_bringlist_offer_info;
	permanent = 0;
	description = "����� ���� � ������ ������?";
};


func int info_diego_bringlist_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules) && (hero.guild == GIL_NONE || hero.guild == GIL_STT || hero.guild == GIL_GRD) && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_diego_bringlist_offer_info()
{
	var C_NPC ian;
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00");	//����� ���� � ������ ������?
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01");	//�� ����������� � ������ �����. ��� ��������� ������ �����, ��� ����� ��. �� ���� ���� ������.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02");	//��� ������ ����� ��� ���. ��� ������ ��������, ������� ����� ������� �� ����� ��� ���������� ������.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03");	//��� ������� ��� ��� � ��������� ���������.
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04");	//��� �������!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05");	//�� ���, �������� ��� �� ����. ����� ������ �� � ���� ������ �� ������ �������� ���� ������!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06");	//� ��� ������, ��� ��� �����. ���� � ���� ��� ���������, �� �������� ������� ��� � ����� �������.
	DIEGO_BRINGLIST = LOG_RUNNING;
	Log_CreateTopic(CH1_BRINGLIST,LOG_MISSION);
	Log_SetTopicStatus(CH1_BRINGLIST,LOG_RUNNING);
	b_logentry(CH1_BRINGLIST,"����� ������ ���� � ������ �����. ��� � ������ ����� �������� �� ����� �� � ����� � ���� ������ ��������. ���� ������ �� ������ ������� � ���� ����� �� ������ ������.");
	ian = Hlp_GetNpc(stt_301_ian);
	CreateInvItem(stt_301_ian,thelist);
};


instance INFO_DIEGO_IANPASSWORD(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_ianpassword_condition;
	information = info_diego_ianpassword_info;
	permanent = 0;
	description = "��� ����� �� �������� ��� ����� ������ ������?..";
};


func int info_diego_ianpassword_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer) && DIEGO_BRINGLIST == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_diego_ianpassword_info()
{
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01");	//��� ����� �� �������� ��� ����� ������ ������? �� �� ���� �� �����.
	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02");	//�� �����, ����, ����� �� �������, ��� �� �� �����.
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03");	//� ��� ��� � �����.
	b_logentry(CH1_BRINGLIST,"�� ������ ��� ������, ���� � �����, ��� ���� ������� �����.");
};


instance INFO_DIEGO_MAPTOOLDMINE(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_maptooldmine_condition;
	information = info_diego_maptooldmine_info;
	permanent = 0;
	description = "��� ��������� ������ �����?";
};


func int info_diego_maptooldmine_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer) && DIEGO_BRINGLIST == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_diego_maptooldmine_info()
{
	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00");	//��� ��������� ������ �����?
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01");	//������� � �������. �� ���������. �����, ��� �� �� ����. �� ���� ���� �����, � �� ��� �� ������� ���� � �����.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02");	//�� ����� ����� �� �������� �����.
	b_logentry(CH1_BRINGLIST,"������ ���� ��� �����. � ����� ����� ��� ����� �������� �����.");
};


instance INFO_DIEGO_BRINGLIST_SUCCESS(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_bringlist_success_condition;
	information = info_diego_bringlist_success_info;
	permanent = 0;
	description = "�� ������� ��� ������.";
};


func int info_diego_bringlist_success_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING || Npc_KnowsInfo(hero,org_801_lares_bringlist)) && (Npc_HasItems(hero,thelist) || Npc_HasItems(hero,thelistnc)) && !Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		return 1;
	};
};

func void info_diego_bringlist_success_info()
{
	b_printtrademsg1("����� ������.");
	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00");	//�� ������� ��� ������.
	if(Npc_HasItems(hero,thelist) && Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_giveinvitems(hero,self,thelist,1);
		b_logentry(CH1_BRINGLIST,"����� ������� ������� ���� �������. � ������� ��� ������ ���.");
		DIEGO_BRINGLIST = LOG_SUCCESS;
		b_givexp(XP_DIEGOBRINGLIST);
		Log_SetTopicStatus(CH1_BRINGLIST,LOG_SUCCESS);
	}
	else if(Npc_HasItems(hero,thelistnc))
	{
		b_giveinvitems(hero,self,thelistnc,1);
		b_printtrademsg1("����� ����������� ������.");
		if(Npc_KnowsInfo(hero,info_diego_bringlist_offer))
		{
			b_logentry(CH1_BRINGLIST,"����� ������� ������� ���� �������. �������, �� �� �������, ��� ���� �������� ������. ��� ��� �� �������?");
			DIEGO_BRINGLIST = LOG_SUCCESS;
			b_givexp(XP_DIEGOBRINGLIST);
			//Log_SetTopicStatus(CH1_BRINGLIST,LOG_SUCCESS);
		}
		else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,info_diego_bringlist_offer))
		{
			b_logentry(THELISTFORNC,"����� ������� ������� ���� �������. �������, �� �� �������, ��� ���� �������� ������. ��� ��� �� �������?");
			DIEGO_BRINGLIST = LOG_SUCCESS;
			b_givexp(XP_DIEGOBRINGLIST);
		};
	};
	b_usefakescroll();
	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01");	//������� ���������! ��� ����� �������� � ���� ������!
	POINTS_OC = POINTS_OC + 5;
};


var int diego_gomezaudience;

instance INFO_DIEGO_JOINANALYZE(C_INFO)
{
	npc = pc_thief;
	nr = 800;
	condition = info_diego_joinanalyze_condition;
	information = info_diego_joinanalyze_info;
	permanent = 1;
	description = "��� ������ ��� ��� � ������?";
};


func int info_diego_joinanalyze_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (OLDHEROGUILD == 0)  && (DIEGO_GOMEZAUDIENCE == FALSE))
	{
		return 1;
	};
};

func void info_diego_joinanalyze_info()
{
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00");	//��� ������ ��� ��� � ������?
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01");	//��, � ��� ��������� � ������...
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02");	//� ���?
	POINTS_OC = 0;
	if((SCATTY_CHARGEKIRGO == LOG_FAILED && KIRGO_KILLED == TRUE) || (SCATTY_CHARGEKHARIM == LOG_FAILED && KHARIM_KILLED == TRUE))
	{
		AI_Output(self,hero,"SVM_11_YouKilledMyFriend");	//���� ������ �������: �� �������. �� ��� �������!
		POINTS_OC = POINTS_OC - 1;
	};
	if(SCATTY_CHARGEKIRGO == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01");	//������ ������, ��� �� ������ �����.
		POINTS_OC = POINTS_OC + 2;
	}
	else if(SCATTY_CHARGEKIRGO == LOG_FAILED && KIRGO_KILLED == FALSE)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02");	//������ ������, ��� ����� ������� ����. ��� ����������, ��� �� ����� ���������.
		POINTS_OC = POINTS_OC - 1;
	}
	else if(SCATTY_CHARGEKIRGO == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03");	//������ ������, ��� ����� �� ��������� �� ���� ��� � �����.
	};
	if(SCATTY_CHARGEKHARIM == LOG_FAILED && KHARIM_KILLED == FALSE)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04");	//�������, ��� �����������, ��� �� ������ �� ��� ������. ������, ��� �� ��������.
		POINTS_OC = POINTS_OC + 2;
	}
	else if(SCATTY_CHARGEKHARIM == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05");	//������ ��� � ����� ���� ��������� ���� ��� � �������. �� ��� ��������� ���� ������.
		POINTS_OC = POINTS_OC + 5;
	}
	else if(SCATTY_CHARGEKHARIM == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06");	//� �� �� ���������, ��� �� �������� ������ ������.
	};
	if(WHISTLER_BUYMYSWORD == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01");	//������� ��������� ��� � �����... �, �� ����� �����, ������ �� ���� � ��������. � ����� ������ � ��� ������ �� ��������.
		POINTS_OC = POINTS_OC + 3;
	}
	else if((WHISTLER_BUYMYSWORD == LOG_FAILED) || ((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY <= (Wld_GetDay() - 2))))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02");	//� ��������� � ���������. �� �� ������! ���� � �������� � ��� �����. ������ ��������, ��� � ��������� ���� �� ��������!
		POINTS_OC = POINTS_OC + 2;
	}
	else if(WHISTLER_BUYMYSWORD == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03");	//������� ����� �������� ���� ���. ����� �����, �������� ��� ��� ���, ����� �� ��������� ��������, ��� �� ���� ��� ���� � ������!
	};
	if(SLY_LOSTNEK == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01");	//���� ���������, ��� �� ����� � ������� ����. ������, �� ����� �������.
		POINTS_OC = POINTS_OC + 4;
	}
	else if(SLY_LOSTNEK == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02");	//��� �������, ���� ������ ������ ����. ���� ������ ��� ��������� �������, ����� ���� ���� ����, �� ��� �� � �� �����, ��� �� ������� � ����� ������.
	};
	if(FINGERS_LEARNT == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01");	//������� ����� ���� ������� �������. � �� �� ����� ����� ������ � ����.
	}
	else if(FINGERS_LEARNT == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02");	//������� ������, ��� �� ��� ���-��� ������, �� �� �������, ��� �� �������� �� �������.
		POINTS_OC = POINTS_OC + 3;
	};
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01");	//���� �� ��� ������������ � ���������. �� ����� ������������ ���� ��� ����� �������� ���.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02");	//���� ������ ��������� ��� ������� ������. ���� �� �������� ���, ���� ��������� ����������.
	}
	else if(DEXTER_GETKALOMSRECIPE == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03");	//�� � ������ ������ ������ ��� ���� � ��� �������! ������� �������, �� � � ����.
		POINTS_OC = POINTS_OC + 5;
	};
	if(THORUS_MORDRAGKO == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01");	//������ �������� ����� ����������. �� ������� ���������. ���� � ������ ������ �������� ���, ������� ���������������.
	}
	else if(THORUS_MORDRAGKO == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02");	//����� �������, ��� ��� ����� ������ ����� ���� - ��� ������� ����.
		POINTS_OC = POINTS_OC + 5;
	}
	else
	{
		if(THORUS_MORDRAGKO == LOG_FAILED)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03");	//����� ��� ����� ���������, ��������� ���� �������. ��� �� ��������� ��������� ����� ����?!
			POINTS_OC = POINTS_OC - 5;
		};
		if(FISK_GETNEWHEHLER == LOG_SUCCESS)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01");	//���� ������ ���, ��� �� ��� ������. � ����� ������ �� �� ����� �������.
			POINTS_OC = POINTS_OC + 5;
		}
		else if((MORDRAGKO_HAUAB == TRUE) || (MORDRAGKO_STAYATNC == TRUE))
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02");	//���� ������ ���� �������������, ������. �� ����� ����� � �� ���������� �������� ������ ��������.
		};
	};
	if(POINTS_OC > 15)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_00");	//�� ����� ��������� ��� ������ � ���� ������.
		if(hero.level >= 5)
		{
			if(DIEGO_BRINGLIST == LOG_SUCCESS)
			{
				AI_Output(self,hero,"Info_Diego_Points_11_01");	//�� � �������� �� �������� �� ������. ��� � ������. � ��� ��������� � ����� �������. �� �������� ���� ������ � ������.
				DIEGO_GOMEZAUDIENCE = TRUE;
				//Log_SetTopicStatus(CH1_JOINOC,LOG_SUCCESS);
				b_logentry(CH1_JOINOC,"����� ������, ��� � ���� ����������� � �������. ������ � ����� ����� ����� �� ����� ������ � ����� � �����. ����� ���� ���������� � �������.");
				info_diego_joinanalyze.permanent = 0;
			}
			else
			{
				AI_Output(self,hero,"Info_Diego_Points_11_02");	//�� ���� ��� ��������� �������� �� ��������.
			};
		}
		else
		{
			b_printguildcondition(5);
		};
	}
	else if(POINTS_OC > 10)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_10");	//� ���������� ���� �������, ��� �� ���������� ������� ��� �������.
	}
	else if(POINTS_OC >= 0)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_20");	//�������� �������, ���� �� ������ ���� ����-�� �������� � ���� ������.
	};
};


instance INFO_DIEGO_WHATTOSAYTOGOMEZ(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_whattosaytogomez_condition;
	information = info_diego_whattosaytogomez_info;
	permanent = 0;
	description = "��� ��� ����� ���� ��� ������� � �������?";
};


func int info_diego_whattosaytogomez_condition()
{
	if(DIEGO_GOMEZAUDIENCE == TRUE && !Npc_KnowsInfo(hero,dia_gomez_dabei))
	{
		return 1;
	};
};

func void info_diego_whattosaytogomez_info()
{
	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00");	//��� ��� ����� ���� ��� ������� � �������?
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01");	//����� ������ ����� ����� ���� ����. ����� �� ��������� �� ����, �� ��� �����, ��� � ����� ������.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02");	//������ � �� ���� ���������� ����, ��� ��� ��������. �����!
};


instance PC_THIEF_ARMOR(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_armor_condition;
	information = pc_thief_armor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("������� ������ ��������, ������: 40/5/20/0",VALUE_STT_ARMOR_H);
};


func int pc_thief_armor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_HasItems(hero,stt_armor_h))
	{
		return TRUE;
	};
};

func void pc_thief_armor_info()
{
	AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01");	//��� � ���� ������� ����� ������, ��� � ����?
	if(Npc_HasItems(hero,itminugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02");	//� ���� � ���� ������?
		b_printtrademsg1("������ ����: 1200");
		AI_Output(hero,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07");	//�������!
		b_giveinvitems(hero,self,itminugget,VALUE_STT_ARMOR_H);
		b_printtrademsg2("������� ������ ��������.");
		CreateInvItem(hero,stt_armor_h);
		AI_EquipArmor(hero,stt_armor_h);
	}
	else
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03");	//���� ���� - ����� �������.
	};
};


instance PC_THIEF_MEETAGAIN(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_meetagain_condition;
	information = pc_thief_meetagain_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_meetagain_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"OW_PATH_190") < 700))
	{
		return TRUE;
	};
};

func void pc_thief_meetagain_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00");	//��, � �� ����� �� �����.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01");	//������� � ���� ��� �����.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02");	//� ������� ����� ��������� ������� ����� ���� ���������. � ������, �� �� ��������� ���� ������ �� ��������� ������� � ���������.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03");	//��, �� ��� ����� ������.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04");	//���� ������, ��� �� �������... ������ �� ����� ������?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05");	//��, ���� �� ���� ������ ��������� ���-�� �����.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06");	//� ����, ��� ����� ���� ����� ������. �� ��� ���� ��������.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07");	//�������. ��� �� �� ��� ������?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08");	//� �� ������� ��������, �� ������ ���� �� � ����.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09");	//�� � ����? ��� ��� �� ��� �� ��������?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10");	//�������� ����� �� ��� �����.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11");	//������. ������� - ��� �������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GuideTroll");
	Log_CreateTopic(CH3_TROLLCANYON,LOG_MISSION);
	Log_SetTopicStatus(CH3_TROLLCANYON,LOG_RUNNING);
	b_logentry(CH3_TROLLCANYON,"����� � �������� � ��������� ��������� �������, � ����� �������� �����. �� ����������� ����, ��� � ������ ���������� �����-�� �������� ��������.");
	b_logentry(CH3_TROLLCANYON,"�����-�� ������� �� �����, ��� � ������� �������� � ��� �������. �� ������ ���������� ���� ������.");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_SHOWFOCUS(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_showfocus_condition;
	information = pc_thief_showfocus_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_showfocus_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_meetagain) && (Npc_GetDistToWP(self,"LOCATION_12_01") < 1000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_thief_showfocus_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01");	//�� ����� ������� ������ ���� � ������, ��� �������� ������.
	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02");	//�������, ������� ��� �������� ���������� �� ��� �������� �����.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03");	//����� ���������� � �������, ����� ����� ��� ������ �����... ��� ��������� ���-������ ���.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04");	//� ������� ���.
	b_logentry(CH3_TROLLCANYON,"�� ����� ��������� ������, ������� ���������� ��� ���������� ����. ����� ����� ������� ���, ���� � ����� ������ ����� ������.");
	Npc_ExchangeRoutine(self,"WaitAtWheel");
	AI_DrawWeapon(self);
	AI_StopProcessInfos(self);
};


instance PC_THIEF_AFTERTROLL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_aftertroll_condition;
	information = pc_thief_aftertroll_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_aftertroll_condition()
{
	var int trollfound;
	Npc_PerceiveAll(self);
	trollfound = Wld_DetectNpc(self,troll,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,pc_thief_showfocus) && ((trollfound && (Npc_IsDead(other) || Npc_IsInState(other,zs_magicshrink))) || (Npc_GetDistToWP(hero,"LOCATION_12_14_WHEEL") < 1000)))
	{
		return TRUE;
	};
};

func void pc_thief_aftertroll_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01");	//������ ����������! ��, �� ������� �����������! ��� �, ���� �� ��������.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02");	//� ������ �����, ���������, ����� �� ���� ������ ���������� ���������.
	b_logentry(CH3_TROLLCANYON,"������ ��������. ������ ����� �������� ��������, ������� ��������� ������� �� ���� � ��������� � ��������.");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_WHEEL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_wheel_condition;
	information = pc_thief_wheel_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_wheel_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_aftertroll) && (TROLL_WHEEL == 1))
	{
		return TRUE;
	};
};

func void pc_thief_wheel_info()
{
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01");	//������, ���������.
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02");	//���-�� ��� ���������, ����� ����, ������� ���-�� �������.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"LOCATION_12_14_WHEEL");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
};


instance PC_THIEF_FIXWHEEL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_fixwheel_condition;
	information = pc_thief_fixwheel_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_fixwheel_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_wheel))
	{
		return TRUE;
	};
};

func void pc_thief_fixwheel_info()
{
	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01");	//���, ������ ������ ����������.
	TROLL_WHEEL = 2;
	b_logentry(CH3_TROLLCANYON,"����� ����� ��������������� �������. ������ ��� ����� �� ������ ����� ������.");
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_WAITATFOCUS(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_waitatfocus_condition;
	information = pc_thief_waitatfocus_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_waitatfocus_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_fixwheel) && (Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000))
	{
		return TRUE;
	};
};

func void pc_thief_waitatfocus_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01");	//��� �� ��������, � � ������� �����.
	AI_StopProcessInfos(self);
};


instance PC_THIEF_GOTIT(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_gotit_condition;
	information = pc_thief_gotit_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_gotit_condition()
{
	if(Npc_HasItems(hero,focus_2) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_thief_gotit_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01");	//����� ������? �������.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02");	//�����, ��� ���� ������������ � ������ ������. ����� �����!
	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03");	//������, ���� ���������.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04");	//��� ��������.
	//b_logentry(CH3_TROLLCANYON,"������ ���. �������� ������ ������� � ���� ���� ������, ������� �� ���� �� ��������.");
	b_logentry(CH3_TROLLCANYON,"������ ���, � ����� ������������ � ������ ������. �����, ��� ���� ��� �� ��������� ���� �������.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
};


instance INFO_DIEGO_OCWARN(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocwarn_condition;
	information = info_diego_ocwarn_info;
	important = 1;
	permanent = 0;
};


func int info_diego_ocwarn_condition()
{
	if(KAPITEL == 4 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_diego_ocwarn_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//��... ����!
	if(Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_02");	//������, �����! � �������� �������� �� ������ ����� ������.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_03");	//������, ����� �� � ����� ��������� �������.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_04");	//�� ������, ��� ����������� ��������� �� ��������� �����?
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_05");	//������, �����! ������ �� ���������?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_06");	//� �� ��� �� ������?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_07");	//������ ���?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_08");	//� ������ ����� �����, ��� ���� ���� ������, � �� ��������� ����� ��������� ���������.
		AI_Output(hero,self,"Info_Diego_OCWARN_15_09");	//���? � ��� �� ��������?
		b_failch4quests();
	};
};


instance INFO_DIEGO_OCMINE(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocmine_condition;
	information = info_diego_ocmine_info;
	important = 0;
	permanent = 0;
	description = "������ ���������� ������ �����?";
};


func int info_diego_ocmine_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn))
	{
		return TRUE;
	};
};

func void info_diego_ocmine_info()
{
	AI_Output(hero,self,"Info_Diego_OCMINE_15_01");	//������ ���������� ������ �����?
	AI_Output(self,hero,"Info_Diego_OCMINE_11_02");	//���� ���������� � ����� ������� �������, ��� �� ����� ����� �� ������ ������, ��� ������������ �� ��������� ����.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_03");	//����� ���� ������� � �����, ��������� ���� �� ��������, � ������� ������� ���������.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_04");	//�� ���, ��� ��������� � �����, ������� ���� �������.
};


instance INFO_DIEGO_OCKDF(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ockdf_condition;
	information = info_diego_ockdf_info;
	important = 0;
	permanent = 0;
	description = "������ ��� ���� ���� �������?";
};


func int info_diego_ockdf_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocfm))
	{
		return TRUE;
	};
};

func void info_diego_ockdf_info()
{
	AI_Output(hero,self,"Info_Diego_OCKDF_15_01");	//������ ��� ���� ���� �������?
	AI_Output(self,hero,"Info_Diego_OCKDF_11_02");	//��� ������ �������.
};


instance INFO_DIEGO_OCFM(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocfm_condition;
	information = info_diego_ocfm_info;
	important = 0;
	permanent = 0;
	description = "����� ��� ����� ������� �� ��������� �����?";
};


func int info_diego_ocfm_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ockdf))
	{
		return TRUE;
	};
};

func void info_diego_ocfm_info()
{
	AI_Output(hero,self,"Info_Diego_OCFM_15_01");	//����� ��� ����� ������� �� ��������� �����?
	AI_Output(self,hero,"Info_Diego_OCFM_11_02");	//��� ������ �������.
};


instance INFO_DIEGO_OCSTORY(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocstory_condition;
	information = info_diego_ocstory_info;
	important = 0;
	permanent = 0;
	description = "��������!";
};


func int info_diego_ocstory_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfm) || Npc_KnowsInfo(hero,info_diego_ockdf))
	{
		return TRUE;
	};
};

func void info_diego_ocstory_info()
{
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01");	//��������! ��� ������ �� ������ ������ ������� �� ���, ��� ��� ����������� �������.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02");	//��, �����. �� �������, � �������� � �������� �������, ����� ��� ������ �� ������ � �����.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03");	//����� ���� �� �������� �� ������, ������� ��� ��������. �����, ���������, ��� ��� ��������� ����� �����������.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04");	//��� ��. ���, ��� ������������ ������ ����, ��� ������ � ����� ��� �������.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05");	//�� ����. ������ � ���� ��� �������� ��������� ����, ������� ����� ��� ���������� ���������� ������ �� �������� ����.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06");	//����� �� ����� �������� �� ����, ���� �� �� ������ ����� �������� ������.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07");	//� ��-�� ����� �� ����� ������� �� ��������� �����?
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08");	//���, ���� ������, ��������� ���� ������ �������� ������.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09");	//���� ��� �����, ����� �������� ���������� ����������� � ��������� �����.
	b_story_fmtaken();
};


instance INFO_DIEGO_OCWARNNC(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocwarnnc_condition;
	information = info_diego_ocwarnnc_info;
	important = 0;
	permanent = 0;
	description = "�� ����� � ���! � �������� �� ���� � ����� ������!";
};


func int info_diego_ocwarnnc_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocwarnnc_info()
{
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01");	//�� ����� � ���! � �������� �� ���� � ����� ������!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02");	//����� ���� ����� ���������� - ��� ��� ������ ����� ��������� ����.
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03");	//�� ��� ������� �� ������ ���������� ����� ���������� ������ ������!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04");	//��� �� �� �����. ��������� ������� ����� ��� ����� ����, ������� ����� ���� ����� � ��������� �����. ����� ��� ����� � ��� �� �����.
};


instance INFO_DIEGO_OCGUARDS(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocguards_condition;
	information = info_diego_ocguards_info;
	important = 0;
	permanent = 0;
	description = "� ����� ����������, ���������� �������� ������.";
};


func int info_diego_ocguards_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocguards_info()
{
	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01");	//� ����� ����������, ���������� �������� ������.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02");	//������� �� ��� ��������. ��� ������� �� ������, ��� �������� � ������.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03");	//��� ������ ����� �� ��������� �� ��������� �����.
};


instance INFO_DIEGO_OCMURDER(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocmurder_condition;
	information = info_diego_ocmurder_info;
	important = 0;
	permanent = 0;
	description = "�� ��� ��������� � ������ ����?";
};


func int info_diego_ocmurder_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocmurder_info()
{
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01");	//�� ��� ��������� � ������ ����?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02");	//�������� � ��������� ���� ���������� ����������, ��� �������� �������� � ���� ��������.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03");	//��� ��������� ��������� � ����������� ������������ � ����� ���������� ��������.
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04");	//��� ��������� ������ ������� �� �����?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05");	//��, ��. �������� � ������ �� ������ ���� ��� ����� ����. ����� �������� �������� �� �, �������� �����, ������� ����.
};


instance INFO_DIEGO_OCRETREAT(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocretreat_condition;
	information = info_diego_ocretreat_info;
	important = 0;
	permanent = 0;
	description = "��� �� � ��������� ����������� ������ ������?";
};


func int info_diego_ocretreat_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocmurder))
	{
		return TRUE;
	};
};

func void info_diego_ocretreat_info()
{
	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01");	//��� �� � ��������� ����������� ������ ������?
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02");	//�� ���� ��������� ����� � ����� ������������� ������, ����� ��� �� ���������� �� ������.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03");	//������ �� ��� �� ������ ���.
};


instance INFO_DIEGO_OCFAVOR(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocfavor_condition;
	information = info_diego_ocfavor_info;
	important = 0;
	permanent = 0;
	description = "�������. ��� � ������ �������?";
};


func int info_diego_ocfavor_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_diego_ocfavor_info()
{
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01");	//�������. ��� � ������ �������?
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02");	//������ ������� � �����. ��� ������ ������ � ���, ��� ����� ����������.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03");	//����� ��, ��� �� ������� ���������� � ����� �����, ��� ������.
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04");	//���� � ������� �� ������ ����, � �������, ��� �� ������ �� ������.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05");	//���������, ���� ���. �� �������� �������� ������! ������ ���, ��� ��������.
	Log_CreateTopic(CH4_4FRIENDS,LOG_MISSION);
	Log_SetTopicStatus(CH4_4FRIENDS,LOG_RUNNING);
	b_logentry(CH4_4FRIENDS,"��� ���� ���� ������. �� ����� �� ����� �� ���� ���������������. ����� �������� ���� ������������ ����� � ������� � ���, ��� �� ����� ����������� � ���� � �������� �����. ��� �������, ��� ��� ����� �������.");
};

