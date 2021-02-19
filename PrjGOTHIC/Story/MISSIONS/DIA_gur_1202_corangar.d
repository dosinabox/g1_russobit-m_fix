
func void b_corangarlearn()
{
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),gur_1202_corangar_teach_str_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),gur_1202_corangar_teach_str_1);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),gur_1202_corangar_teach_dex_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),gur_1202_corangar_teach_dex_1);
	}
	else
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0),gur_1202_corangar_zweihand1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0),gur_1202_corangar_zweihand2);
	};
};

instance DIA_GUR_1202_CORANGAR_EXIT(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 999;
	condition = dia_gur_1202_corangar_exit_condition;
	information = dia_gur_1202_corangar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gur_1202_corangar_exit_condition()
{
	return TRUE;
};

func void dia_gur_1202_corangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORANGAR_LATERTRAINER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 6;
	condition = dia_corangar_latertrainer_condition;
	information = dia_corangar_latertrainer_info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_corangar_latertrainer_condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//������ ����� ������� ������? ��, ���� ������������� ����� ����� �������� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//������. ��, � ���������, � �� ���, ��� ������ ������ ����.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//� ������ ���� ���, ��� ������ � ��������� ���� �������.
};

instance DIA_CORANGAR_LATERTRAINER2(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 6;
	condition = dia_corangar_latertrainer2_condition;
	information = dia_corangar_latertrainer2_info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_corangar_latertrainer2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//������ ����� ������� ������? ��, ���� ������������� ����� ����� �������� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//����� �������� �������� ��� � ��������� �����, ����� ������������ ���� � ��������.
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//�������� � ���� - ����� ������ �������������� �����.
	Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
	b_logentry(GE_TEACHERPSI,"��� ����� ����� ������ ��� ��������� ���� � ��������. � ����� ����� ��� �� ������������� �������� �������, �� ������ ������.");
	b_logentry(GE_TEACHERPSI,"��� ����� ����� ������� ���� ���������� � ��������� �����. �� ��� ���������� ����� ����, ��� � ����� ��� � ���������� �������.");
};

instance DIA_CORANGAR_WIETEMPLER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 7;
	condition = dia_corangar_wietempler_condition;
	information = dia_corangar_wietempler_info;
	permanent = 1;
	description = "��� ��� ����� ����� �� �������?";
};


func int dia_corangar_wietempler_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_corangar_wietempler_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//��� ��� ����� ����� �� �������?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//��� ����� ���� ����� �������� ���� � ������� � ����������� ���, ���� �����������.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//����� ����� ������� �� ���, � � ���� ����� ����.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CORANGAR_TEACH(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 10;
	condition = gur_1202_corangar_teach_condition;
	information = gur_1202_corangar_teach_info;
	permanent = 1;
	description = "��� � ���� ��������� ���� � ��������?";
};


func int gur_1202_corangar_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer2) && Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void gur_1202_corangar_teach_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//��� � ���� ��������� ���� � ��������?
	b_corangarlearn();
};

func void gur_1202_corangar_teach_back()
{
	Info_ClearChoices(gur_1202_corangar_teach);
};

