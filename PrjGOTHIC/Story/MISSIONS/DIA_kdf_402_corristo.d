
instance KDF_402_CORRISTO_EXIT(C_INFO)
{
	npc = kdf_402_corristo;
	nr = 999;
	condition = kdf_402_corristo_exit_condition;
	information = kdf_402_corristo_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_402_corristo_exit_condition()
{
	return TRUE;
};

func void kdf_402_corristo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_CORRISTO_INTRUDER(C_INFO)
{
	npc = kdf_402_corristo;
	nr = 1;
	condition = info_corristo_intruder_condition;
	information = info_corristo_intruder_info;
	permanent = 1;
	important = 1;
};


func int info_corristo_intruder_condition()
{
	if(Npc_IsInState(self,zs_talk) && (!Npc_KnowsInfo(hero,grd_200_thorus_wannabemage) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS)))
	{
		return 1;
	};
};

func void info_corristo_intruder_info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//��� �� ����� �������? ���� ���� ������! �����!
	AI_StopProcessInfos(self);
};


instance KDF_402_CORRISTO_EXPLAINMAGE(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_explainmage_condition;
	information = kdf_402_corristo_explainmage_info;
	important = 0;
	permanent = 0;
	description = "�������� ���, ��� ������ ���� �����.";
};


func int kdf_402_corristo_explainmage_condition()
{
	if(!Npc_KnowsInfo(hero,kdf_402_corristo_wannbekdf) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_explainmage_info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01");	//�������� ���, ��� ������ ���� �����.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02");	//��, ���� ����, ������ ������, ���������� ����.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03");	//�� ������� ���� ��� �������, ��������� � �������. ���� ����������� ��������� - ��� ��������� ���.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04");	//���, ������� ���������� ���� ����� ����� � �������� �� ��� ������� ���������������.
};


instance KDF_402_CORRISTO_WANNBEKDF(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_wannbekdf_condition;
	information = kdf_402_corristo_wannbekdf_info;
	important = 0;
	permanent = 1;
	description = "� ���� ����� �����, ����� �� ���.";
};


func int kdf_402_corristo_wannbekdf_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_200_thorus_wannabemage)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_wannbekdf_info()
{
	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01");	//� ���� ����� �����, ����� �� ���.
	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02");	//�� ������ ����� ����� ����� ����? ��...
	if(hero.level < 10)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//�� ������ ��� ������� ����. ������� �� ���, ����� ������ ����� ������.
		AI_StopProcessInfos(self);
		b_printguildcondition(10);
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03");	//������ ��������� �� ���, ����� ����� ������, �� ������ ���� �� ��� ���� ���� ��������. ��� ��������� ���� �� � ���.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05");	//���� ��� ��� ����� ������� ���� ������. ���� ������ ����� �����, �� ������ ������ ���������. ����� ���, ����� ������ �����.
		CORRISTO_KDFAUFNAHME = 1;
		kdf_402_corristo_wannbekdf.permanent = 0;
		Info_ClearChoices(kdf_402_corristo_wannbekdf);
		Log_CreateTopic(GE_BECOMEFIREMAGE,LOG_NOTE);
		b_logentry(GE_BECOMEFIREMAGE,"�������� ������ ���, ��� � ���� ���� ������ � ���� ����� ����. �� ��� ����� � ������ ������ ���������.");
	};
};


instance KDF_402_CORRISTO_KDFTEST(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kdftest_condition;
	information = kdf_402_corristo_kdftest_info;
	important = 0;
	permanent = 0;
	description = "� ����� � ���������.";
};


func int kdf_402_corristo_kdftest_condition()
{
	if(CORRISTO_KDFAUFNAHME == 1)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kdftest_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01");	//� ����� � ���������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02");	//������. �� ������� ������� �� ��������� ������, ��?
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"��, ��� ���.",kdf_402_corristo_kdftest_ja);
	Info_AddChoice(kdf_402_corristo_kdftest,"���.",kdf_402_corristo_kdftest_no);
};

