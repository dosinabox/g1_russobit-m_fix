
instance NOV_1371_BAALNETBEK_EXIT(C_INFO)
{
	npc = nov_1371_baalnetbek;
	nr = 999;
	condition = nov_1371_baalnetbek_exit_condition;
	information = nov_1371_baalnetbek_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int nov_1371_baalnetbek_exit_condition()
{
	return TRUE;
};

func void nov_1371_baalnetbek_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_1371_BAALNETBEK_CRAZY(C_INFO)
{
	npc = nov_1371_baalnetbek;
	condition = nov_1371_baalnetbek_crazy_condition;
	information = nov_1371_baalnetbek_crazy_info;
	important = 0;
	permanent = 0;
	description = "��� ��?";
};


func int nov_1371_baalnetbek_crazy_condition()
{
	return TRUE;
};

func void nov_1371_baalnetbek_crazy_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01");	//��� ��?
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02");	//� ���� ����� ��������� ������. ��� ����� ����� ���� ���� ������.
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03");	//����� �� ������ ���! � ��� ��?
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04");	//�� ������ � ��� �� �������. �������! ��� ����� ������, ������� ��� ����...
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05");	//... �������, ��, �, �������, �����...
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06");	//�������, �� ������ ������ ��� ���������� ��� ������ � ������� �������� ���!
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07");	//�����, �� ����� ��� ����, � �... � ����� �����, ���-������.
	AI_TurnAway(hero,self);
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08");	//�������, �� ������ ���� �� �������...
	AI_StopProcessInfos(self);
};


instance NOV_1371_BAALNETBEK_AGAIN(C_INFO)
{
	npc = nov_1371_baalnetbek;
	condition = nov_1371_baalnetbek_again_condition;
	information = nov_1371_baalnetbek_again_info;
	important = 0;
	permanent = 1;
	description = "��, ��� ����?";
};


func int nov_1371_baalnetbek_again_condition()
{
	if(Npc_KnowsInfo(hero,nov_1371_baalnetbek_crazy))
	{
		return TRUE;
	};
};

func void nov_1371_baalnetbek_again_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01");	//��, ��� ����?
	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02");	//������, �� ������ ��� �������!
};

