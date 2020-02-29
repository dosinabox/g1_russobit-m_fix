
func void b_wolflearn()
{
	Info_ClearChoices(org_855_wolf_teach);
	Info_AddChoice(org_855_wolf_teach,DIALOG_BACK,org_855_wolf_teach_back);
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
	{
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_855_wolf_teach_dex_5);
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_855_wolf_teach_dex_1);
	}
	else
	{
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),org_855_wolf_teach_dex_5);
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),org_855_wolf_teach_dex_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNBOW_1,LPCOST_TALENT_BOW_1,50),org_855_wolf_train_info);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice(org_855_wolf_teach,b_buildlearnstring(NAME_LEARNBOW_2,LPCOST_TALENT_BOW_2,50),org_855_wolf_trainagain_info);
	};
};

instance DIA_ORG_855_WOLF_EXIT(C_INFO)
{
	npc = org_855_wolf;
	nr = 999;
	condition = dia_org_855_wolf_exit_condition;
	information = dia_org_855_wolf_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_org_855_wolf_exit_condition()
{
	return 1;
};

func void dia_org_855_wolf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_HELLO(C_INFO)
{
	npc = org_855_wolf;
	nr = 1;
	condition = dia_wolf_hello_condition;
	information = dia_wolf_hello_info;
	permanent = 0;
	description = "��� ��?";
};


func int dia_wolf_hello_condition()
{
	return 1;
};

func void dia_wolf_hello_info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//���� ����� ����. � ����� �������.
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"���� ������� ����� �������. ��� ����� ����� ����� ��� ����, � ������� ������ ������ ������.");
};

instance DIA_WOLF_GREETORG(C_INFO)
{
	npc = org_855_wolf;
	nr = 1;
	condition = dia_wolf_greetorg_condition;
	information = dia_wolf_greetorg_info;
	permanent = 0;
	important = 1;
};


func int dia_wolf_greetorg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_wolf_greetorg_info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//��! ������ �� ���� �� ���.
};


instance ORG_855_WOLF_TRADE(C_INFO)
{
	npc = org_855_wolf;
	nr = 800;
	condition = org_855_wolf_trade_condition;
	information = org_855_wolf_trade_info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int org_855_wolf_trade_condition()
{
	if(Npc_KnowsInfo(hero,org_855_wolf_sellbow))
	{
		return 1;
	};
};

func void org_855_wolf_trade_info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//������, ��� � ���� ����.
};


instance ORG_855_WOLF_WHEREHUNTER(C_INFO)
{
	npc = org_855_wolf;
	nr = 900;
	condition = org_855_wolf_wherehunter_condition;
	information = org_855_wolf_wherehunter_info;
	permanent = 0;
	description = "��� ���������� ���� � �����?";
};


func int org_855_wolf_wherehunter_condition()
{
	if(((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE)) && Npc_KnowsInfo(hero,org_855_wolf_sellbow))
	{
		return 1;
	};
};

func void org_855_wolf_wherehunter_info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//��� ���������� ���� � �����?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01");	//�� ���� � ����� ������ ����� ������� �����. �� ����� ���� �������, ��� ��������� ����������� ������.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_02");	//������� � ����� ����� � �������� ����� ������� ������, �� ���� � �������� �������.
};


var int wolf_armor_m_was_bought;
var int wolf_armor_h_was_bought;

instance DIA_WOLF_SELLARMOR(C_INFO)
{
	npc = org_855_wolf;
	nr = 700;
	condition = dia_wolf_sellarmor_condition;
	information = dia_wolf_sellarmor_info;
	permanent = 1;
	description = "��� ����� ������ �������.";
};


func int dia_wolf_sellarmor_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_hello) && !Npc_KnowsInfo(hero,info_wolf_armorfinished) && ((WOLF_ARMOR_M_WAS_BOUGHT != 1) || (WOLF_ARMOR_H_WAS_BOUGHT != 1)))
	{
		return 1;
	};
};

