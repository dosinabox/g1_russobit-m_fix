
instance DIA_GUY_EXIT(C_INFO)
{
	npc = vlk_530_guy;
	nr = 999;
	condition = dia_guy_exit_condition;
	information = dia_guy_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_guy_exit_condition()
{
	return 1;
};

func void dia_guy_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GUY_HELLO(C_INFO)
{
	npc = vlk_530_guy;
	nr = 2;
	condition = dia_guy_hello_condition;
	information = dia_guy_hello_info;
	permanent = 0;
	description = "������!";
};


func int dia_guy_hello_condition()
{
	if(KAPITEL <= 1)
	{
		return 1;
	};
};

func void dia_guy_hello_info()
{
	AI_Output(other,self,"DIA_Guy_Hello_15_00");	//������!
	AI_Output(self,other,"DIA_Guy_Hello_03_01");	//��? ������ � ���� ����� �� �����. �� ���������?
	AI_Output(other,self,"DIA_Guy_Hello_15_02");	//� ������ ���� �������...
	AI_Output(self,other,"DIA_Guy_Hello_03_03");	//��� �����, � ������ ������ ����� ��������������?
	AI_Output(other,self,"DIA_Guy_Hello_15_04");	//���, � �� ������ ���-�� ������������?
	AI_Output(self,other,"DIA_Guy_Hello_03_05");	//��� ������ ������, ������ ����� ���������� ���-�� ����.
	AI_Output(self,other,"DIA_Guy_Hello_03_06");	//���� �� �� �����, � ����� ������ ����������, �� ������ ������ � ���� ������. ��� ������� ������������.
};


instance DIA_GUY_ADOC(C_INFO)
{
	npc = vlk_530_guy;
	nr = 2;
	condition = dia_guy_adoc_condition;
	information = dia_guy_adoc_info;
	permanent = 1;
	description = "������ ������������ ������� ������?";
};


func int dia_guy_adoc_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adoc_info()
{
	AI_Output(other,self,"DIA_Guy_AdOC_15_00");	//������ ������������ ������� ������?
	AI_Output(self,other,"DIA_Guy_AdOC_03_01");	//���� �� ������ ������� ����������, ��� ����� �������� ����, �������� �� ��������� �������������. ��� ������ ����������� � ����, ��� ����� ������� �� ������ �� �� ����������.
	AI_Output(self,other,"DIA_Guy_AdOC_03_02");	//����� ����, � ����� ������ ������ �� �������� ���� ����� �� ��� ������, ��� � ������ �������.
	Info_ClearChoices(dia_guy_adoc);
	Info_AddChoice(dia_guy_adoc,"�����, � ������ ������ � ��� ���-��� ����...",dia_guy_adoc_back);
	Info_AddChoice(dia_guy_adoc,"����� ������ ��������� ����� ������ �������?",dia_guy_adoc_warez);
	Info_AddChoice(dia_guy_adoc,"� ���, ���� ����, ������� ��������, ��������� ����� �����?",dia_guy_adoc_protection);
};

func void dia_guy_adoc_back()
{
	AI_Output(other,self,"DIA_Guy_AdOC_BACK_15_00");	//�����, � ������ ������ � ��� ���-��� ����...
	AI_Output(self,other,"DIA_Guy_AdOC_BACK_03_01");	//����� ��� ����� ��������.
	Info_ClearChoices(dia_guy_adoc);
};

func void dia_guy_adoc_warez()
{
	AI_Output(other,self,"DIA_Guy_AdOC_Warez_15_00");	//����� ������ ��������� ����� ������ �������?
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_01");	//��� ������ �� �������� ����: ����, ���, ������� �, ������� ��, ���� � ���� - ��������� �������, � ������� �� �������� ������, �������� ����� �� ������ ������.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_02");	//������ � ��� ������� �� ������� ����, � ��� ������� ����� �������.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_03");	//��������� ������� ���� ��� ��������� �������, ������� ������ ������ ������ ��� ���������.
	AI_Output(self,other,"DIA_Guy_AdOC_Warez_03_04");	//����� ������� ����� �� ������������� ������, ���� �� ���� ������ �� �������. ������ �� ����� �� ������.
};