func void gur_1202_corangar_teach_str_1()
{
	if(DIFF_HARD == FALSE)
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
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_str_5()
{
	if(DIFF_HARD == FALSE)
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
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_dex_1()
{
	if(DIFF_HARD == FALSE)
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
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_dex_5()
{
	if(DIFF_HARD == FALSE)
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
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_zweihand1()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//����� ���� ����� ��� ��������� �����.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_8_NoLearnYouAlreadyKnow");	//������� �� ������ ������� ������ � ������ ����� ���������� � ����� ������� �����.
		PrintScreen("��������� ���������� ����������� ������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//�� ���������� � ����� ������� ������ �����, ����� ������� ��������� �� ������ ����� �����, �� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//������ ��� ������� ����������, ������� ���� ���� � ���, �� ������� ���������� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//���� � ����� - ������ ���������������. � ��� ���� � ��� ���������� ������ �����.
	};
	b_corangarlearn();
};

func void gur_1202_corangar_zweihand2()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//� ���� ��������� ��� ����� ���������� � ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//�� ��� ������ ������ �������� ���� �������. ������ � ����� ���� �������, ��������� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//���� ������ ���� ������� ���� ������������� �������� ���������� �� ����, ��� �� ������� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//���� �� ������ ������� ����������, �� ������ ��� ���������� � ����� �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//�������� - ���� ������������. ��������, ����� �������� ���� �������� � ������������, � ����� - ������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//����� �� �������� �������� �� ����. ����� ����� ����� �������� �� ����� ���� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//�������� ����������� ����. �� ������� �������� ����������, ���� ������ ���� � ��� ��������� � ���������������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//��������� ���� ���� ��������� � �����: ���� ����� �����, ���� �� ��� ���� �������� ��������.
	};
	b_corangarlearn();
};

instance GUR_1202_CORANGAR_WANNABETPL(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 5;
	condition = gur_1202_corangar_wannabetpl_condition;
	information = gur_1202_corangar_wannabetpl_info;
	important = 0;
	permanent = 1;
	description = "� ���� ����� �������!";
};


func int gur_1202_corangar_wannabetpl_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1400_gornabar_victory) || Npc_KnowsInfo(hero,tpl_1415_torwache_templeraufnahme) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_wannabetpl_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//� ���� ����� �������!
	if(CORKALOM_BRINGMCQBALLS != LOG_SUCCESS)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//�� ��� � ����� �� �����. � ����� ������� ������ �����, ����� � ���� ����� ������ �����.
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//�� ��� � ����� �� �����. � ����� ������� ������ �����, ����� � ���� ����� ������ �����.
		b_printguildcondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//���� ����� ������, �� ������ �������������� � ���.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//�� ������ �����, ��� ����� �� ������ �������� ������ � ������� ����. �� ��������� ������ �������, ������ ����.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//�� � ������ ���� ���������� ���� ���� � ���� ����. ��������� ������� ����� ����� ������ ���, ��� ���� � ��� ��������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//� ���, ��� �� ������� ����� ������� �����������, �������� �� ��� ��� ���� �������. �� ����� ���� �������� � ���� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//�������, ����� ���� ��� ����� � ���� ��������, �� ������ �������� ����� ������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//����� � ��� �� ���� �� ������������� ��������. �� ���� ���� ���� ����� �������.
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BECOMETEMPLAR,LOG_NOTE);
		b_logentry(GE_BECOMETEMPLAR,"������� ��� ����� �������� ���� �������. � ����� ����� ���� ����� ������ � ��� �� ����. ������ �� ����� �� ������������� ��������.");
	};
};

instance GUR_1202_CORANGAR_SENDS(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_sends_condition;
	information = gur_1202_corangar_sends_info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ������ ������?";
};


func int gur_1202_corangar_sends_condition()
{
	if((KAPITEL == 3) && (CORANGAR_GOTOOGY == FALSE))
	{
		return 1;
	};
};

func void gur_1202_corangar_sends_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//��� �� ��� ������ ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//���� ������� ���� ����� �������. ��� �������� ��� ������ ��������, ��� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//�� ���� ����� ����: �� ������ ���� � ������ ������. �������� ������ ���� ����������� ���� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//������ ���� �������� ��� �������, ������� ��� ����� ���������� � ��� ��������� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//���� ���� ����� ���� � ����� ���������� ������� � ���������� ����. ����� ����, ��� �� ������ ��, ��� �������� ������� �� ���� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//��� ����� �������, ������� ������ ����� � ���, � ����� ��������� �� ��� � ���������� � ���, ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//������ �� �� ������ ����� ���� ���? �� �� ������������ �������!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//��� ������ - �������� �������������. � �������� ����� � ��������� � ���� �������� ���.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//�� ��� ������ �������� ������ ������. � ������� ���� ������, ��� ���� ��-�� �� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//������� � ����� ����, ����������� �� �������� ����� � �������� ���, ��� ������� ����� ����� �������.
	Info_ClearChoices(gur_1202_corangar_sends);
	Info_AddChoice(gur_1202_corangar_sends,"� ��� � �� ��� ������?",gur_1202_corangar_sends_earn);
	Info_AddChoice(gur_1202_corangar_sends,"� ������ �� ����� ����!",gur_1202_corangar_sends_know);
};

func void gur_1202_corangar_sends_earn()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//� ��� � �� ��� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//���� ����� ����? ��������, � ������ � ����. �� ��� ��� ����� ����� ���� ������. ��� ��� ������ ����. ������ � ���� ���!
	b_printtrademsg1("�������� ����: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
};