func void kdf_402_corristo_kdftest_ja()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01");	//��, ��� ���.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03");	//������ ��� ��� ���������� ����.
	CORRISTO_KDFAUFNAHME = 2;
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"������.",kdf_402_corristo_kdftest_adanos);
	Info_AddChoice(kdf_402_corristo_kdftest,"������.",kdf_402_corristo_kdftest_sleeper);
	Info_AddChoice(kdf_402_corristo_kdftest,"�����.",kdf_402_corristo_kdftest_innos);
	Info_AddChoice(kdf_402_corristo_kdftest,"�����.",kdf_402_corristo_kdftest_gomez);
};

func void kdf_402_corristo_kdftest_no()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01");	//���.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03");	//�� �� ����� ������� � ���� ���� ��������, ������� ���������� �� ����� ���������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04");	//���� ���� ��� ���� ������. �� ������ ����� � ���������� ��� ���������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_adanos()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01");	//������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03");	//��� �������� �����. ���� �����, ���� ������� ������ ���������� ����������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_sleeper()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01");	//������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03");	//�� ������� ����� ������� ������ � ������ �� �������. ����� ����, ���� ����� ��������� � ���.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_innos()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01");	//�����.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03");	//������ ��� ������ �����������.
	CORRISTO_KDFAUFNAHME = 3;
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"����� �����.",kdf_402_corristo_kdftest_fight);
	Info_AddChoice(kdf_402_corristo_kdftest,"�������� ����� ����� �����.",kdf_402_corristo_kdftest_demut);
	Info_AddChoice(kdf_402_corristo_kdftest,"�������� ��� ����� � �����.",kdf_402_corristo_kdftest_disziplin);
	Info_AddChoice(kdf_402_corristo_kdftest,"������������ ����� ������.",kdf_402_corristo_kdftest_ehrfurcht);
};

func void kdf_402_corristo_kdftest_gomez()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01");	//�����.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02");	//���...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03");	//� �����, ���� ����� ���������� � ������. ���� ������ - ����� ������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_fight()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01");	//����� �����.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03");	//� �����, ���� ����� ���������� � ������. ���� ������ - ����� ������.
	AI_StopProcessInfos(self);
};

func void kdf_402_corristo_kdftest_demut()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01");	//�������� ����� ����� �����.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03");	//���� ������ ���� ����������. �� ������� ����� ���� ��������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04");	//������ � ��� �����. ��� �� ��������� ������� ������ �����.
	AI_StopProcessInfos(self);
	CORRISTO_KDFAUFNAHME = 4;
	b_story_feueraufnahme();
};

func void kdf_402_corristo_kdftest_disziplin()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01");	//�������� ��� ����� � �����.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03");	//���� ������ ���� ����������. �� ������� ����� ���� ��������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04");	//������ � ��� �����. ��� �� ��������� ������� ������ �����.
	CORRISTO_KDFAUFNAHME = 4;
	AI_StopProcessInfos(self);
	b_story_feueraufnahme();
};

func void kdf_402_corristo_kdftest_ehrfurcht()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01");	//������������ ����� ������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02");	//��...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03");	//���� ������ ���� ����������. �� ������� ����� ���� ��������.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04");	//������ � ��� �����. ��� �� ��������� ������� ������ �����.
	CORRISTO_KDFAUFNAHME = 4;
	AI_StopProcessInfos(self);
	b_story_feueraufnahme();
};


instance KDF_402_CORRISTO_AUFNAHME(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_aufnahme_condition;
	information = kdf_402_corristo_aufnahme_info;
	important = 1;
	permanent = 0;
};


func int kdf_402_corristo_aufnahme_condition()
{
	if((Npc_GetDistToWP(hero,"OCC_CHAPEL_UPSTAIRS") < 500) && (CORRISTO_KDFAUFNAHME == 4))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_aufnahme_info()
{
	CORRISTO_KDFAUFNAHME = 5;
	b_story_feueraufnahme();
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01");	//�� ��������� �����, ����� ������� ������ ������ ��������� ����.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02");	//������� �� ������ ����.
	Snd_Play("howling_01");
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03");	//� ������� ������������ �������...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04");	//� ������� ������������ �������...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05");	//...� ����� ���������� ����������� ����...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06");	//...� ����� ���������� ����������� ����...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07");	//... ��� � ����� ��� ��� ������ � ���� ����� ������ ����� � ��������...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08");	//... ��� � ����� ��� ��� ������ � ���� ����� ������ ����� � ��������...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09");	//...���� ��� ���� �� �������� � ������� ������� � �� ������� ����� ���� �����.
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10");	//...���� ��� ���� �� �������� � ������� ������� � �� ������� ����� ���� �����.
	AI_StopProcessInfos(self);
};


