
func void b_torrezlearn()
{
	Info_ClearChoices(kdf_405_torrez_mana);
	Info_AddChoice(kdf_405_torrez_mana,DIALOG_BACK,kdf_405_torrez_mana_back);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY * 5),kdf_405_torrez_mana_man_5);
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),kdf_405_torrez_mana_man_1);
	}
	else if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_405_torrez_mana_man_5);
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_405_torrez_mana_man_1);
	}
	else
	{
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY * 5),kdf_405_torrez_mana_man_5);
		Info_AddChoice(kdf_405_torrez_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),kdf_405_torrez_mana_man_1);
	};
};

instance DIA_TORREZ_EXIT(C_INFO)
{
	npc = kdf_405_torrez;
	nr = 999;
	condition = dia_torrez_exit_condition;
	information = dia_torrez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_torrez_exit_condition()
{
	return 1;
};

func void dia_torrez_exit_info()
{
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_TORREZ_HELLO(C_INFO)
{
	npc = kdf_405_torrez;
	nr = 1;
	condition = dia_torrez_hello_condition;
	information = dia_torrez_hello_info;
	permanent = 0;
	description = "� ��� ���������� ���� ����� ����.";
};


func int dia_torrez_hello_condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_KDF && !Npc_KnowsInfo(hero,dia_milten_letter))
	{
		return 1;
	};
};

func void dia_torrez_hello_info()
{
	AI_Output(other,self,"DIA_Torrez_Hello_15_00");	//� ��� ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Torrez_Hello_04_01");	//�������� �� ���� � ���������! � �� ����� ���!
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_TORREZ_BELOHNUNG(C_INFO)
{
	npc = kdf_405_torrez;
	nr = 5;
	condition = dia_torrez_belohnung_condition;
	information = dia_torrez_belohnung_info;
	permanent = 0;
	description = "���� ������� ��������. � ������� ��� ������, � ���� ������� �������.";
};


func int dia_torrez_belohnung_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (MILTEN_HASLETTER == TRUE))
	{
		return 1;
	};
};

func void dia_torrez_belohnung_info()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_15_00");	//���� ������� ��������. � ������� ��� ������ � ������ ���� ������� ���� �������.
	AI_Output(self,other,"DIA_Torrez_Belohnung_04_01");	//�� ������ ��� ���������� ������, �, �������, ������ �������� �� ��� �������. �������.
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
	    b_logentry(KDFLETTER,"� ������� ������� � �������. ��� ������� ���������.");
	    Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
		PYROCAR_MESSENGER = LOG_SUCCESS;
	};
	Info_ClearChoices(dia_torrez_belohnung);
	Info_AddChoice(dia_torrez_belohnung,"�������� ���� ���� (����. ���. ���� +5)",dia_torrez_belohnung_manamax);
	Info_AddChoice(dia_torrez_belohnung,"3 ������ (�������� ���, ������ � ����������� � ����������)",dia_torrez_belohnung_scrolls);
	Info_AddChoice(dia_torrez_belohnung,"������ �������� (+5)",dia_torrez_belohnung_dex);
	Info_AddChoice(dia_torrez_belohnung,"������ ���� (+5)",dia_torrez_belohnung_str);
};

func void dia_torrez_belohnung_str()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00");	//� ������ ������ ����.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01");	//���� ����� �� ��� �����������. ���, ������ ������.
	b_printtrademsg1("�������� ������ ����.");
	CreateInvItem(hero,staerkering);
	Info_ClearChoices(dia_torrez_belohnung);
};

func void dia_torrez_belohnung_dex()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00");	//� ������ ������ ��������.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01");	//�������� ��������� ����. � ������� ���� �����.
	b_printtrademsg1("�������� ������ ��������.");
	CreateInvItem(hero,ring_des_geschicks);
	Info_ClearChoices(dia_torrez_belohnung);
};

func void dia_torrez_belohnung_scrolls()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00");	//��� ��� ���������� ������.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01");	//��������� �� � ���� � �����, ��� �� ������ ��������� ���������� �� ������ ������ ���� ���!
	b_printtrademsg1("�������� ������: �������� ���, ������ � ����������� � ����������.");
	CreateInvItem(other,itarscrollfireball);
	CreateInvItem(other,itarscrolltrfscavenger);
	CreateInvItem(other,itarscrollchainlightning);
	Info_ClearChoices(dia_torrez_belohnung);
};

