
instance DIA_TPL_1402_GORNATOTH_EXIT(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 999;
	condition = dia_tpl_1402_gornatoth_exit_condition;
	information = dia_tpl_1402_gornatoth_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_tpl_1402_gornatoth_exit_condition()
{
	return TRUE;
};

func void dia_tpl_1402_gornatoth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNATOTH_ABWEISEND(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 1;
	condition = dia_gornatoth_abweisend_condition;
	information = dia_gornatoth_abweisend_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_gornatoth_abweisend_condition()
{
	if(!Npc_KnowsInfo(hero,dia_gornatoth_angartalked) && !c_npcbelongstopsicamp(hero))
	{
		return 1;
	};
};

func void dia_gornatoth_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//���� �� ����, ��������! � �������� ������ ������� �������!
	AI_StopProcessInfos(self);
};


instance DIA_GORNATOTH_ANGARTALKED(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 1;
	condition = dia_gornatoth_angartalked_condition;
	information = dia_gornatoth_angartalked_info;
	permanent = 0;
	important = 1;
};


func int dia_gornatoth_angartalked_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_gornatoth_angartalked_info()
{
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//��� ����� ������� � �����? ��� �� ���� ������?
	Info_ClearChoices(dia_gornatoth_angartalked);
	Info_AddChoice(dia_gornatoth_angartalked,"���� ������� ������, ��� �� ��������� ������ ������ ������.",dia_gornatoth_angartalked_unworthy);
	Info_AddChoice(dia_gornatoth_angartalked,"�� ������, ��� ��� �� �������� ����������.",dia_gornatoth_angartalked_shark);
	Info_AddChoice(dia_gornatoth_angartalked,"�� ������, ��� � ������ ������ � ����, ����� ����� �������.",dia_gornatoth_angartalked_normal);
};

func void dia_gornatoth_angartalked_normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//�� ������, ��� � ������ ������ � ����, ����� ����� �������.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//��������, �� ��� ����������. �� ����� ������� �� � ��� �� �������������.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//�� ������ ���� ������� �����, ��������� � �����. �� ���� �� � ��������� ��� ������� ��� ������ �����.
	Info_ClearChoices(dia_gornatoth_angartalked);
};

func void dia_gornatoth_angartalked_shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//�� ������, ��� ��� �� �������� ����������.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//�� ��� ������?.. ��� ��������� ��������� ��������� ������!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//������� ����� ������� ��� ���� �����.
	Info_ClearChoices(dia_gornatoth_angartalked);
};

func void dia_gornatoth_angartalked_unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//���� ������� ������, ��� �� ��������� ������ ������� ������.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//���! �� ������� �� ������ �� �����! ������ �� ��� ���!
	Info_ClearChoices(dia_gornatoth_angartalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance TPL_1402_GORNATOTH_GETSTUFF(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_getstuff_condition;
	information = tpl_1402_gornatoth_getstuff_info;
	important = 0;
	permanent = 0;
	description = "� ������, ����� ����� ������ ������.";
};


func int tpl_1402_gornatoth_getstuff_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_getstuff_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//� ������, ����� ����� ������� ������.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//� ����� ���, ��� ���� �������� ���� ���� �� ����� ��������. �� �������� ��, ���� ��� �� ��������� ���� ��������.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//����� ���� ������ ������ ����, ��� ������ ������ ���� ��������!
	b_printtrademsg1("������� ������ ������ ������.");
	b_logentry(GE_BECOMETEMPLAR,"��� �� ��� ������ ��� ��� ������ ������ ������. ������ � ���� ������ ����� �������� ������!");
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"� ��� �� ���� ���� ������� ������� �������, �� �������� �� ����� ������ ���, ��� ���� ������������ ������������� �� ����� ��������. � ���� ����� ��� �� ������������� �������� ������ ��������.");
	CreateInvItem(self,tpl_armor_l);
	b_giveinvitems(self,hero,tpl_armor_l,1);
	AI_EquipArmor(hero,tpl_armor_l);
};


var int gornatoth_armor_m_was_bought;
var int gornatoth_armor_h_was_bought;

instance TPL_1402_GORNATOTH_ARMOR(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_armor_condition;
	information = tpl_1402_gornatoth_armor_info;
	important = 0;
	permanent = 1;
	description = "��� ����� ����� ������� ������.";
};


