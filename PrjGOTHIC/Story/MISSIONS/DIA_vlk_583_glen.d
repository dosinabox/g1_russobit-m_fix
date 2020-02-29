
instance VLK_583_GLEN_EXIT(C_INFO)
{
	npc = vlk_583_glen;
	nr = 999;
	condition = vlk_583_glen_exit_condition;
	information = vlk_583_glen_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_583_glen_exit_condition()
{
	return 1;
};

func void vlk_583_glen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance VLK_583_GLEN_INFO(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_info_condition;
	information = vlk_583_glen_info_info;
	important = 0;
	permanent = 1;
	description = "� ���� ��������� �����. ������ ���-������ ������������?";
};


func int vlk_583_glen_info_condition()
{
	return 1;
};

func void vlk_583_glen_info_info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//� ���� ��������� �����. ������ ���-������ ������������?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//������� �������� �� ��������.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//��� ���� �� �����������, ��� ������ ����� ������ ���� ������. ������� ���������� �������!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//��� ������ �� ���� � ��������� ���� ������. �� �������, ��� �� ����� �������� ������, ����� ��� ����������� ��� ����� � �����. � �����, ��� ��� �������...
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//��� ������ � �����������. ���� ���� ������ �����, ����� ����� ������ ����, ���� ��� ���.
};


instance VLK_583_GLEN_LOCKPICK(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_lockpick_condition;
	information = vlk_583_glen_lockpick_info;
	important = 0;
	permanent = 0;
	description = "� ������, � ���� ����� ������ �������.";
};


func int vlk_583_glen_lockpick_condition()
{
	if(Npc_KnowsInfo(hero,vlk_585_aleph_glen))
	{
		return 1;
	};
};

func void vlk_583_glen_lockpick_info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//� ������, � ���� ����� ������ �������.
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//��, �� ������ �������, ��� ��, ������ �� �������, �����? �� 10 ������ ���� �� �����.
};


instance VLK_583_GLEN_BUY(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_buy_condition;
	information = vlk_583_glen_buy_info;
	important = 0;
	permanent = 1;
	description = "(������ �������)";
	trade = 1;
};


func int vlk_583_glen_buy_condition()
{
	if(Npc_KnowsInfo(hero,vlk_583_glen_lockpick))
	{
		return 1;
	};
};

func void vlk_583_glen_buy_info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//� ���� ������ �������.
};