func void dia_torrez_belohnung_manamax()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00");	//� ������ �����!
	AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01");	//���� ����� ������� � ����� ��������. ��� ����� ������ �� ����, ��� �� ��� ����� � ����. ����� ��� �����, � ��� �������� ���� ����!
	b_printtrademsg1("�������� �������� ���� ����.");
	CreateInvItem(hero,itfo_potion_mana_perma_01);
	Info_ClearChoices(dia_torrez_belohnung);
};


instance DIA_TORREZ_BRIEFTAUSCH(C_INFO)
{
	npc = kdf_405_torrez;
	nr = 5;
	condition = dia_torrez_brieftausch_condition;
	information = dia_torrez_brieftausch_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ������. �� ������� � ���� �������� �������!";
};


func int dia_torrez_brieftausch_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (MILTEN_HASLETTER == FALSE))
	{
		return 1;
	};
};

func void dia_torrez_brieftausch_info()
{
	var C_NPC corristo;
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_00");	//� ���� ���� ��� ���� ������. �� ������� � ���� �������� �� ���� �������!
	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_01");	//������ �� ���� �� ���������� � ���������?
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_02");	//� ��� ��������� � ���.
	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_03");	//�������. � ���� ���� ��� ���� �������. � ������ ������ ��� ������!
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04");	//��� ���.
	if(Npc_HasItems(other,itwr_fire_letter_01) >= 1)
	{
		b_printtrademsg1("������ ������������ ������.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_05");	//��� ���� ������� - ������ ����. ������ ��������, � ���� �� ����� ��������.
		b_printtrademsg2("�������� ������ ����.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_06");	//� ������ ���!
		Npc_RemoveInvItems(hero,itwr_fire_letter_01,1);
		CreateInvItems(hero,staerkering,1);
		b_givexp(XP_XARDASLETTER);
	}
	else if(Npc_HasItems(other,itwr_fire_letter_02) >= 1)
	{
		b_printtrademsg1("������ �������� ������.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_07");	//������ �������.
		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_08");	//��, ��� ���� ������� �����������.
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_09");	//��� �, ��� ���� ������� - �������� �����. ��� ���� �������. ������ �����, ��������� ������ ��� ������, �� �������� ������.
		b_printtrademsg2("�������� ����� ���������.");
		Npc_RemoveInvItems(hero,itwr_fire_letter_02,1);
		CreateInvItems(hero,itfo_potion_health_03,1);
		b_givexp(XP_XARDASLETTEROPEN);
	};
	corristo = Hlp_GetNpc(kdf_402_corristo);
	CreateInvItems(corristo,itwr_fire_letter_02,1);
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
	    b_logentry(KDFLETTER,"� �������� ������ ����� � ������� ������� � �������.");
	    Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
		PYROCAR_MESSENGER = LOG_SUCCESS;
	};
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_TORREZ_PERM(C_INFO)
{
	npc = kdf_405_torrez;
	nr = 1;
	condition = dia_torrez_perm_condition;
	information = dia_torrez_perm_info;
	permanent = 1;
	description = "��� ���� �������� �����?";
};


