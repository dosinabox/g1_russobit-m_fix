
var int mud_nerve;
const int NERVESEC = 30;
var int mud_nerverealized;

instance DIA_MUD_EXIT(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_exit_condition;
	information = dia_mud_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_mud_exit_condition()
{
	return 1;
};

func void dia_mud_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MUD_FIRSTEXIT(C_INFO)
{
	npc = vlk_574_mud;
	nr = 1;
	condition = dia_mud_firstexit_condition;
	information = dia_mud_firstexit_info;
	permanent = 0;
	important = 1;
};


func int dia_mud_firstexit_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_mud_firstexit_info()
{
	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_00");	//��! ������� �����, �? � ���� �� ���� �� �����.
	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_01");	//�� �� ������, ���� � �������� � ����� �������? ���� �� ������ ����� ����, ��?
	Info_ClearChoices(dia_mud_firstexit);
	Info_AddChoice(dia_mud_firstexit,"�� ��������� �� ���!",dia_mud_firstexit_verpiss);
	Info_AddChoice(dia_mud_firstexit,"��� ������. ������!",dia_mud_firstexit_komm);
};

func void dia_mud_firstexit_verpiss()
{
	AI_Output(other,self,"DIA_Mud_FirstEXIT_Verpiss_15_00");	//�� ��������� �� ���!
	AI_Output(self,other,"DIA_Mud_FirstEXIT_Verpiss_07_01");	//�, �������, �� ������� �� � ����. ��, �����, ����� �����, ���� � ����� � �����...
	Info_ClearChoices(dia_mud_firstexit);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};

func void dia_mud_firstexit_komm()
{
	AI_Output(other,self,"DIA_Mud_FirstEXIT_Komm_15_00");	//��� ������. ������!
	AI_Output(self,other,"DIA_Mud_FirstEXIT_Komm_07_01");	//��� ������! �� ������ ������� ���������� �� ������.
	Info_ClearChoices(dia_mud_firstexit);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_MUD_SHUTUP(C_INFO)
{
	npc = vlk_574_mud;
	nr = 3;
	condition = dia_mud_shutup_condition;
	information = dia_mud_shutup_info;
	permanent = 1;
	description = "�� ������ ���� ������� ���������?";
};


func int dia_mud_shutup_condition()
{
	if(MUD_NERVEREALIZED == TRUE)
	{
		return 1;
	};
};

func void dia_mud_shutup_info()
{
	AI_Output(other,self,"DIA_Mud_ShutUp_15_00");	//�� ������ ���� ������� ���������?
	AI_Output(self,other,"DIA_Mud_ShutUp_07_01");	//��� �������.
	Npc_SetRefuseTalk(self,300);
};


instance DIA_MUD_GETLOST(C_INFO)
{
	npc = vlk_574_mud;
	nr = 2;
	condition = dia_mud_getlost_condition;
	information = dia_mud_getlost_info;
	permanent = 1;
	description = "���� �� ����!";
};


func int dia_mud_getlost_condition()
{
	if(Npc_KnowsInfo(hero,dia_mud_firstexit) && !Npc_KnowsInfo(hero,dia_mud_defeated))
	{
		return 1;
	};
};

func void dia_mud_getlost_info()
{
	AI_Output(other,self,"DIA_Mud_GetLost_15_00");	//���� �� ����!
	AI_Output(self,other,"DIA_Mud_GetLost_07_01");	//������ ������ ����? �������... ��, � ���� ���-������ ����������, ���� ���...
};


instance DIA_MUD_DEFEATED(C_INFO)
{
	npc = vlk_574_mud;
	nr = 1;
	condition = dia_mud_defeated_condition;
	information = dia_mud_defeated_info;
	permanent = 0;
	important = 1;
};


func int dia_mud_defeated_condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void dia_mud_defeated_info()
{
	AI_Output(self,other,"DIA_Mud_GetLost_07_00");	//��, �� �� ������ ����! �� ���?
	AI_Output(other,self,"DIA_Mud_GetLost_15_01");	//���� �� �� ���� �� ���������, � ����� ���� ��� �������!
	AI_Output(self,other,"DIA_Mud_GetLost_07_02");	//�� �� ������������! ���� �� ������� �� ���, � ���� ������ �� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MUD_NERVE_0(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_0_condition;
	information = dia_mud_nerve_0_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_0_condition()
{
	if((MUD_NERVE == 0) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_0_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_0_07_00");	//�����, ���� �� ����? ��� ��� �������? ������, � ����� ��������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 1;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_1(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_1_condition;
	information = dia_mud_nerve_1_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_1_condition()
{
	if((MUD_NERVE == 1) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_1_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_1_07_00");	//� �� ���� ���� ������, �� ��������. � ������ �������� � ����� �������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 2;
	MUD_NERVEREALIZED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_2(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_2_condition;
	information = dia_mud_nerve_2_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_2_condition()
{
	if((MUD_NERVE == 2) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_2_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_2_07_00");	//�������, �� ������, ���� �� ����. � ���� ���� �����-�� ����, ��?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 3;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_3(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_3_condition;
	information = dia_mud_nerve_3_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_3_condition()
{
	if((MUD_NERVE == 3) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_3_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_3_07_00");	//������ ����� ����� ��������? ��� �� ������ ����������? � ����?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 4;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_4(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_4_condition;
	information = dia_mud_nerve_4_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_4_condition()
{
	if((MUD_NERVE == 4) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_4_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_4_07_00");	//���� �� �������, ��� �� ����� �������? �� ���� ��� � �� ������, ���� �������������...
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 5;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_5(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_5_condition;
	information = dia_mud_nerve_5_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_5_condition()
{
	if((MUD_NERVE == 5) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_5_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_5_07_00");	//� ����� ��� ���������. ��� ������, ��� �� ���� ���� � �����. �����, ��� ����� ���� ������ ����-������ ������?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 6;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_6(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_6_condition;
	information = dia_mud_nerve_6_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_6_condition()
{
	if((MUD_NERVE == 6) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_6_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_6_07_00");	//� ��� ��� ������ � ����. �� ���� ������� ������, ������? �� ���� ��� �������? � ��� �� �������? ������ ���������� � ����, � �� ������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 7;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_7(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_7_condition;
	information = dia_mud_nerve_7_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_7_condition()
{
	if((MUD_NERVE == 7) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_7_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_7_07_00");	//�����, � �� ��� ���� ���� ���������? ���� ���� �������� ��������? ��, �� ��� �� �����. ��-�� ����� � � ����� ����.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 8;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_8(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_8_condition;
	information = dia_mud_nerve_8_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_8_condition()
{
	if((MUD_NERVE == 8) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_8_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_8_07_00");	//� ������� ���� ����, ������� ������ ��������� ���� ������. ��� ������� ���� �� ������ ������, ��������� �������. � ��������� ��� � ����� ��, ��� �� ��� ����. ��� ��, �������, ��������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 9;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_9(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_9_condition;
	information = dia_mud_nerve_9_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_9_condition()
{
	if((MUD_NERVE == 9) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_9_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_9_07_00");	//��� ���������� �� ������ ������ ��� ���� ��������, ���� � ����� ��, ��� ������ � ���� ���� ��������. �� ��� �� ������ �������� � �����. ��� ����� ������. �������� ��� ��� ���� �������, �� ������ ��� ������ ��������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 10;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_10(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_10_condition;
	information = dia_mud_nerve_10_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_10_condition()
{
	if((MUD_NERVE == 10) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_10_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_10_07_00");	//������, ���? � ������ ����. � �����, ��� ���� ����� ��������. ����� ���� ������ � ������, � �� ������ �������� ���� ������ ����.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 11;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_11(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_11_condition;
	information = dia_mud_nerve_11_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_11_condition()
{
	if((MUD_NERVE == 11) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_11_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_11_07_00");	//������ ������� ���� ������������. �� ���� �����, ��� ��, �� ���� �� ������������� � ������������, �����? ��� ������, ��� �� ��� ����, � ������, ��� ���� �������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 12;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_12(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_12_condition;
	information = dia_mud_nerve_12_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_12_condition()
{
	if((MUD_NERVE == 12) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_12_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_12_07_00");	//�� ��� ������ ����. �� ����� ����� �� ����� �� ���� �������������. ��� ��������� ����. �������, ��� �� ����� �� �������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 13;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_13(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_13_condition;
	information = dia_mud_nerve_13_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_13_condition()
{
	if((MUD_NERVE == 13) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_13_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_13_07_00");	//������, �� ��� ��� ����� �����. ����� ����� �������� �����-������ ����� ������ � ������� ���������?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 14;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_14(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_14_condition;
	information = dia_mud_nerve_14_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_14_condition()
{
	if((MUD_NERVE == 14) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_14_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_14_07_00");	//�� ������� ��� �������� �����. � ���� ���� ������� �� ���� �������� �����. �� � �������� �� ����. ��� �������� �� ������ �������� � ������. � ������, ��� �� ���� ������ �� ����.
	AI_Output(other,self,"DIA_Mud_Nerve_14_15_01");	//�����, �� ����.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 15;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_15(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_15_condition;
	information = dia_mud_nerve_15_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_15_condition()
{
	if((MUD_NERVE == 15) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_15_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_15_07_00");	//� ��� �� ��� �� �����? ��������, ���� ���� ������ �������� ����� ��������, ������� ���� ��������. ��� �� ��������. �� ��� ��� �����-������? �������, ��� �� ��� �����.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 16;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_16(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_16_condition;
	information = dia_mud_nerve_16_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_16_condition()
{
	if((MUD_NERVE == 16) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_16_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_16_07_00");	//� ��� ������������. � ������ ���� ����� ������ � ��������� ����, ������� ���� �� ������ ������������, ���� �� �� ���� �������, ��� �������� �������� �������. ��� ������� ��� ��� ������ �� ��������. ��� ������ ���������� �� ���.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 17;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_17(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_17_condition;
	information = dia_mud_nerve_17_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_17_condition()
{
	if((MUD_NERVE == 17) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_17_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_17_07_00");	//���������, ���� ���-������ �� �������� ���� ������ ���� ������ ���? ��� �������, �� ������, ���� ����� �� �� ������ ���������, ��?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 18;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_18(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_18_condition;
	information = dia_mud_nerve_18_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_18_condition()
{
	if((MUD_NERVE == 18) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_18_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_18_07_00");	//������, ����� �� � �����, �� ������� ������ �������, ��� ������� ���� �����. ��� ��� ��������� ��� �� ���� ��� �����. ����� ������ ��������� ������� �� ���� ��� ���, � ��...
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 19;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_19(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_19_condition;
	information = dia_mud_nerve_19_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_19_condition()
{
	if((MUD_NERVE == 19) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_19_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_19_07_00");	//������ �� ����������. �� ������ ���� ��������� ������ ������. �� �� ������ � ��� ����� ����������� � ��������. � ���, ������� ����, �� ����� ��������.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 0;
	AI_StopProcessInfos(self);
};