func void gur_1202_corangar_sends_know()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//� ������ �� ����� ����!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//������ ��� ��� ������. ��� ������ �������� ���� � �����!
	b_printtrademsg1("�������� ������ ���������� ����.");
	b_story_gotoorcgraveyard();
	CreateInvItem(self,schutzring_geschosse1);
	b_giveinvitems(self,hero,schutzring_geschosse1,1);
	Info_ClearChoices(gur_1202_corangar_sends);
};


instance GUR_1202_CORANGAR_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_where_condition;
	information = gur_1202_corangar_where_info;
	important = 0;
	permanent = 0;
	description = "��� ��������� �������� �����?";
};


func int gur_1202_corangar_where_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_sends) && (BAALLUKOR_BRINGPARCHMENT == 0))
	{
		return 1;
	};
};

func void gur_1202_corangar_where_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//��� ��������� �������� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//��� ��������. ��������� ����� ����� ������. �� ������� ����� ��� �� ������� ����� ������. �� ������ ���� ����.
	b_logentry(CH3_ORCGRAVEYARD,"��������� ����� ������ �������� ��� ������ �� �������� �����. �� ���� ���� �� ������� ����� ������.");
};


instance GUR_1202_CORANGAR_AFTER(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_after_condition;
	information = gur_1202_corangar_after_info;
	important = 0;
	permanent = 0;
	description = "� ��� �� �������� �����. �� �� ������ ��� ������ �����...";
};


func int gur_1202_corangar_after_condition()
{
	if(BAALLUKOR_BRINGPARCHMENT == 4)
	{
		return 1;
	};
};

func void gur_1202_corangar_after_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//� ��� �� �������� �����. �� �� ������ ��� ������ �����. ������� ������, ����������� �� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//� ��� � ������ ������� � ��������?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//��� ��� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//������? �� ������, ��� ���� ����� ��?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//� ������� ����� ����� �����. ��� ��� ����� ���� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//���� ����� ���� �������� �� ���, ��, � ���������, �� ����� � ���.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//�� ���� �������, ��� ������ �������� ��� ����� ����, � ��������� ��������� ���� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//��������, ��� �� ��������� ��-�� �������� �������������. �� ��� ����� ����� ���-������ ���.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//� �� ����, ��� ��� �������� ��� ������ ����� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//������ �� �����... ����������... �������!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//�������, ��� ���� ����� �� ���� ����������� ���� ���������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//������ ��� ���� ������� �� ��������.
	b_givexp(XP_REPORTTOCORANGAR);
	b_story_backfromorcgraveyard();
};

var int yberion_day;

instance INFO_CORANGAR_FINDHERB(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_findherb_condition;
	information = info_corangar_findherb_info;
	permanent = 0;
	important = 0;
	description = "��� ���� � ��������?";
};


func int info_corangar_findherb_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_after))
	{
		return 1;
	};
};

func void info_corangar_findherb_info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//��� ���� � ��������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//��� �� �� ������ ����������. �� ������ �������. � ����, ��� ����� ��� ���������, �� ��� ����� ��� ����� ���� ������.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//��� � ���� ��� ������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//����� ��� �������� �������� �����. ������� ��� ���� ����� ����������� �� ���.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//����� ����, ������� ������ ���� ������? �� �� �������.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//�, ����������, ����������!
	AI_StopProcessInfos(self);
	CORANGAR_FINDHERB = LOG_RUNNING;
	Log_CreateTopic(CH3_FINDHERBS,LOG_MISSION);
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_RUNNING);
	b_logentry(CH3_FINDHERBS,"������� ��� ��� ��� ��������. ��� ����� �������� ���� ����� ��� ���� ���� ������ ����� ������� �������� ����. �� ������� �� ���..?");
	YBERION_DAY = Wld_GetDay();
};


instance INFO_CORANGAR_FINDHERB_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_where_condition;
	information = info_corangar_findherb_where_info;
	permanent = 0;
	important = 0;
	description = "� ��� ������ ��� �����?";
};


func int info_corangar_findherb_where_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_where_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//� ��� ������ ��� �����?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//����� � ������� �� �������. ��� ������ ���������� ������ ������, �� ���� ���������, ��� ���� ����� ��������� ����������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//�� ����� ������ �������. ��� ��!
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"��� ����� � ����� ����� ������ �� ������� �� ������� ��������. ��� ������� ������� ����������. � ������ ���� ����� ���������.");
};


