
instance VLK_586_GRIMES_EXIT(C_INFO)
{
	npc = vlk_586_grimes;
	nr = 999;
	condition = vlk_586_grimes_exit_condition;
	information = vlk_586_grimes_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_586_grimes_exit_condition()
{
	return 1;
};

func void vlk_586_grimes_exit_info()
{
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//����� �����!
	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02");	//� ���� ���� ��, �������.
	AI_StopProcessInfos(self);
};


instance VLK_586_GRIMES_STORY(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_story_condition;
	information = vlk_586_grimes_story_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ����� ������?";
};


func int vlk_586_grimes_story_condition()
{
	if(Npc_KnowsInfo(hero,vlk_586_grimes_first))
	{
		return 1;
	};
};

func void vlk_586_grimes_story_info()
{
	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01");	//�� ����� ����� ������?
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02");	//��, � ��� ��� 10 ����� ����. � ������, �� ��� ����� � ������� �������� � ������ �������.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03");	//� ����� ������ ������������ � �� �������, ��, ��� ������, � ��� ��� ���.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04");	//�����-�� ������-����� �� �������� �� �����... ������ ��� ���������, �� � �����, ��������, ��� ����� ����������...
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05");	//��, ��� ���� �����...
};


instance VLK_586_GRIMES_KNOW(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_know_condition;
	information = vlk_586_grimes_know_info;
	important = 0;
	permanent = 0;
	description = "������ ����, �� ��� ������ ������ � ������ ������ ������ �� �������.";
};


func int vlk_586_grimes_know_condition()
{
	if(Npc_KnowsInfo(hero,vlk_586_grimes_story))
	{
		return 1;
	};
};

func void vlk_586_grimes_know_info()
{
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01");	//������ ����, �� ��� ������ ������ � ������ ������ ������ �� �������.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02");	//��������, ������, � ������� ���� ������� ��������� ������. �� ��� ����� - ������ �� ����.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03");	//����� � �� ����� � ������. � ����� ���, ��� ������� ������ ����� ������.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04");	//�� �������� �� ������. ������ ������ �� ��������.
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05");	//� ��� ����� �� ������ �������� ��������� ������ ��� � ���� �����!
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06");	//�� ������ - �� ����. ��������, �����-������ �� ������ ������� ���������, ��� �����.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07");	//�� ������ ������� �� ����� ��� �� ������, �� ���� ��� ����� ���������.
};


instance VLK_586_GRIMES_FIRST(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_first_condition;
	information = vlk_586_grimes_first_info;
	important = 1;
	permanent = 0;
};


func int vlk_586_grimes_first_condition()
{
	return 1;
};

func void vlk_586_grimes_first_info()
{
	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02");	//���������! �� ���� ������� �����-������?
	Npc_ExchangeRoutine(self,"WORK");
};

