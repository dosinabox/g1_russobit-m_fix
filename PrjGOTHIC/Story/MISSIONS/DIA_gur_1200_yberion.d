
instance INFO_YBERION_EXIT(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 999;
	condition = info_yberion_exit_condition;
	information = info_yberion_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_yberion_exit_condition()
{
	return 1;
};

func void info_yberion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBERION_WACHE(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = dia_yberion_wache_condition;
	information = dia_yberion_wache_info;
	permanent = 1;
	important = 1;
};


func int dia_yberion_wache_condition()
{
	if(KAPITEL == 1)
	{
		return 1;
	};
};

func void dia_yberion_wache_info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//��� �� ����� ��������? ��� ���� �������? ������!
	b_intruderalert(self,other);
	AI_StopProcessInfos(self);
};


instance DIA_YBERION_KENNEN(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = dia_yberion_kennen_condition;
	information = dia_yberion_kennen_info;
	permanent = 0;
	description = "����������� ����, ������� �������!";
};


func int dia_yberion_kennen_condition()
{
	if(KAPITEL == 2)
	{
		return 1;
	};
};

func void dia_yberion_kennen_info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//����������� ����, ������� �������!
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//�! � ���� ����!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//��� ����������. �� ��� �� ���� �� �����������.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//� ����� ��...������. ��� ���� �����?
};


instance INFO_YBERION_BRINGFOCUS(C_INFO)
{
	npc = gur_1200_yberion;
	condition = info_yberion_bringfocus_condition;
	information = info_yberion_bringfocus_info;
	permanent = 1;
	description = "� ������, ��� �� ������ ���-�� �����.";
};


func int info_yberion_bringfocus_condition()
{
	if(Npc_KnowsInfo(hero,dia_yberion_kennen) && (Npc_GetTrueGuild(hero) != GIL_NONE) && (YBERION_BRINGFOCUS != LOG_RUNNING) && (YBERION_BRINGFOCUS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void info_yberion_bringfocus_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//� ������, ��� �� ������ ���-�� �����.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//��� � ����. ��� ����� ���������� ������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//�� ��� ��������� �� ��� ����������, ������, �� �� ��� ��� �� ��������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//�����, �� ������� ��������, ��� � ��� ���������?
	Info_ClearChoices(info_yberion_bringfocus);
	Info_AddChoice(info_yberion_bringfocus,DIALOG_BACK,info_yberion_bringfocus_back);
	Info_AddChoice(info_yberion_bringfocus,"� ����� ��� ������!",info_yberion_bringfocus_ok);
	Info_AddChoice(info_yberion_bringfocus,"��� � ������ ��� ������?",info_yberion_bringfocus_wo);
	Info_AddChoice(info_yberion_bringfocus,"������ ���� ������ ��� �����?",info_yberion_bringfocus_fokus);
};

func void info_yberion_bringfocus_back()
{
	Info_ClearChoices(info_yberion_bringfocus);
};

func void info_yberion_bringfocus_ok()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//� ����� ��� ������!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//��� �����. �� ��� ��������, ��� ������ ���� ������.
	b_story_bringfirstfocus();
	b_logentry(CH2_FOCUS,"������� ������ ���������� ������ �� ��������. �� �� �� ��� ��� �� ��������. ���� ��� ��� �����, �� ������� ������� ���� � �������.");
};

func void info_yberion_bringfocus_wo()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//��� � ������ ��� ������?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//������ �������� �� ������, ������� ������� � ������ ����� �����. ������ ����� ���, �� ��� ����. ��� � ������ ���� ������.
};

func void info_yberion_bringfocus_fokus()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//������ ���� ������ ��� �����?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//� ��� ������� �����, ��������� ��������������� ���� ����.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//�� ���� �� ���� ������, ������������ � ���������� �������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//��� ������� �������, ��� ���� ����� ����� ������� ���.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//���������� �������!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//��� ������� - ��� �������� �������. � � ������� ������� �� ������ �������� ���!
};


instance INFO_YBERION_BRINGFOCUS_RUNNING(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_bringfocus_running_condition;
	information = info_yberion_bringfocus_running_info;
	permanent = 0;
	description = "� ��� ��� �� ����� ������.";
};


func int info_yberion_bringfocus_running_condition()
{
	if((YBERION_BRINGFOCUS == LOG_RUNNING) && !Npc_HasItems(hero,focus_1))
	{
		return TRUE;
	};
};

func void info_yberion_bringfocus_running_info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//� ��� ��� �� ����� ������.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//��������� ������! ������ ������� ����.
};


instance INFO_YBERION_BRINGFOCUS_SUCCESS(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_bringfocus_success_condition;
	information = info_yberion_bringfocus_success_info;
	permanent = 0;
	description = "� ����� ������.";
};


func int info_yberion_bringfocus_success_condition()
{
	if((YBERION_BRINGFOCUS == LOG_RUNNING) && Npc_HasItems(hero,focus_1))
	{
		return 1;
	};
};

func void info_yberion_bringfocus_success_info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//� ����� ������.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//������������! �� ����� ������ ����� ���.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//������ ��� ������ ��� ������. �� �����, ��� � ��� ������.
	if(KALOM_TALKEDTO == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//��� � ���� ����� ����� ��� ������?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//�� ����� ��� ����� �������� � ����� ����������� �� ������ ������.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//� ����� � ������ ������ ���� ������. ������ �� �������� �������� �� ����������� �����.
		b_logentry(CH2_FOCUS,"������� ������� ��� ������� ������ ��� ������, ������ �� ����. �� ��������� �������� � ����� �����������.");
	}
	else
	{
		b_logentry(CH2_FOCUS,"������� ������� ��� ������� ������ ��� ������. ��� '�������' ����� ��������� ����� ���������� �������� ��������.");
	};
	tpl_1406_templer.aivar[AIV_PASSGATE] = TRUE;
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	b_givexp(XP_BRINGFOCUSTOYBERION);
};


instance INFO_YBERION_NYRAS(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_nyras_condition;
	information = info_yberion_nyras_info;
	permanent = 0;
	description = "��������� ����� ����� � ���!";
};


func int info_yberion_nyras_condition()
{
	if(Npc_HasItems(hero,focus_1))
	{
		return 1;
	};
};

func void info_yberion_nyras_info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//��������� ����� ����� � ���!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//�� ������, ����� ������ ������ ��� � ������ ��� ����� ������������ ������!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//����� �� ����� �� ���� � ������� �����!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//���������� ������� ������� ������ ��� ������ ����������.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//���� ��, ����, ����� ������ ��� ��������� ������ ������� ��� ���� ����, ��� ��������� ��� �������� ����� ����������� �������.
};


instance GUR_1200_YBERION_EARN(C_INFO)
{
	npc = gur_1200_yberion;
	condition = gur_1200_yberion_earn_condition;
	information = gur_1200_yberion_earn_info;
	important = 0;
	permanent = 0;
	description = "� � �� �������� �������?";
};


func int gur_1200_yberion_earn_condition()
{
	if((YBERION_BRINGFOCUS == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && c_ischapter(2))
	{
		return 1;
	};
};

func void gur_1200_yberion_earn_info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//� � �� �������� �������?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//��� � ����, �� �� �� ������ ��������, �� � ������� ����.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//������ ���� ������ � ������������� �� ���� ������.
	CreateInvItem(self,schutzamulett_feuer);
	b_giveinvitems(self,hero,schutzamulett_feuer,1);
};