instance INFO_CORANGAR_FINDHERB_LOOK(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_look_condition;
	information = info_corangar_findherb_look_info;
	permanent = 0;
	important = 0;
	description = "��� ��� ������ �� �����, ������� ������� ��������?";
};


func int info_corangar_findherb_look_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_look_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//��� ��� ������ �� �����, ������� ������� ��������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//��� ������ �� ������ �� ������ ������� � ��������� �����-�������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//� ������ ���.
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"�������� ����� ������ �� ������ �� ������� ������� � ������� ��������� �������.");
};


instance INFO_CORANGAR_FINDHERB_RUNNING(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_running_condition;
	information = info_corangar_findherb_running_info;
	permanent = 1;
	important = 0;
	description = "��� ����, ������� � �����, ����� ������������.";
};


func int info_corangar_findherb_running_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5) && (Npc_HasItems(other,itfo_plants_herb_03) > 0) && Npc_KnowsInfo(hero,info_corangar_findherb_where) && Npc_KnowsInfo(hero,info_corangar_findherb_look))
	{
		return 1;
	};
};

func void info_corangar_findherb_running_info()
{
	var C_NPC fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//��� ����, ������� � �����, ����� ������������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//����� ����, ������� ������ ���� ������? �� �� �������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//���� ����� ����������. ������� ���� ������. ������� �� ����� ����� �� ������.
	AI_StopProcessInfos(self);
	if(!FORTUNO_HASYBERIONHERBS)
	{
		fortuno = Hlp_GetNpc(nov_1357_fortuno);
		CreateInvItems(fortuno,itfo_plants_herb_03,5);
		FORTUNO_HASYBERIONHERBS = TRUE;
		b_logentry(CH3_FINDHERBS,"����� ����� ����� ���� ��������� � �������.");
	};
};


instance INFO_CORANGAR_FINDHERB_SUCCESS(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_success_condition;
	information = info_corangar_findherb_success_info;
	permanent = 0;
	important = 0;
	description = "(������ �������� �����)";
};