func void dia_wolf_sellarmor_info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//��� ����� ������ �������.
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//������ �� ���� �� ���, � ������ ������ � ���� ���, ��� ��������.
		Info_ClearChoices(dia_wolf_sellarmor);
		Info_AddChoice(dia_wolf_sellarmor,DIALOG_BACK,dia_wolf_sellarmor_back);
		if(WOLF_ARMOR_H_WAS_BOUGHT != 1)
		{
			Info_AddChoice(dia_wolf_sellarmor,b_buildbuyarmorstring("������� ������ ����, ������: 40/5/20/0",VALUE_ORG_ARMOR_H),dia_wolf_sellarmor_h);
		};
		if(WOLF_ARMOR_M_WAS_BOUGHT != 1)
		{
			Info_AddChoice(dia_wolf_sellarmor,b_buildbuyarmorstring("������� ������ ����, ������: 35/5/15/0",VALUE_ORG_ARMOR_M),dia_wolf_sellarmor_m);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//������ � �� ���� ������� �� ����. ���� ��� ������ �������, ���� � ������ ������� ������.
	};
};

func void dia_wolf_sellarmor_back()
{
	Info_ClearChoices(dia_wolf_sellarmor);
};

func void dia_wolf_sellarmor_m()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//� ���� ������ ������� ������.
	if(Npc_HasItems(hero,itminugget) < VALUE_ORG_ARMOR_M)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	}
	else
	{
		b_printtrademsg1("������ ����: 1050");
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//������� ������. ������ �� �����, ��� �� ���, �� �� ���� ������ ���� ��������.
		b_printtrademsg2("������� ������� ������ ����.");
		b_giveinvitems(hero,self,itminugget,VALUE_ORG_ARMOR_M);
		CreateInvItem(self,org_armor_m);
		b_giveinvitems(self,hero,org_armor_m,1);
		AI_EquipArmor(hero,org_armor_m);
		WOLF_ARMOR_M_WAS_BOUGHT = 1;
	};
};

func void dia_wolf_sellarmor_h()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//�� �������� ������� �������?
	if(Npc_HasItems(hero,itminugget) < VALUE_ORG_ARMOR_H)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//��� ���� �� ������ �� ������� ������.
	}
	else
	{
		b_printtrademsg1("������ ����: 1200");
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//���� ������ ������� ���� �� ����� ���������. � ��� ����� ����, �, ��� ������, �� ��� ��� ���.
		b_giveinvitems(hero,self,itminugget,VALUE_ORG_ARMOR_H);
		CreateInvItem(hero,org_armor_h);
		b_printtrademsg2("������� ������� ������ ����.");
		AI_EquipArmor(hero,org_armor_h);
		WOLF_ARMOR_H_WAS_BOUGHT = 1;
	};
};

func void org_855_wolf_train_info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//����� ���� �������� �� ����.
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		if(hero.lp >= LPCOST_TALENT_BOW_1)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(hero,self,itminugget,50);
		};
		if(b_giveskill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//���� �������� ������ �� �������� ��������. ��� ����� �� �������� �����, ��� ������ ����� ���� ��������.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//��� ����� �� ������� �������� �� ����, ��� ������ ����� ����������, �� ������� �� ������� �������� ���� ����. �� ������ ��������� � ��, � ������, ����� ����� ������� ��������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_wolflearn();
};

func void org_855_wolf_trainagain_info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//� ���� ��������� ����� �������� �� ����.
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		if(hero.lp >= LPCOST_TALENT_BOW_2)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(hero,self,itminugget,50);
		};
		if(b_giveskill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//�� ��� ������� �������. ���� �������� ������� ��������� �����������.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//������� �����: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//��� ���� �� ������ �� ������� ������.
	};
	b_wolflearn();
};


instance ORG_855_WOLF_TEACH(C_INFO)
{
	npc = org_855_wolf;
	nr = 100;
	condition = org_855_wolf_teach_condition;
	information = org_855_wolf_teach_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int org_855_wolf_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_hello))
	{
		return TRUE;
	};
};

func void org_855_wolf_teach_info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//�������� ��������, ��� ������� ���� �������� ������ � �����.
	if(LOG_WOLFTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
		b_logentry(GE_TEACHERNC,"��� ���� ����� ������ ��� ��������� ��������.");
		LOG_WOLFTRAIN = TRUE;
		if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2)
		{
			AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//� ���� ��������� �������� �� ����.
			AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//� ���� ������� ����, �� �� ���������. ��� ���� ����� �� ���-�� ����.
			AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//������� �� ������?
			AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//������ ��� ���� ����� 50 ������ ����, � ���� ����� ���������.
			Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
			b_logentry(GE_TEACHERNC,"��� ���� ����� ������� ���� �������� �� ����.");
		};
	};
	b_wolflearn();
};

func void org_855_wolf_teach_back()
{
	Info_ClearChoices(org_855_wolf_teach);
};

func void org_855_wolf_teach_dex_1()
{
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
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
	b_wolflearn();
};

