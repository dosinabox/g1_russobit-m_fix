
instance DIA_SLD_752_OKYL_INTRO(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_intro_condition;
	information = dia_sld_752_okyl_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_752_okyl_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 250)
	{
		return 1;
	};
};

func void dia_sld_752_okyl_intro_info()
{
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//��, ��! ������ � ���� �� �����. ��� �� ����� �������?
};


instance DIA_SLD_752_OKYL_EXIT(C_INFO)
{
	nr = 999;
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "� �����, �����?";
};


func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//� �����, �����?
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//��� � ���������. ��� ����.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_UMSEHEN(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "� ������ ���� ������� ����������.";
};


func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//� ������ ���� ������� ����������.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//����� ����� �� ���, ����� �� �������� � ������������, ����� �� ��������� � ������ ������, ��� ������� �������� �� ����.
};


instance DIA_SLD_752_OKYL_WERBISTDU(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "��� �� �����?";
};


func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//��� �� �����?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//� ����. � ����� �������.
};


instance DIA_SLD_752_OKYL_INMINE(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ����������, ��� ��� � ��� � �����.";
};


func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//� ����� ������ ����������, ��� ��� � ��� � �����.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//�, ������ ��������� � �����...
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//������, �� ���������� �� � ��� �� ������������. ����� �� ����� ������� � ����� ��� ����� ����������.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//������ ��� ���� �� ����. ���, ��� ������� � ����� ��� ����� ��������, ����� �� ��������!
};


instance DIA_SLD_752_OKYL_PERMIT(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_permit_condition;
	information = dia_sld_752_okyl_permit_info;
	important = 0;
	permanent = 0;
	description = "� �� ������ ��������� ��� ����� ����?";
};


func int dia_sld_752_okyl_permit_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_inmine))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_permit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");	//� �� ������ ��������� ��� ����� ����?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//� � ���� �� ����, ��� ��. ������ � ������ ������ ���� ����� ����������?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//� ������, � ���� ����� ���. ����������.
	AI_StopProcessInfos(self);
};

