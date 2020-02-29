
instance DIA_HORATIO_EXIT(C_INFO)
{
	npc = bau_901_horatio;
	nr = 999;
	condition = dia_horatio_exit_condition;
	information = dia_horatio_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_horatio_exit_condition()
{
	return 1;
};

func void dia_horatio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_HORATIO_WASSER(C_INFO)
{
	npc = bau_901_horatio;
	nr = 800;
	condition = info_horatio_wasser_condition;
	information = info_horatio_wasser_info;
	permanent = 1;
	description = "���� ������ �����. � ������ ���� ����.";
};


func int info_horatio_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_horatio_wasser_info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00");	//���� ������ �����. � ������ ���� ����.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		b_printtrademsg1("������ ������� ����.");
		AI_Output(self,other,"Info_Horatio_Wasser_09_01");	//�������, ������. � �� � ��� ��� ����� ���� ���� �� ����.
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00");	//� ���� �� ������ ���. �����, ����� � ������ ����.
	};
};


var int horatio_trouble;

instance DIA_HORATIO_HELLO(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_hello_condition;
	information = dia_horatio_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_horatio_hello_condition()
{
	return 1;
};

func void dia_horatio_hello_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Horatio_Hello_09_00");	//��� ���� ����� ����? ������ �������?
	Info_ClearChoices(dia_horatio_hello);
	Info_AddChoice(dia_horatio_hello,"��������? � ������������ ��� ��?",dia_horatio_hello_pissoff);
	Info_AddChoice(dia_horatio_hello,"��, ���������! � ���������.",dia_horatio_hello_becool);
};

func void dia_horatio_hello_becool()
{
	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00");	//��, ���������! � ���������.
	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01");	//�-�... ��, ����� �����. ��� ���������, ��� ����� ����� �����, � ������ ������, ��� �� ����� ������.
	Info_ClearChoices(dia_horatio_hello);
};

func void dia_horatio_hello_pissoff()
{
	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00");	//��������? � ������������ ��� ��?
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01");	//������, ���� � ������� � ����, ��� �� ������, ��� � �� ���� �������� �� ����.
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02");	//����� ������������? ����� �����, ������!
	HORATIO_TROUBLE = TRUE;
	Info_ClearChoices(dia_horatio_hello);
	AI_StopProcessInfos(self);
};


instance DIA_HORATIO_SORRY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_sorry_condition;
	information = dia_horatio_sorry_info;
	permanent = 1;
	description = "������, � �� ��������� ���� �������.";
};


func int dia_horatio_sorry_condition()
{
	if(HORATIO_TROUBLE == TRUE)
	{
		return 1;
	};
};

func void dia_horatio_sorry_info()
{
	AI_Output(other,self,"DIA_Horatio_SORRY_15_00");	//������, � �� ��������� ���� �������.
	AI_Output(self,other,"DIA_Horatio_SORRY_09_01");	//���� ���� ������ �������� �� ����!
};


instance DIA_HORATIO_STORY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_story_condition;
	information = dia_horatio_story_info;
	permanent = 0;
	description = "��� ����� �������, ��� �� ������ ����� ��������?";
};


func int dia_horatio_story_condition()
{
	if((HORATIO_TROUBLE == FALSE) && Npc_KnowsInfo(hero,dia_horatio_hello))
	{
		return 1;
	};
};

func void dia_horatio_story_info()
{
	AI_Output(other,self,"DIA_Horatio_Story_15_00");	//��� ����� �������, ��� �� ������ ����� ��������?
	AI_Output(self,other,"DIA_Horatio_Story_09_01");	//�� ��� ���������. � ��� ������ �� ������, ����� ������ ��� ����������.
	AI_Output(self,other,"DIA_Horatio_Story_09_02");	//� ���� ������ �����, � ��� ��� ��������. � ����� ���� ���������� � ��� ����� ������� ������� �����������, ������.
	AI_Output(other,self,"DIA_Horatio_Story_15_03");	//��� ��� ���� ����������?
	AI_Output(self,other,"DIA_Horatio_Story_09_04");	//�� � ������ ��������. � �� ����� ������� ���� �����. ������ ������ ��� ������.
	AI_Output(self,other,"DIA_Horatio_Story_09_05");	//� ��� �������� � �� ����� � �� ����� ��������� ���� ����...
};