func void org_855_wolf_teach_dex_5()
{
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
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
	b_wolflearn();
};

instance INFO_WOLF_GOOD(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_good_condition;
	information = info_wolf_good_info;
	important = 0;
	permanent = 0;
	description = "���� ������, ��� �� ������ ���������� �� ����.";
};


func int info_wolf_good_condition()
{
	if(GORN_GOTOWOLF)
	{
		return TRUE;
	};
};

func void info_wolf_good_info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//���� ������, ��� �� ������ ���������� �� ����.
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//���, ��� �� ������ �� ��� ����� ������.
	if(!Npc_KnowsInfo(hero,info_gorn_fmcentrance))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//����� ����� ������?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//����� ������ � �� ����� ��������� �����.
	};
};


instance INFO_WOLF_SPEAK(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_speak_condition;
	information = info_wolf_speak_info;
	important = 0;
	permanent = 0;
	description = "� ��� �� ������?";
};


func int info_wolf_speak_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_good))
	{
		return TRUE;
	};
};

func void info_wolf_speak_info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//� ��� �� ������?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//� ��������, ��� �������� �������� ����� ��������.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//��? � ���?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//����� ������� �������� � ������� - ������� ��������.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//�������, �� ��� ������ ���������, ������� �������� � ����� ������...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//...���. � ������ � ������ ��������, � ���, ��� ����� � ����� �����.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//�� ������� ����� ���������� �������. �� �� ����� ������� ������.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//���� �� ��������� ��� ���� ���� ����� �������, � ���������� ������� �� ���� ������.
};


instance INFO_WOLF_SKIN(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_skin_condition;
	information = info_wolf_skin_info;
	important = 0;
	permanent = 0;
	description = "��� �������� ��� �������� � �������� ��������?";
};


func int info_wolf_skin_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_speak))
	{
		return TRUE;
	};
};

func void info_wolf_skin_info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//��� �������� ��� �������� � �������� ��������?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//�������� ������. ������� �������� ����������� � �������� �������� ������ �� �����.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//�� ����� �������, ����������� ����� ������ ���.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//� �����! ���������, ����� �� � ����� ��� ��������.
	KNOWS_GETMCPLATES = TRUE;
	PrintScreen("�����: ������ ��������� �������",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPLATEARMOR,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPLATEARMOR,LOG_RUNNING);
	b_logentry(CH4_MCPLATEARMOR,"��� �� ����� ���� �� ������ ������ ��������� ��� ������ ��������� �������� ��������, �� ������� �� ������ ������� ������. �� ��������� ���, ��� �������� ��� ��������.");
	Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
	b_logentry(GE_ANIMALTROPHIES,"����� ������ ��������� ������� ��������-������.");
	AI_StopProcessInfos(self);
};


instance INFO_WOLF_PROFIT(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_profit_condition;
	information = info_wolf_profit_info;
	important = 0;
	permanent = 0;
	description = "� �� �������� ��� ��� ���, ������ �� ������ ������?";
};


func int info_wolf_profit_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_speak))
	{
		return TRUE;
	};
};

func void info_wolf_profit_info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//� �� �������� ��� ��� ���, ������ �� ������ ������?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//��, �� ������... ���� � ���� ��������� ������� ������ �� ���� �������, �� � ������... ������... �, �����, ������ �� ����!
};


instance INFO_WOLF_MCPLATESFEW(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_mcplatesfew_condition;
	information = info_wolf_mcplatesfew_info;
	important = 0;
	permanent = 1;
	description = "� ����� ��������� ������� � �������� ��������!";
};


func int info_wolf_mcplatesfew_condition()
{
	if(KNOWS_GETMCPLATES && (Npc_HasItems(hero,itat_crawler_02) > 0) && (Npc_HasItems(hero,itat_crawler_02) < 15) && (MCPLATESDELIVERED == FALSE))
	{
		return TRUE;
	};
};

func void info_wolf_mcplatesfew_info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//� ����� ��������� ������� � �������� ��������!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//���, �� ������� ����! �� �� ������ �� ������� ������!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//������ ��� ���!
};


instance INFO_WOLF_MCPLATESENOUGH(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_mcplatesenough_condition;
	information = info_wolf_mcplatesenough_info;
	important = 0;
	permanent = 0;
	description = "� ������ �������� ���� ������ ��������!";
};