func int info_corangar_findherb_success_condition()
{
	if(Npc_HasItems(other,itfo_plants_herb_03) >= 5 && (CORANGAR_FINDHERB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_findherb_success_info()
{
	var C_NPC yberion;
	var C_NPC angar;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	angar = Hlp_GetNpc(gur_1202_corangar);
	b_giveinvitems(other,self,itfo_plants_herb_03,5);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01");	//� ����� �������� ����� ��� ��������.
	b_printtrademsg1("������ 5 �������� ������.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//�������. ����� �� ������, ������� ������� ���������.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//�� ���-������ ������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//��, �� ������, ��� ������ �� ����� ���� �� �������� ���, ��� �� � ��� ������. �� �� ������ �������� ��������� ���.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//������ ��� �������� ��������� �� ��, ��� �������� ����� ��������.
	YBERION_DEAD = LOG_RUNNING;
	b_givexp(XP_FINDHERBS);
	//CORANGAR_FINDHERB = LOG_SUCCESS;
	//b_logentry(CH3_FINDHERBS,"� ������� ��� ������ �������� �����. ������ ����� ������ ��������� �� ��, ��� ��� �� ������� ������.");
	//Log_SetTopicStatus(CH3_FINDHERBS,LOG_SUCCESS);
	b_logentry(CH3_FINDHERBS,"� ������� ��� ������ �������� �����, �� ��� �� ������� ��������... ����� �������� ����...");
	CORANGAR_FINDHERB = LOG_FAILED;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,yberion);
	yberion.flags = 0;
	Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX]);
	AI_UseItemToState(self,itfo_plants_herb_03,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//������� ����. ��� �������� ������� ������� ���!
	AI_UseItemToState(self,itfo_plants_herb_03,-1);
	AI_TurnToNPC(self,other);
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//���� ���� ������ �� ������ ��������� �� ���� ������!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//� ������ ������� ��������. ����� ������� �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//����� ���� �������� �� ������ ����������� � ���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg2("������� ���� �� �����������.");
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	if(YBERION_KEY_STOLEN == FALSE)
	{
		CreateInvItem(self,itke_yberion);
	};
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"���� �������, �������� ���� ��������! �� ��������� �� � �����! ����� ������� �� ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������ ��� �������� ����� ����������� ����� ����. ");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
};

instance INFO_CORANGAR_TELEPORT(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_teleport_condition;
	information = info_corangar_teleport_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_teleport_condition()
{
	if(Npc_KnowsInfo(hero,info_corangar_findherb_success) || Npc_KnowsInfo(hero,info_corangar_yberion_died) || Npc_KnowsInfo(hero,info_corangar_healthwater))
	{
		return TRUE;
	};
};

func void info_corangar_teleport_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//�������!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//� ��� ����?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//������ ��� ���� � ���� ����� ������������� �� ���� ������.
	b_printtrademsg1("�������� ���� ������������ � �������� ������.");
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//��� ���� ���� ����������� ������ ����������� �� ������� ����� ����� ������.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//������� ����!
	if(YBERION_DIED == TRUE)
	{
		Npc_ExchangeRoutine(self,"AFTER");
		b_exchangeroutine(gur_1207_natalia,"AFTER");
		b_exchangeroutine(gur_1205_chani,"AFTER");
	}
	else if(YBERION_HEALED == TRUE)
	{
		Npc_ExchangeRoutine(self,"guru");
	};
	b_story_senttonc();
};

instance CORANGAR_STEALKEY(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 990;
	condition = corangar_stealkey_condition;
	information = corangar_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(������� ����)";
};


func int corangar_stealkey_condition()
{
	if(Npc_HasItems(self,itke_yberion) && Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2 && Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1)
	{
		return TRUE;
	};
};

func void corangar_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//���� �����-������ ������ ������ ����� �� ��������?
	AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//�������, ����� ���� ��� ����� � ���� ��������, �� ������ �������� ����� ������.
	AI_DrawWeapon(self);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_1HSFREE");
	AI_RemoveWeapon(self);
	PrintScreen("������� ����.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,itke_yberion);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_StopProcessInfos(self);
};

instance INFO_CORANGAR_YBERION_DIED(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_yberion_died_condition;
	information = info_corangar_yberion_died_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_yberion_died_condition()
{
	if((YBERION_DAY <= (Wld_GetDay() - 2)) && CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void info_corangar_yberion_died_info()
{
	var C_NPC yberion;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	yberion.flags = 0;
	Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX]);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"���� �������, �������� ���� ��������! �� ��������� �� � �����! ����� ������� �� ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������ ��� �������� ����� ����������� ����� ����. ");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//������� ����. ��� �������� ������� ������� ���!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//� ������ ������� ��������. ����� ������� �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg1("������� ���� �� �����������.");
	b_logentry(CH3_FINDHERBS,"� �� ����� �������� �������� �������� �����... ����� �������� ����...");
	CORANGAR_FINDHERB = LOG_FAILED;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_StopProcessInfos(self);
};

instance INFO_CORANGAR_HEALTHWATER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 2;
	condition = info_corangar_healthwater_condition;
	information = info_corangar_healthwater_info;
	permanent = 0;
	important = 0;
	description = "(������ ����� �������)";
};


func int info_corangar_healthwater_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && Npc_HasItems(other,healthwater))
	{
		return 1;
	};
};

func void info_corangar_healthwater_info()
{
	var C_NPC yberion;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	b_giveinvitems(other,self,healthwater,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	b_givexp(2000);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"������� ��������� ������� � ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01_New");	//���, ����� ����, ��� �������.
	b_printtrademsg1("������ �������� ����� �������.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//������ ��� �������� ��������� �� ��, ��� �������� ����� ��������.
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,yberion);
	AI_UseItemToState(self,healthwater,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(self,3);
	AI_UseItemToState(self,healthwater,-1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02_New");	//�������. ������� ������� ���������.
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//�� ���-������ ������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//��, �� ������, ��� ������ �� ����� ���� �� �������� ���, ��� �� � ��� ������. �� �� ������ �������� ��������� ���.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03_New");	//� ������ ������� ��������. �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg2("������� ���� �� �����������.");
	b_logentry(CH3_FINDHERBS,"����� ������� ���������! ������� ������ � ���� � ����� ������� ���������� � ��� �������, ������ ��� ������� ��������. �� ��� ��� ����, �� ��� �� ��� ������. �������, �� ����������.");
	CORANGAR_FINDHERB = LOG_SUCCESS;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_SUCCESS);
	YBERION_HEALED = TRUE;
	AI_StopProcessInfos(self);
};