func int dia_torrez_perm_condition()
{
    if(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_torrez_perm_info()
{
	AI_Output(other,self,"DIA_Torrez_PERM_15_00");	//��� ���� �������� �����?
	AI_Output(self,other,"DIA_Torrez_PERM_04_01");	//���� ���� ���� �� ��������!
	AI_StopProcessInfos(self);
};


instance KDF_405_TORREZ_BOOK(C_INFO)
{
	npc = kdf_405_torrez;
	condition = kdf_405_torrez_book_condition;
	information = kdf_405_torrez_book_info;
	important = 1;
	permanent = 0;
};


func int kdf_405_torrez_book_condition()
{
	if(Npc_KnowsInfo(hero,kdf_402_corristo_robe) && Npc_KnowsInfo(hero,kdf_403_drago_rune))
	{
		return TRUE;
	};
};

func void kdf_405_torrez_book_info()
{
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_01");	//������ ���� ����� ������ � ����������� �����. ����� �� � �� ����������� ������. � � ������ - ����!
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_02");	//���, ������ ����� ������� �����. ��� ������ ���� �������� �����.
	b_printtrademsg1("�������� ����� '������ ���� �����'.");
	b_giveinvitems(self,hero,itwr_book_circle_01,1);
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance KDF_405_TORREZ_SELLBOOKS(C_INFO)
{
	npc = kdf_405_torrez;
	condition = kdf_405_torrez_sellbooks_condition;
	information = kdf_405_torrez_sellbooks_info;
	important = 0;
	permanent = 1;
	description = "� ���� ���������� ���������� ������.";
	trade = 1;
};


func int kdf_405_torrez_sellbooks_condition()
{
	if(Npc_KnowsInfo(hero,kdf_405_torrez_greet))
	{
		return TRUE;
	};
};

func void kdf_405_torrez_sellbooks_info()
{
	AI_Output(other,self,"KDF_405_Torrez_SELLBOOKS_Info_15_01");	//� ���� ���������� ���������� ������.
};


instance KDF_405_TORREZ_GREET(C_INFO)
{
	npc = kdf_405_torrez;
	condition = kdf_405_torrez_greet_condition;
	information = kdf_405_torrez_greet_info;
	important = 0;
	permanent = 0;
	description = "����������� ����, ���!";
};


func int kdf_405_torrez_greet_condition()
{
	return TRUE;
};

func void kdf_405_torrez_greet_info()
{
	AI_Output(other,self,"KDF_405_Torrez_GREET_Info_15_01");	//����������� ����, ���!
	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_02");	//�� �������� � ����� �����! � ������ ������ �������� ���� ����� � ���� ����� ����� ����������� �� ���������� ����!
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"������ ������� ���������� ������ � ����. �� ��������� �� ����� �����.");
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"������ ����� ������ ��� ��������� ��� ���������� ����. �� ��� ����� �������� �� ����� �����.");
};


instance KDF_405_TORREZ_MANA(C_INFO)
{
	npc = kdf_405_torrez;
	condition = kdf_405_torrez_mana_condition;
	information = kdf_405_torrez_mana_info;
	important = 0;
	permanent = 1;
	description = "��� ����� ��������� ���������� ����.";
};


func int kdf_405_torrez_mana_condition()
{
	if(Npc_KnowsInfo(hero,kdf_405_torrez_greet))
	{
		return TRUE;
	};
};

func void kdf_405_torrez_mana_info()
{
	AI_Output(other,self,"KDF_405_Torrez_MANA_Info_15_01");	//��� ����� ��������� ���������� ����.
	AI_Output(self,other,"KDF_405_Torrez_MANA_Info_04_02");	//� ���� ������ ����. ��� �� ������ �� ������������, ������� ������ �� ����.
	b_torrezlearn();
};

func void kdf_405_torrez_mana_back()
{
	Info_ClearChoices(kdf_405_torrez_mana);
};

func void kdf_405_torrez_mana_man_1()
{
	if((hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF) && (DIFF_HARD == FALSE))
	{
		b_buyattributepoints(other,ATR_MANA_MAX,1);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_MANA_MAX] < 100)
		{
			b_printtrademsg1("������ ����: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_MANA_MAX,1);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� �, ����� ������ �� ���������. ����� ����, �� � ������ �� ���� �������.
	};
	b_torrezlearn();
};

func void kdf_405_torrez_mana_man_5()
{
	if((hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF) && (DIFF_HARD == FALSE))
	{
		b_buyattributepoints(other,ATR_MANA_MAX,5);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_MANA_MAX] < 96)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_MANA_MAX,5);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� �, ����� ������ �� ���������. ����� ����, �� � ������ �� ���� �������.
	};
	b_torrezlearn();
};


instance KDF_405_TORREZ_WANNABEMAGE(C_INFO)
{
	npc = kdf_405_torrez;
	condition = kdf_405_torrez_wannabemage_condition;
	information = kdf_405_torrez_wannabemage_info;
	important = 0;
	permanent = 0;
	description = "��� ����� �������, ����� ����� �����?";
};


func int kdf_405_torrez_wannabemage_condition()
{
	if(Npc_KnowsInfo(hero,kdf_405_torrez_greet) && (Npc_GetTrueGuild(hero) != GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_405_torrez_wannabemage_info()
{
	AI_Output(other,self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01");	//��� ����� �������, ����� ����� �����?
	AI_Output(self,other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02");	//�������� �� ���� � �������� ��������, ���� � ���� �������� ��� ���� ��������� ������.
};