instance KDF_402_CORRISTO_ROBE(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_robe_condition;
	information = kdf_402_corristo_robe_info;
	important = 1;
	permanent = 0;
};


func int kdf_402_corristo_robe_condition()
{
	if(Npc_KnowsInfo(hero,kdf_402_corristo_aufnahme))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_robe_info()
{
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,kdf_armor_l);
	CreateInvItem(self,itamarrow);
	b_giveinvitems(self,hero,itamarrow,1);
	Npc_RemoveInvItem(hero,itamarrow);
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01");	//���� ������� �� ������ ���� ����� � ���������� �����.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02");	//������ ��� ������� � ���� ��� � ���� ������� �����.
	AI_StopProcessInfos(self);
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Npc_SetTrueGuild(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_logentry(GE_BECOMEFIREMAGE,"� ������ ��������� � ������ ������ ����. ������ � ���� ������ ������� ����� ����!");
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"�������� ����� ��������� ���� � ����� ������ ����� � ������ ��� �������� ��� ���������� ����. � ����� ����� ��� � ���� ����� ����.");
};


instance KDF_402_CORRISTO_MANA(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_mana_condition;
	information = kdf_402_corristo_mana_info;
	important = 0;
	permanent = 1;
	description = "� ���� ��������� ���� ���������� ����.";
};


func int kdf_402_corristo_mana_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_mana_info()
{
	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01");	//� ���� ��������� ���� ���������� ����.
	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02");	//� ���� ������ ���� � ����. ��� �� ������ ������������ ��, ������� ������ �� ����.
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};

func void kdf_402_corristo_mana_back()
{
	Info_ClearChoices(kdf_402_corristo_mana);
};

func void kdf_402_corristo_mana_man_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};

func void kdf_402_corristo_mana_man_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};


instance KDF_402_CORRISTO_EXPLAINCIRCLES(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_explaincircles_condition;
	information = kdf_402_corristo_explaincircles_info;
	important = 0;
	permanent = 0;
	description = "������� ���, � ��� ����� ���������� ������?";
};


func int kdf_402_corristo_explaincircles_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_explaincircles_info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01");	//������� ���, � ��� ����� ���������� ������?
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02");	//��� ���������. ����� ������������� ������� ����� ���������� ������.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03");	//��� ������ �� ���� ����������� ������� � ������������ ����� ����������.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04");	//������ ��� ������� ��������� ����, �� ������ ��������� ������� ������ �����������.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05");	//����� ������� ������ �����, ���� ����������� ����� ������� � �����.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06");	//�� ���� ������� � �� �������� ����� ������������� ������, ��� ����� ��������������� ������������. �� ���� ������ ����� �� ������ � ����.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07");	//��� �������� ������ ����� ������ ����. ��� �������� ��������� � �����. ����� �� ������ ����� ������ ����.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08");	//���� �� �������, � ��� ����������� �� ����, �� �������, ����� ���� ���������� � ���� �����.
};


instance KDF_402_CORRISTO_KREIS1(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis1_condition;
	information = kdf_402_corristo_kreis1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_1,LPCOST_TALENT_MAGE_1,0);
};


func int kdf_402_corristo_kreis1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,kdf_402_corristo_explaincircles) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis1_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01");	//� ����� ����������� � ������� ����� �����.
	if(b_giveskill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02");	//���������� � ������ ���� ����� ���� ���� ������ ������������ ���������� ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03");	//������ ���� �������� � ���� ���� ���������� ����������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04");	//��������� ���� ���������� ����, �� ������� ��������� ��� ����������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05");	//�� � ������� �� ���������� �������, ������� ������ ���� ���� ����� ������� ���������, ���������� ���� ����� ������ ����� � �����, � ��� �� ��������. 
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06");	//������ ���� �������� ���������� ���������� ����, ������� ����� ���� ������������� � ����� �����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07");	//��� � ��� ������, ��� ��������� ���������� ���� ��� ������ ����� ������������� ���� ���������� ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08");	//������ ����� ����, ������� �� �������, ����� ������ ���� ����������� ������ ���������� ����� ������� ���.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09");	//��������� ���� ���, ����� ������� ������ ����.
		kdf_402_corristo_kreis1.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS2(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis2_condition;
	information = kdf_402_corristo_kreis2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_2,LPCOST_TALENT_MAGE_2,0);
};


