
instance TPL_1438_TEMPLER_EXIT(C_INFO)
{
	npc = tpl_1438_templer;
	nr = 999;
	condition = tpl_1438_templer_exit_condition;
	information = tpl_1438_templer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1438_templer_exit_condition()
{
	return 1;
};

func void tpl_1438_templer_exit_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01");	//��������.
	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02");	//�� ���������� ������!
	AI_StopProcessInfos(self);
};


instance TPL_1438_TEMPLER_INFO(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_info_condition;
	information = tpl_1438_templer_info_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ������ ������ � ���� �����?";
};


func int tpl_1438_templer_info_condition()
{
	if(CORKALOM_BRINGMCQBALLS != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void tpl_1438_templer_info_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01");	//��� ����� ������ ������ � ���� �����?
	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02");	//�������� �� ��������. ���� ����� �� ���� � ������ - ����� ����� �����.
};


instance TPL_1438_TEMPLER_WHY(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_why_condition;
	information = tpl_1438_templer_why_info;
	important = 0;
	permanent = 0;
	description = "� ����� �� ��������� �� ��������?";
};


func int tpl_1438_templer_why_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_info))
	{
		return 1;
	};
};

func void tpl_1438_templer_why_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01");	//� ����� �� ��������� �� ��������?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02");	//������� - ���, ��� ��� ����. � ��� ���������� ������ �����.
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03");	//��� ��� �� ���� ������������?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04");	//��. �� ��� ����� �����, ��� �� ���� ����������� �������.
};


instance TPL_1438_TEMPLER_KALOM(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_kalom_condition;
	information = tpl_1438_templer_kalom_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ��� �����?";
};


func int tpl_1438_templer_kalom_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_why))
	{
		return 1;
	};
};

func void tpl_1438_templer_kalom_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01");	//��� ����� ��� �����?
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02");	//�� ���� �� ����� ����������� ���� ������ ��������. �� ����� ������, � ���� ��� ������ ����� �����.
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03");	//��� �� �������. �������������� �� �������� �������� ���� �������� �� ������. �� �� ������ ������� � ������! � ��� ������ ���� ��������!
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04");	//������, ����� ����, �������.
};


instance TPL_1438_TEMPLER_EGGSEARCH(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_eggsearch_condition;
	information = tpl_1438_templer_eggsearch_info;
	important = 0;
	permanent = 0;
	description = "� ��� ������ ��������.";
};


func int tpl_1438_templer_eggsearch_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void tpl_1438_templer_eggsearch_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01");	//� ��� ������ ��������.
	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02");	//�����, ��� �� ���, ��� �� ��� � ��� �� ��� ����� � �������� ���� ������, ��� �. �������� � ����.
	b_logentry(CH2_MCEGGS,"� ������� ������ �� ����� � ������ ����� � ������ ��������. �� ����������� ��� ���������� � ��� �� ����, ��� �� ���� � ��� �� ����. ��� �����, ������� ��� ���� ����� �������, ����� ������ ���� � ���!");
};


instance TPL_1438_TEMPLER_ZANGEN(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_zangen_condition;
	information = tpl_1438_templer_zangen_info;
	important = 0;
	permanent = 0;
	description = "��� �������� ����� ��������?";
};


func int tpl_1438_templer_zangen_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1438_templer_why) || (CORKALOM_BRINGMCQBALLS == LOG_RUNNING)) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return TRUE;
	};
};

func void tpl_1438_templer_zangen_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01");	//��� �������� ����� ��������?
	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02");	//��� �� ����� �� ������ ����, �� ���� ������, ���� �������.
};


instance TPL_1438_TEMPLER_TEACHZANGEN(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_teachzangen_condition;
	information = tpl_1438_templer_teachzangen_info;
	important = 0;
	permanent = 1;
	description = "������ �������� (1 ���� ��������)";
};


func int tpl_1438_templer_teachzangen_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_zangen) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return TRUE;
	};
};

func void tpl_1438_templer_teachzangen_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//�� ������ ������� ���� �������� ����� ��������?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01");	//��� ������ �������� �������� ������. �� ������ ���������, ����� �� ��������� ������, - ����� ����� ������� ���� �� ����.
		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02");	//���, ��������, ����� ������.
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03");	//� �� ��� �����. �� ����� �����-������ ������� ����������, ���� ���������� �������� �� ��������? �, ������, ��� �� ���� ��� �� ����, ��� �� �������� �����. �����, ����� ���������...
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04");	//����� ������� ������ ������ ������� �����, �������� �������� ������� ����������. ������ �� ������ �������� �� ������ � ���������. ���� ������ ������, ��� � ������, ������� �� �����.
		KNOWS_GETMCMANDIBLES = TRUE;
		Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
		b_logentry(GE_ANIMALTROPHIES,"����� ������ �������� ��������.");
		PrintScreen("�����: ������ �������� ��������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};