instance DIA_HORATIO_WHYHERE(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_whyhere_condition;
	information = dia_horatio_whyhere_info;
	permanent = 0;
	description = "������ �� ������ ������ � ���� ������?";
};


func int dia_horatio_whyhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_story))
	{
		return 1;
	};
};

func void dia_horatio_whyhere_info()
{
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00");	//������ �� ������ ������ � ���� ������?
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01");	//��� � ���� �����: � ��� �� �������������� � ���������, �� �� �����, ����� ��� ���� ��������� ��� �����.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02");	//� ������ ������ � ���� ���� �������� �� �����������, � ��� ���� � �������� ���� ����� ���������� �� ���.
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03");	//��� ������ ����...
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04");	//����� � ���. � ����� ������ ����� ���� �������� � �����. �����, � ���� ����������� �����.
};


var int horatio_strfree;

instance DIA_HORATIO_PLEASETEACHSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_pleaseteachstr_condition;
	information = dia_horatio_pleaseteachstr_info;
	permanent = 0;
	description = "� �� ����� ���� �������, ����� ��� ��. ������ �������?";
};


func int dia_horatio_pleaseteachstr_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_story))
	{
		return 1;
	};
};

func void dia_horatio_pleaseteachstr_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00");	//� �� ����� ���� �������, ��� ��. ������ �������?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01");	//�����, � ����. ��� ������ ����� ���� ����� ����?
	Info_ClearChoices(dia_horatio_pleaseteachstr);
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	if(Npc_KnowsInfo(hero,dia_jeremiah_horatio))
	{
		Info_AddChoice(dia_horatio_pleaseteachstr,"���� ���������� ����� � ��� �����������!",dia_horatio_pleaseteachstr_ricelord);
	}
	else
	{
		Info_AddChoice(dia_horatio_pleaseteachstr,"������� ������. � ������� �� ����...",dia_horatio_pleaseteachstr_back);
	};
	Info_AddChoice(dia_horatio_pleaseteachstr,"������ ��� ����������.",dia_horatio_pleaseteachstr_defend);
	Info_AddChoice(dia_horatio_pleaseteachstr,"���� ��������� �� ����� ���� ���� ������!",dia_horatio_pleaseteachstr_attack);
	Log_CreateTopic(CH1_HORATIOSTEACHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_HORATIOSTEACHINGS,LOG_RUNNING);
	b_logentry(CH1_HORATIOSTEACHINGS,"�������, ����������, ������� �������� �� ������� ����� � ����� ������, ����� ������ ��� ����� �������. �� � ������ ������� ���, ����� ��� ��� �����.");
};

func void dia_horatio_pleaseteachstr_attack()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00");	//���� ��������� �� ����� ���� ���� ������!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01");	//��, ��, ������ ���, �� ��� ������� ����� �� ���. ��� ���... � ���� ����� �� ����.
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};

func void dia_horatio_pleaseteachstr_defend()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00");	//������ ��� ����������.
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01");	//����� �������� � ����� ����� ����� ������� ����, ��� ����. ��� �� ������� �������� ������� �����, ��� ���� ��������?
};

func void dia_horatio_pleaseteachstr_back()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00");	//������� ������. � ������� �� ����...
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};

func void dia_horatio_pleaseteachstr_ricelord()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00");	//���� ���������� ����� � ��� �����������!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01");	//��... �� �� ������, ��� ����� �����.
	HORATIO_STRFREE = TRUE;
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};


instance DIA_HORATIO_THOUGHTSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_thoughtstr_condition;
	information = dia_horatio_thoughtstr_info;
	permanent = 1;
	description = "� ��� ����� ����� �� ����...";
};


func int dia_horatio_thoughtstr_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_pleaseteachstr) && (HORATIO_STRFREE == FALSE))
	{
		return 1;
	};
};

