
instance DIA_HARLOK_EXIT(C_INFO)
{
	npc = nov_1358_harlok;
	nr = 999;
	condition = dia_harlok_exit_condition;
	information = dia_harlok_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_harlok_exit_condition()
{
	return 1;
};

func void dia_harlok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARLOK_FETCHHARLOK(C_INFO)
{
	npc = nov_1358_harlok;
	nr = 1;
	condition = dia_harlok_fetchharlok_condition;
	information = dia_harlok_fetchharlok_info;
	permanent = 0;
	description = "���� ������� �����.";
};


func int dia_harlok_fetchharlok_condition()
{
	if(GHORIM_KICKHARLOK == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_harlok_fetchharlok_info()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_15_00");	//���� ������� �����.
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_01_01");	//���?
	Info_ClearChoices(dia_harlok_fetchharlok);
	Info_AddChoice(dia_harlok_fetchharlok,DIALOG_BACK,dia_harlok_fetchharlok_back);
	Info_AddChoice(dia_harlok_fetchharlok,"������ ��� � ������ � ������� ��������, ����� ���� ����� ����!",dia_harlok_fetchharlok_orelse);
	Info_AddChoice(dia_harlok_fetchharlok,"� ������ ��������� ����, ��� ���� ��������.",dia_harlok_fetchharlok_please);
};

func int dia_harlok_fetchharlok_please()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_Please_15_00");	//� ������ ��������� ����, ��� ���� ��������.
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_Please_01_01");	//��, ����� �� ������. ������� ��� �� ����, ����� � ��������, �����?
};

func int dia_harlok_fetchharlok_orelse()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_OrElse_15_00");	//������ ��� � ������ � ������� ��������, ����� ���� ����� ����!
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_OrElse_01_01");	//������ �������� ������� �� ��� ��� ���, �����!
	AI_StopProcessInfos(self);
};

func int dia_harlok_fetchharlok_back()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00");	//��, �����, �� �������� ���.
	Info_ClearChoices(dia_harlok_fetchharlok);
};


instance DIA_HARLOK_HARLOKAGAIN(C_INFO)
{
	npc = nov_1358_harlok;
	nr = 1;
	condition = dia_harlok_harlokagain_condition;
	information = dia_harlok_harlokagain_info;
	permanent = 0;
	description = "� ������ ����� ��������� ����, ��� ���� �� ������� ������ �����!";
};


func int dia_harlok_harlokagain_condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && Npc_KnowsInfo(hero,dia_harlok_fetchharlok))
	{
		return 1;
	};
};

func void dia_harlok_harlokagain_info()
{
	AI_Output(other,self,"DIA_Harlok_HarlokAgain_15_00");	//� ������ ����� ��������� ����, ��� ���� �� ������� ������ �����!
	AI_Output(self,other,"DIA_Harlok_HarlokAgain_01_01");	//������! �������� ������, ���� ���!
	b_logentry(CH1_GHORIMSRELIEF,"�������, ������ ����� ������� �� ����, ���� � �����. �����, ��� ����� ������ ��� ��������� � ������...");
};


instance DIA_HARLOK_SENDHARLOK(C_INFO)
{
	npc = nov_1358_harlok;
	nr = 1;
	condition = dia_harlok_sendharlok_condition;
	information = dia_harlok_sendharlok_info;
	permanent = 0;
	description = "��, ���, �� ��� ����� ������� ������ �����?";
};


func int dia_harlok_sendharlok_condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,dia_harlok_fetchharlok))
	{
		return 1;
	};
};

func void dia_harlok_sendharlok_info()
{
	var C_NPC ghorim;
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_00");	//��, ���, �� ��� ����� ������� ������ �����?
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_01");	//������� ����� ���������� �� ���?! �� ��� ���� ��� � ����� ����!
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_02");	//������ ����� ����������, ��� �� ���������.
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_03");	//����� ��, ���... � ��� ���... 
	b_logentry(CH1_GHORIMSRELIEF,"������ ���� ��������� �����. �� �������� ������� ������.");
	b_givexp(XP_SENTHARLOK);
	Npc_ExchangeRoutine(self,"START");
	ghorim = Hlp_GetNpc(nov_1310_ghorim);
	Npc_ExchangeRoutine(ghorim,"START");
	GHORIM_KICKHARLOK = LOG_SUCCESS;
	npc_setpermattitude(ghorim,ATT_FRIENDLY);
	npc_setpermattitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};


instance DIA_HARLOK_ANGRY(C_INFO)
{
	npc = nov_1358_harlok;
	nr = 1;
	condition = dia_harlok_angry_condition;
	information = dia_harlok_angry_info;
	permanent = 1;
	important = 1;
};


func int dia_harlok_angry_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GHORIM_KICKHARLOK == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_harlok_angry_info()
{
	AI_Output(self,other,"DIA_Harlok_Angry_01_00");	//�� ������ �� ���� � �����! � ���, �� ������?!
	AI_StopProcessInfos(self);
};