func int info_wolf_mcplatesenough_condition()
{
	if(KNOWS_GETMCPLATES && (Npc_HasItems(hero,itat_crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void info_wolf_mcplatesenough_info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//� ������ �������� ���� ������ ��������!
	b_printtrademsg1("������ 15 ��������� �������.");
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//�������! � ������� ���� ����� ������!
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//��� ������ ����� �������?
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//�� ����. � �� ������� ��� �� ����������� ����� ��������.
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//������ �� ���, ����� � ���� ����� �� ��� �����.
	MCPLATESDELIVERED = TRUE;
	b_logentry(CH4_MCPLATEARMOR,"� ����� ����� 15 ��������� �������. �� ������, ��� ��� ����� �����. � ����� � ���� �����.");
	b_givexp(XP_DELIVEREDMCPLATES);
	Npc_RemoveInvItems(hero,itat_crawler_02,15);
	AI_StopProcessInfos(self);
};


instance INFO_WOLF_ARMORINWORK(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_armorinwork_condition;
	information = info_wolf_armorinwork_info;
	important = 0;
	permanent = 1;
	description = "��� ������������ ������������ ��������?";
};


func int info_wolf_armorinwork_condition()
{
	if((MCPLATESDELIVERED == TRUE) && (FREEMINEORC_LOOKINGULUMULU != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void info_wolf_armorinwork_info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//��� ������������ ������������ ��������?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//���� ���� �� ��� ������, ��� �������� ��. ��� �������� ����� �� ��������� ���������, � � ��� �� ��������, ��� �� ����� �������� ����� �����.
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//��� ����� ��� ������� �������. �� � ���-������ ��������!
	AI_StopProcessInfos(self);
};


instance INFO_WOLF_ARMORFINISHED(C_INFO)
{
	npc = org_855_wolf;
	condition = info_wolf_armorfinished_condition;
	information = info_wolf_armorfinished_info;
	important = 0;
	permanent = 0;
	description = "�� ���, �� ��� ������ �������?";
};


func int info_wolf_armorfinished_condition()
{
	if((MCPLATESDELIVERED == TRUE) && (FREEMINEORC_LOOKINGULUMULU == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void info_wolf_armorfinished_info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//�� ���, �� ��� ������ �������?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//� ��������, ��� �������� ��������. � ���� ����������.
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//��� ������, ��� ������� ��� ������?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//��, �������. ��� ���. ��� ������� ���� �������� � ����� ������, ��� ����� �����.
	b_printtrademsg1("������� ������ �� ��������� �������.");
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//�������. � ���� �������.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//�, �� ����������! � ������ ����� ������ ����� ����.
	b_logentry(CH4_MCPLATEARMOR,"������ �����. �������� ������, � ���� �� ��� ������ ������, ������� � �����-���� �����.");
	Log_SetTopicStatus(CH4_MCPLATEARMOR,LOG_SUCCESS);
	b_givexp(XP_GORMCPLATEARMOR);
	CreateInvItem(self,crw_armor_h);
	b_giveinvitems(self,hero,crw_armor_h,1);
	AI_EquipArmor(hero,crw_armor_h);
};


instance ORG_855_WOLF_SELLBOW(C_INFO)
{
	npc = org_855_wolf;
	condition = org_855_wolf_sellbow_condition;
	information = org_855_wolf_sellbow_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ��������� ������� ����?";
};


func int org_855_wolf_sellbow_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_hello))
	{
		return 1;
	};
};

func void org_855_wolf_sellbow_info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//��� ����� ��������� ������� ����?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//�� ������ ����, ���� �����. �� ������ ������ � ���� ������� ���, ���� � ���� ���� ����.
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//� ������� ���� � ����� � ���������. ���� � ���� �������� ���-�� ��������, � ������������� �����.
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"��� ���� ������� ����.");
};

instance ORG_855_WOLF_FISK(C_INFO)
{
	npc = org_855_wolf;
	nr = 2;
	condition = org_855_wolf_fisk_condition;
	information = org_855_wolf_fisk_info;
	permanent = 0;
	description = "����� �� ������� ������ ����� ��������.";
};

func int org_855_wolf_fisk_condition()
{
	if(FISK_GETNEWHEHLER == LOG_RUNNING && !Npc_KnowsInfo(hero,org_843_sharky_fisk))
	{
		return TRUE;
	};
};

func void org_855_wolf_fisk_info()
{
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00");	//����� �� ������� ������ ����� ��������.
	AI_Output(self,other,"SVM_9_NotNow");	//���, �� ������.
};