func int kdf_402_corristo_kreis2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis2_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01");	//� ����� ������� ������ ������� �����.
	if(b_giveskill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02");	//�� ��� �������� ������ ���������� ���. ������ ����� �������� ���� ������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03");	//������ ���� ����� ���� ���� ����������� ������ ������� ������ ����������, �� ����� �������, �� ������� �������� �������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04");	//�� ���� ��������� ��� ������� ���������, ����� ������� �������� ����� �����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05");	//�� ��� ������, ��� ������ ������������ ����� ����, ���� �� ��� ������ ����� ������ ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06");	//�� ��� ������� ������, � �� �� ������ ��������. ���� ���� ����, ������� ����� ��������� ������ � ����������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07");	//�������� ��� ���������� �� ���� �����, ����� ��� ������������� ����������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08");	//����������� ����� �� ���, ��� ���������� ������, � �� ������� ������� ���� ���.
		kdf_402_corristo_kreis2.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS3(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis3_condition;
	information = kdf_402_corristo_kreis3_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_3,LPCOST_TALENT_MAGE_3,0);
};


func int kdf_402_corristo_kreis3_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis3_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01");	//�� ������ �������� ��� ������ �������� ����� �����?
	if(b_giveskill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02");	//������ ���� - ����� ������ ����� ����, ������� �������� ������ ���. ��� ����������� ����������� ���� �����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03");	//�� ��� �� �������� ���� �������� �����. �� ��� ������ ������ ���������� ���.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04");	//��� ������ ������ ������� ��� ����������� �����������������. �������, ������ ��� ������������ �� ��� ���� ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05");	//�� ������ ������ �� ��� �� ������, �� ���� ����� ������ ���� �������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06");	//���� �� ������ �����, �� ������ ��������� ��� �� ����������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07");	//������ ���� ����, � �� �������� ���� ����� �������.
		kdf_402_corristo_kreis3.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS4(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis4_condition;
	information = kdf_402_corristo_kreis4_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_4,LPCOST_TALENT_MAGE_4,0);
};


func int kdf_402_corristo_kreis4_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis4_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01");	//� ����� �������� � ��������� ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02");	//���� ��� ������� ������ ���� ������ �����. ������ ����� ������� �� �����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03");	//����� ���� ������� � �����. ������ ���� �������� ��� �������� ���������� ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04");	//����� ����, ������� �������� � ������� ������. ������ ���������� ���������� �������� � ������ ������. ��� �� ���������� ������� ����� ����.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05");	//��� ����, ������� �� ������ ������������, ��������� ���� ������ � ������� � ���������� ����� ������.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06");	//������ �� ������ ���, ��� ���� � ���.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07");	//������ �����, � �� �������� ����� ����� ����.
		kdf_402_corristo_kreis4.permanent = 0;
	};
};


instance KDF_402_CORRISTO_HEAVYARMOR(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_heavyarmor_condition;
	information = kdf_402_corristo_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("�������, � ���� ������ ������� ��������� ����� ����� ����.",VALUE_KDF_ARMOR_H);
};


func int kdf_402_corristo_heavyarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_heavyarmor_info()
{
	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01");	//�������, � ���� ������ ������� ��������� ����� ����� ����.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//�� ������ ��� ������� ����. ������� �� ���, ����� ������ ����� ������.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_KDF_ARMOR_H)
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//���� �� ������� ����.
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04");	//� ����, ��� �� ��� ������� ������ ��������� ���������� ���� ����� ����.
		CreateInvItem(hero,kdf_armor_h);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
		b_giveinvitems(hero,self,itminugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor(hero);
		kdf_402_corristo_heavyarmor.permanent = 0;
	};
};

