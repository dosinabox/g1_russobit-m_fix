
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return 1;
};

func void dia_jarvis_exit_info()
{
	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00");	//��, ���� ���������!
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_FIRST(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 1;
	condition = dia_jarvis_first_condition;
	information = dia_jarvis_first_info;
	permanent = 0;
	important = 1;
};


func int dia_jarvis_first_condition()
{
	return 1;
};

func void dia_jarvis_first_info()
{
	AI_Output(self,other,"DIA_Jarvis_First_08_00");	//�� ������ ������ � ��� ������, ��?
	AI_Output(other,self,"DIA_Jarvis_First_15_01");	//� �� ������ ���� ����������?
	AI_Output(self,other,"DIA_Jarvis_First_08_02");	//���, �� ���� ������� �����, ��� ���� �� ���� ����. ��� �� ������ ������ � �� ������ ����������� ���������.
	AI_Output(other,self,"DIA_Jarvis_First_15_03");	//� ��� ����� �������?
	AI_Output(self,other,"DIA_Jarvis_First_08_04");	//� ��� ��� ���������� ��� �������, ������� ������ �� ��������. ����� ������ ��� �� ����. ������ ��, ��������, ����� ���� �� �����.
};


instance DIA_JARVIS_SLDINFO(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 1;
	condition = dia_jarvis_sldinfo_condition;
	information = dia_jarvis_sldinfo_info;
	permanent = 0;
	description = "� ��� ���������� ��������?";
};


func int dia_jarvis_sldinfo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_first))
	{
		return 1;
	};
};

func void dia_jarvis_sldinfo_info()
{
	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00");	//� ��� ���������� ��������?
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01");	//�� ������ ����� ����. �� �� ��������.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02");	//���, ��� �� �����, - ��� ��������� �� ���� �������. � ��� ������� ������, �� �� �� ����� ��������� �� '�������' ����� ��� ��������� ������, ��� ���� ����� �� ���� ���������.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03");	//��� ����� ��. �� ������� �������. ������ ��������� ��� ��� ������ ��� �� ����������.
};


instance DIA_JARVIS_MAGIER(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_magier_condition;
	information = dia_jarvis_magier_info;
	permanent = 0;
	description = "� ��� ������ ����� ����?";
};


func int dia_jarvis_magier_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_sldinfo))
	{
		return 1;
	};
};

func void dia_jarvis_magier_info()
{
	AI_Output(other,self,"DIA_Jarvis_Magier_15_00");	//� ��� ������ ����� ����?
	AI_Output(self,other,"DIA_Jarvis_Magier_08_01");	//��� ������� ���������� �������� ����, ������� �������� ���� ��������.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_02");	//��������� � ����, ��� ����� �������� ��� ���� ����, ������� �� ��� �������. ��� ������, ��� ���� ����� ��������� ������.
	AI_Output(other,self,"DIA_Jarvis_Magier_15_03");	//��������, ��� ����� ����� ������.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_04");	//��� �������, ��� ����� ����� �� ������ ��� �����.
};


instance DIA_JARVIS_ERZHAUFEN(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_erzhaufen_condition;
	information = dia_jarvis_erzhaufen_info;
	permanent = 0;
	description = "����� ���� ������� ���� ����?";
};


func int dia_jarvis_erzhaufen_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_magier))
	{
		return 1;
	};
};

func void dia_jarvis_erzhaufen_info()
{
	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00");	//����� ���� ������� ���� ����?
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01");	//� �� ������, ��. �����, ����� ���� ������ ���� �� ��, ����� ������ ��������.
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02");	//�� �� �� �� ��� �� ������� ���� ���� ����� �������. �� ������ ��������� ��� ���� �� ���� �������.
};


instance DIA_JARVIS_WOHAUFEN(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_wohaufen_condition;
	information = dia_jarvis_wohaufen_info;
	permanent = 0;
	description = "� ��� ��������� ������ ����?";
};


func int dia_jarvis_wohaufen_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_erzhaufen))
	{
		return 1;
	};
};

func void dia_jarvis_wohaufen_info()
{
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00");	//� ��� ��������� ������ ����?
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01");	//�� ������ ������� ����� ���� ����? ��� ���� ���� �� ���������� � ������ ������.
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02");	//�� � ���� ������ ������ ������������. �� ��������� �������� ���� � ��������.
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03");	//�� � ������ ��� �������.
};


instance DIA_JARVIS_REST(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 3;
	condition = dia_jarvis_rest_condition;
	information = dia_jarvis_rest_info;
	permanent = 0;
	description = "� ��� ��� ����� � ������?";
};


func int dia_jarvis_rest_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_first))
	{
		return 1;
	};
};

func void dia_jarvis_rest_info()
{
	AI_Output(other,self,"DIA_Jarvis_Rest_15_00");	//� ��� ��� ����� � ������?
	AI_Output(self,other,"DIA_Jarvis_Rest_08_01");	//� �������� ����� ����� ����. ������� � ������ �� �� ���������. � �� �� ���� ������ ����� �� �������, ��-�����, �� �������� ������� ������ ������, ��� �� ���.
};


instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 10;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int dia_jarvis_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_magier))
	{
		return 1;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Jarvis_PERM_08_01");	//��� ������ �������� �������� ����. ����� �� ����� ����������, �� ������� ����.
};


instance SLD_728_JARVIS_AUFNAHMESOLDIER(C_INFO)
{
	npc = sld_728_jarvis;
	condition = sld_728_jarvis_aufnahmesoldier_condition;
	information = sld_728_jarvis_aufnahmesoldier_info;
	important = 1;
	permanent = 0;
};


func int sld_728_jarvis_aufnahmesoldier_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && ((Npc_HasItems(hero,itat_crawlerqueen) >= 1) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void sld_728_jarvis_aufnahmesoldier_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01");	//��, � ������, ��� �������� � ����� ����� ������� ������. � ��� ��������� ����.
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02");	//�����, �� � �������� ������ ���� � ����. �������� � ��� �� ����.
	self.flags = 0;
	Log_CreateTopic(GE_BECOMEMERCENARY,LOG_NOTE);
	b_logentry(GE_BECOMEMERCENARY,"� ������ ���������� � ��. ����� ����, �� ������� ���� � ���� � ��������.");
};