func void dia_guy_adoc_protection()
{
	AI_Output(other,self,"DIA_Guy_AdOC_Protection_15_00");	//� ��� ����������, ���� ��� ��������, ������� ������ ���� �� ������, ��������� ����� �����?
	AI_Output(self,other,"DIA_Guy_AdOC_Protection_03_01");	//��������� �� ����� ����������� � �����. ��� ������ �������� ��� ��� ���������� � ����� ������� �����������.
};


instance DIA_GUY_ADNC(C_INFO)
{
	npc = vlk_530_guy;
	nr = 3;
	condition = dia_guy_adnc_condition;
	information = dia_guy_adnc_info;
	permanent = 0;
	description = "������ ������������ ������ ������?";
};


func int dia_guy_adnc_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adnc_info()
{
	AI_Output(other,self,"DIA_Guy_AdNC_15_00");	//������ ������������ ������ ������?
	AI_Output(self,other,"DIA_Guy_AdNC_03_01");	//���� ���� �������� ���� ���, ��� ������ ����� ����� ���� ��-�� ����� �����, �� ���� ��� ����� �����.
	AI_Output(self,other,"DIA_Guy_AdNC_03_02");	//���, �������, ��� �� ��� �� �����. ���� � �� ���, ��� �����.
	AI_Output(self,other,"DIA_Guy_AdNC_03_03");	//� ����� ������ ����� ��������� ������� �� ��������. � ��� ��� ������� �������.
	AI_Output(self,other,"DIA_Guy_AdNC_03_04");	//���� ���� ����� �� �������� ��� �����, �� ��� �� ����� ���������� ������ ����������, ��� ���� ����� ��� ��������� ������.
};


instance DIA_GUY_ADST(C_INFO)
{
	npc = vlk_530_guy;
	nr = 4;
	condition = dia_guy_adst_condition;
	information = dia_guy_adst_info;
	permanent = 0;
	description = "� ��� �� ������ ���������� ��� � ������ ���������?";
};


func int dia_guy_adst_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_adst_info()
{
	AI_Output(other,self,"DIA_Guy_AdST_15_00");	//� ��� �� ������ ���������� ��� � ������ ���������?
	AI_Output(self,other,"DIA_Guy_AdST_03_01");	//������ ����� �� ���� ���, ��� ������ ��������.
	AI_Output(self,other,"DIA_Guy_AdST_03_02");	//� ����� ������ ������ ����� ����� ���� �� �����������, ���-�� � ������ ���������� ���� � ����� ������.
	AI_Output(self,other,"DIA_Guy_AdST_03_03");	//��� � ������� ��� �� ���. �� � ��� �������, ��� ��� ����� �����.
	AI_Output(self,other,"DIA_Guy_AdST_03_04");	//�� ��������� ����� ����� ����, � ��� ������������ �� �� ������ �������.
};


instance DIA_GUY_MYOWNHUT(C_INFO)
{
	npc = vlk_530_guy;
	nr = 10;
	condition = dia_guy_myownhut_condition;
	information = dia_guy_myownhut_info;
	permanent = 1;
	description = "����� ���� ������ ���, � ������� � ���� ������������?";
};


func int dia_guy_myownhut_condition()
{
	if(Npc_KnowsInfo(hero,dia_guy_hello))
	{
		return 1;
	};
};

func void dia_guy_myownhut_info()
{
	AI_Output(other,self,"DIA_Guy_MyOwnHut_15_00");	//����� ���� ������ ���, � ������� � ���� ������������?
	AI_PointAt(self,"OCR_HUT_26");
	AI_Output(self,other,"DIA_Guy_MyOwnHut_03_01");	//��� ��� ������� ���� ��� � ��������� �������, � �� ����� �� �����.
	AI_StopPointAt(self);
};