func int tpl_1402_gornatoth_armor_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1402_gornatoth_getstuff) && ((GORNATOTH_ARMOR_M_WAS_BOUGHT != 1) || (GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_armor_info()
{
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//��� ����� ����� ������� �������.
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//� ���� ���� ���� ������ �������, �� �� ��� �� ������� ������������� �� ����� ������ ��������.
	Info_ClearChoices(tpl_1402_gornatoth_armor);
	Info_AddChoice(tpl_1402_gornatoth_armor,DIALOG_BACK,tpl_1402_gornatoth_armor_back);
	if(GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)
	{
		Info_AddChoice(tpl_1402_gornatoth_armor,b_buildbuyarmorstring("������� ������ ������, ������: 70/10/35/0",VALUE_TPL_ARMOR_H),tpl_1402_gornatoth_armor_h);
	};
	if(GORNATOTH_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(tpl_1402_gornatoth_armor,b_buildbuyarmorstring("������� ������ ������, ������: 55/10/25/0",VALUE_TPL_ARMOR_M),tpl_1402_gornatoth_armor_m);
	};
};

func void tpl_1402_gornatoth_armor_m()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//��� ����� ������� ������� ������.
	if(KAPITEL < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//������ �� �� ������� ������ ���. ������� ���� �������� �������� ���� �������� �������� � ����� �������. ������ ����� ����� � ���� ����� ����� �� ����� ������.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_TPL_ARMOR_M)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//��� ������ �� ������� ������ ������������� �� ����� ��������, �� �������� ������ �������.
	}
	else
	{
		b_printtrademsg1("������ ����: 1650");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//�� ������ ������ �������������, ������� � ��� ���� ����� ������. �� ������ ����� �������� �������.
		b_printtrademsg2("������� ������ ������.");
		b_giveinvitems(hero,self,itminugget,VALUE_TPL_ARMOR_M);
		CreateInvItem(self,tpl_armor_m);
		b_giveinvitems(self,hero,tpl_armor_m,1);
		AI_EquipArmor(hero,tpl_armor_m);
		GORNATOTH_ARMOR_M_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};

func void tpl_1402_gornatoth_armor_h()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//� ���� ����� ������� ������� ������.
	if(KAPITEL < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//�� ��� ����� ������������ ������. ������, ��� �� ����� ������ ��������, � ������ ����� ����� �� ������ ������� ������ ����� ����������� ������.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_TPL_ARMOR_H)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//�� �������� ����� ������ ����� ������, �� ������ � ���� ��� ����������� ������ ��������� ������������� �� ����� ��������!
	}
	else
	{
		b_printtrademsg1("������ ����: 2100");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//���� ���� ������ � ���� ���������� �����, ��������� ���� ���������.
		b_printtrademsg2("������� ������� ������ ������.");
		b_giveinvitems(hero,self,itminugget,VALUE_TPL_ARMOR_H);
		CreateInvItem(hero,tpl_armor_h);
		AI_EquipArmor(hero,tpl_armor_h);
		GORNATOTH_ARMOR_H_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};

func void tpl_1402_gornatoth_armor_back()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//� ���������!
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//��� ������. �� ������, ��� ���� ����� �����.
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};


instance TPL_1402_GORNATOTH_TEACH(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 10;
	condition = tpl_1402_gornatoth_teach_condition;
	information = tpl_1402_gornatoth_teach_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int tpl_1402_gornatoth_teach_condition()
{
	if(c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_teach_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//���������� ����� ���������� �� ������ ���� ����, �� ����� ���� ���� � �������� ��������.
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
	if(LOG_GORNATOTHTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"����� ��� �� ��� ����� ������ ��� �������� ����, �������� � ���������� ����, � ����� �������� ��� �������� ���������� �������.");
		LOG_GORNATOTHTRAIN = TRUE;
	};
};

func void tpl_1402_gornatoth_teach_back()
{
	Info_ClearChoices(tpl_1402_gornatoth_teach);
};

func void tpl_1402_gornatoth_teach_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_man_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_man_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};


instance TPL_1402_GORNATOTH_TRAIN(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_train_condition;
	information = tpl_1402_gornatoth_train_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,0);
};


func int tpl_1402_gornatoth_train_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1) && c_npcbelongstopsicamp(hero) && LOG_GORNATOTHTRAIN == TRUE)
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_train_info()
{
	if(LOG_GORNATOTHFIGHT == FALSE)
	{
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"����� ��� �� ��� ����� ������� ���� ���������� � ���������� �����.");
		LOG_GORNATOTHFIGHT = TRUE;
	};
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//� ���� �������� ������� ������� ��� � ���������� �����.
	if(b_giveskill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//��� ������� �������! ����� �������� ������� ������� ���, �� ������ ��������� ��������� ������� ������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//������� �������������, ������ ��������� ����� ��������� ������� ������� ���� ����� ������. ��� �������� ��������, ������� ����� �������� ���� � ����������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//����� ��� ����� �����. ������ ������� ����� � �� ����� ��� ����������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//�� ������ ��������� ������ ��� ��� ����� ������ ����, � ����� ��� �������� ����� ����������� � ���������� ������ ����. ��� �������� �������� �����.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//���� �� ������ ��������� ���� �������, �� ������� ����� ��� �������. �� ����� �������, ���� �������� ������ �������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//��, ���� ��� ���-���: ��������� ����� ������� ������� ����������� ����������. �� ��� �������, ������� � ���� �� ��� ����� ������ �� ����������� ����.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//�� ������ ���������� ������� ���� ������������������ � �������� ��� ������ ����� ������.
		tpl_1402_gornatoth_train.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};


instance TPL_1402_GORNATOTH_TRAINAGAIN(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_trainagain_condition;
	information = tpl_1402_gornatoth_trainagain_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,0);
};


func int tpl_1402_gornatoth_trainagain_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_trainagain_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//����� ���� ��� ����� ������� ���������� �����.
	if(b_giveskill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//�� ��� ������� ��������� ������������� � �������� ���� �������. ���� �� ������ ������� ��� ������� ����, �� ������� ������� ������� ���� � ���� ������ ����.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//�������, ��� � ������� � ������� �������? ��������� ��� �� ���� � ���������� - ������ ������������ �������� ������������ ����. ���� �� ����� ������� ��� �����, ������ ��������. ��� �������� ���������� � ���� ���� ����������� ������� ����� ������� �������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//����� ���������� � ������ ���� ������ ������.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//������� � �������� ������. ��� �� ������, ���������� �������� � ������. � ������ ��� � �� ������� � �����������.
		tpl_1402_gornatoth_trainagain.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};