func void dia_horatio_thoughtstr_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00");	//� ��� ����� ����� �� ����...
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01");	//�? �������� ���-������ �������?
	Info_ClearChoices(dia_horatio_thoughtstr);
	Info_AddChoice(dia_horatio_thoughtstr,"���.",dia_horatio_thoughtstr_noidea);
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	if(Npc_KnowsInfo(hero,dia_jeremiah_horatio))
	{
		Info_AddChoice(dia_horatio_thoughtstr,"��. � ������ ������ ���������� �� ����� � ��� �����������!",dia_horatio_thoughtstr_ricelord);
	};
};

func void dia_horatio_thoughtstr_noidea()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00");	//���.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01");	//��� � � ����.
	Info_ClearChoices(dia_horatio_thoughtstr);
};

func void dia_horatio_thoughtstr_ricelord()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00");	//��. � ������ ������ ���������� �� ����� � ��� �����������!
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01");	//��... �� ������ ������ �� ������ �� ���, ��� ������� ������� ���.
	HORATIO_STRFREE = TRUE;
	Info_ClearChoices(dia_horatio_thoughtstr);
};

func void dia_horatio_helpstr_learn_now()
{
	if(DIFF_HARD == TRUE)
	{
		Npc_ChangeAttribute(other,ATR_STRENGTH,2);
		PrintScreen("���� +2",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		Npc_ChangeAttribute(other,ATR_STRENGTH,5);
		PrintScreen("���� +5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00");	//���� ������ ����� ������� ����, �� ������ ����� �������� ��������, ��� ��� ��������. ��� ������, ��� ������ ����� ������.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01");	//�������� �������� ���� ���� �����, �� ����� �� ��������.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02");	//��� ����� � ���� ��� ���������, ��� ������� ����. � �����, ��������� ����� ���� ����� �� ��� �� ������.
};


instance DIA_HORATIO_HELPSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_helpstr_condition;
	information = dia_horatio_helpstr_info;
	permanent = 0;
	description = "� ��������� �� ����� � ��� �����������... �� ��� ����� ������!";
};


func int dia_horatio_helpstr_condition()
{
	if(HORATIO_STRFREE == TRUE)
	{
		return 1;
	};
};

func void dia_horatio_helpstr_info()
{
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00");	//� ��������� �� ����� � ��� �����������, �������, �� ��� ����� ������!
	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01");	//�����! � ��� ������, ��� ������ ������� �� ���� ���� ��������, �� ��� �� ������, ��� � �� ���� ������� ������� �����.
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02");	//������ ����!
	dia_horatio_helpstr_learn_now();
	Log_SetTopicStatus(CH1_HORATIOSTEACHINGS,LOG_SUCCESS);
	b_logentry(CH1_HORATIOSTEACHINGS,"������� ����� ��� ����� �������. ������, ��� ���� ����� ���� ��� ��.");
};


instance DIA_HORATIO_THANKS(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_thanks_condition;
	information = dia_horatio_thanks_info;
	permanent = 1;
	description = "�������, ��� �����!";
};


func int dia_horatio_thanks_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_helpstr))
	{
		return 1;
	};
};

func void dia_horatio_thanks_info()
{
	AI_Output(other,self,"DIA_Horatio_Thanks_15_00");	//�������, ��� �����!
	AI_Output(self,other,"DIA_Horatio_Thanks_09_01");	//��������� ���� ���� ������ � ������� ������� � ����� ������.
};

instance INFO_HORATIO_WASSER_NOLEFTY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 800;
	condition = info_horatio_wasser_nolefty_condition;
	information = info_horatio_wasser_nolefty_info;
	permanent = 1;
	description = "� ������ ���� ����.";
};

func int info_horatio_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_horatio_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//� ������ ���� ����.
	b_printtrademsg1("������ ������� ����.");
	AI_Output(self,other,"SVM_9_LookAway");	//��! ������ ������� ��������!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

instance DIA_HORATIO_HELLO2(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_hello2_condition;
	information = dia_horatio_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_horatio_hello2_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if((lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Npc_KnowsInfo(hero,dia_horatio_helpstr)))
	{
		return 1;
	};
};

func void dia_horatio_hello2_info()
{
	AI_Output(self,other,"SVM_9_YouDefeatedMeWell");	//������� ���! ����� ����� ���� �� ������.
	AI_StopProcessInfos(self);
};

