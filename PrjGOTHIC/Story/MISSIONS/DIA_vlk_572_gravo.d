
instance DIA_GRAVO_EXIT(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 999;
	condition = dia_gravo_exit_condition;
	information = dia_gravo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gravo_exit_condition()
{
	return 1;
};

func void dia_gravo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRAVO_HALLO(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_hallo_condition;
	information = dia_gravo_hallo_info;
	permanent = 0;
	description = "��� ����?";
};


func int dia_gravo_hallo_condition()
{
	return 1;
};

func void dia_gravo_hallo_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//� ���� � �����, � ������ ��� ������� ����� �������. ��� ��� ���������� �� �� ���.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//��� �� �� ������������� �� �����?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//� ������� ����� ������ �� ��������.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//���� �� ����������� � ���-�� �� ����������� �����, � ���� ������������ � ���, ����� �� ���� ����� ������ ������.
};


instance DIA_GRAVO_HELPHOW(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_helphow_condition;
	information = dia_gravo_helphow_info;
	permanent = 0;
	description = "���� � ���� ��������� ��������, � ���� ���������� � ����? ���?";
};


func int dia_gravo_helphow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo))
	{
		return 1;
	};
};

func void dia_gravo_helphow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//������, ���� � ���� ��������� ��������, � ���� ���������� � ����? ���?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//��, ��������, �� �� ������� ������, ������� �� ���... ��, ������, ����� �����, ���� �� � ��� ������ �� ������ ���������, ���� ��� �����, ��� ����� ���������.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//����� ������ ������ ����� �������. �� ������� �� ������������� � ����, ��� ��� ���� ��� ������. � ��� �����.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//�� ������, ��� ������ � ���������. ��� ���, ��������� �� ���, � � ������ � ���� ������, � ������ ������� ����� ��������������.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//��� �������� ��� �� ���� ��������, � �� ������ �� ���� �� � �����. �������, ��������� ����� �� ��� ������ �� �������. ��� ��� ������ ���������� ��.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//� � ���������� � ���, ����� ���� ���� ������ � ������ ����...
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"������� ����� ���������� ������ ������. ���� � ���� �������� ����� � ���-�� �� ������ ����� �� ������� ������, � ����� ��������� ���, � �� ������ ��������.");
};

func void b_gravo_helpattitude(var C_NPC prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//��, � ��� ������ ��� ������ � ����. �� ����� ���������.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//�����, � ���������� � ���, ����� � ��� ���-��� �����������. 100 ������ ����, � � ����� ��� ��������.
		if(Npc_HasItems(other,itminugget) >= 100)
		{
			b_printtrademsg1("������ ����: 100");
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//���������, ������� � ���� ����... �! ����� ������ ������. ������, ��� ���� �������.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//� ���������� �� �������������. ���� ���� ���, ����� ������ �� ���������.
			b_giveinvitems(hero,self,itminugget,100);
			npc_setpermattitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� �, ����� ������ �� ���������. ����� ����, �� � ������ �� ���� �������.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//��-�����, �� �� ������ ����� ���������! �� �� �� ����� �������� ���� ������.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//� ������ ���� ���������� � ���������� ������, ������� �� ���������. �� ��� ����� ������� ���������. � �������� �� ��� ���� �� 500 ������ ����.
		if(Npc_HasItems(other,itminugget) >= 500)
		{
			b_printtrademsg1("������ ����: 500");
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//���������, ������� � ���� ����... �� �� �����! � ������ 500 ������ � ����� ��� ���� ��� ��������.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//� ��� ���-���: �� �� � ���� ������ �� ������ ������, ��� ���� ��������� �. ������ �� ���� �� �����������!
			b_giveinvitems(hero,self,itminugget,500);
			npc_setpermattitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� �, ����� ������ �� ���������. ����� ����, �� � ������ �� ���� �������.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//��������� � ����, � ���� � ��� ���������� ���������. �� ����� �����������.
	};
};


instance DIA_GRAVO_HELPANGRYNOW(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_helpangrynow_condition;
	information = dia_gravo_helpangrynow_info;
	permanent = 1;
	description = "�������, � ���� �������� ��������. �� ������ ��� ������?";
};


func int dia_gravo_helpangrynow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helphow))
	{
		return 1;
	};
};

func void dia_gravo_helpangrynow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//�������, � ���� �������� ��������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//�����, ����. �� ��� ����� ������ ���� �� 100 �� 500 ������ ����.
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,DIALOG_BACK,dia_gravo_helpangrynow_back);
	Info_AddChoice(dia_gravo_helpangrynow,"����� �������� �� ����.",dia_gravo_helpangrynow_diego);
	Info_AddChoice(dia_gravo_helpangrynow,"� ���� ����� ����� � �������.",dia_gravo_helpangrynow_thorus);
	Info_AddChoice(dia_gravo_helpangrynow,"� ���������� � �������.",dia_gravo_helpangrynow_gomez);
};

func void dia_gravo_helpangrynow_back()
{
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_diego()
{
	var C_NPC diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//����� �������� �� ����.
	diego = Hlp_GetNpc(pc_thief);
	b_gravo_helpattitude(diego);
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_thorus()
{
	var C_NPC thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//� ���� ����� ����� � �������.
	thorus = Hlp_GetNpc(grd_200_thorus);
	b_gravo_helpattitude(thorus);
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_gomez()
{
	var C_NPC gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//� ���������� � �������.
	gomez = Hlp_GetNpc(ebr_100_gomez);
	b_gravo_helpattitude(gomez);
	Info_ClearChoices(dia_gravo_helpangrynow);
};


instance DIA_GRAVO_INFLUENCE(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 2;
	condition = dia_gravo_influence_condition;
	information = dia_gravo_influence_info;
	permanent = 1;
	description = "�� ������ ������� ��� ����� ����������� �� ���������?";
};


func int dia_gravo_influence_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo))
	{
		return 1;
	};
};

func void dia_gravo_influence_info()
{
	var int log;
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//�� ������ ������� ��� ����� ����������� �� ���������.
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//������ ����������� � ������� ������, ��?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//����� ����������� �� ��������� - �����. �� �������� ��������, �������� � ����.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//������� � ���� ������� ������ �� �������� �������. � ��� ����� ����������� ����� ����������, ������� ��� ���� ����� �������� �� ��������� �����.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//��� ����� ���� ������. �� ���������� �������� �� �����. � ������ ������ ������ ��� ����, ��� ��� � � ��� ��������� � ����������� �����.
	if(log == FALSE)
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"������� � ���� ������� ���������� �������� �� �������� �������.");
		log = TRUE;
	};
};

