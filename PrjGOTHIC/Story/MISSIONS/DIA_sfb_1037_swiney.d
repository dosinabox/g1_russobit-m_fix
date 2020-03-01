
instance INFO_SWINEY_EXIT(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 999;
	condition = info_swiney_exit_condition;
	information = info_swiney_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_swiney_exit_condition()
{
	return 1;
};

func void info_swiney_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SWINEY_HELLO(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_hello_condition;
	information = info_swiney_hello_info;
	permanent = 0;
	description = "��� ��?";
};


func int info_swiney_hello_condition()
{
	return 1;
};

func void info_swiney_hello_info()
{
	AI_Output(other,self,"Info_Swiney_Hello_15_00");	//��� ��?
	AI_Output(self,other,"Info_Swiney_Hello_09_01");	//� ������ ��������� � ���� ��������� �������.
	AI_Output(self,other,"Info_Swiney_Hello_09_02");	//���� �� �� �, �������� ����� ��������� ����� �� �������� ��� ��������. ���� ��� �� ����� ������, ��� �� ����� ������ ������.
};


instance INFO_SWINEY_SCHUERFER(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_schuerfer_condition;
	information = info_swiney_schuerfer_info;
	permanent = 0;
	description = "� ���� ����� ���������, ����� ��� ��.";
};


func int info_swiney_schuerfer_condition()
{
	if(Npc_KnowsInfo(hero,info_swiney_hello))
	{
		return 1;
	};
};

func void info_swiney_schuerfer_info()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00");	//� ���� ����� ���������, ����� ��� ��.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01");	//�� �� ������? �� �����, ��� ��� ���������� �����. ��� ������ ���� � ����, � ��� ��������� ����� �������� ������.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02");	//�� ������ ������, ������ �� �����? �� ��������, ��� ���� ������ ������� ��� ������������ �� ����� �����.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03");	//��� ������� ���� �� ���������� � ����� �����. ��� � ����� ������ �� ��� �������� 50 ������ ����, ����� ��������� ��� �������.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04");	//��� ����� ������, ��� ���� ������� �����.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05");	//�� ���� �����-������ ���� � ���� �����?
	Info_ClearChoices(info_swiney_schuerfer);
	Info_AddChoice(info_swiney_schuerfer,"���.",info_swiney_schuerfer_nein);
	Info_AddChoice(info_swiney_schuerfer,"��.",info_swiney_schuerfer_ja);
};

func void info_swiney_schuerfer_ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//��.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01");	//������! ����� �� ��� ������, ��� ����� ������. ��� ���� ������� ������. ����� ���� �������� ����� ������. �����!
	b_printtrademsg1("�������� ������ ��������.");
	CreateInvItem(hero,sfb_armor_l);
//	AI_EquipArmor(hero,sfb_armor_l);
	Info_ClearChoices(info_swiney_schuerfer);
};

func void info_swiney_schuerfer_nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//���.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01");	//�������, ���! ������. ������. ������ ��� ������� ������ � ������ �� ����� ������.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02");	//���� �� ����� �� ��������, �� ����� ������ ������ ���������� ����. � ��� �� ���������� �� ����, �� ���. ����� ����� �� ���� ����� ������?
	b_printtrademsg1("�������� ������ ��������.");
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03");	//���-�� ���������� � ����� ���� ������ �����.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04");	//������ �� � ��� ����� �� �����������, ��, ��� �...
	CreateInvItem(hero,sfb_armor_l);
//	AI_EquipArmor(hero,sfb_armor_l);
	Info_ClearChoices(info_swiney_schuerfer);
};


instance INFO_SWINEY_PERM(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_perm_condition;
	information = info_swiney_perm_info;
	permanent = 1;
	description = "�� ��� ����� ���� �������?";
};


func int info_swiney_perm_condition()
{
	if(Npc_KnowsInfo(hero,info_swiney_schuerfer))
	{
		return 1;
	};
};

func void info_swiney_perm_info()
{
	AI_Output(other,self,"Info_Swiney_PERM_15_00");	//�� ��� ����� ���� �������?
	AI_Output(self,other,"Info_Swiney_PERM_09_01");	//���� �������, ��� ����� ����� �� ����� ����������. �� ������� ������� � ����� ������ � ������� ���� ���� ������ �������.
	AI_StopProcessInfos(self);
};

