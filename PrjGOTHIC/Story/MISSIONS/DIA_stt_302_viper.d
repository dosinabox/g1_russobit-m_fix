
instance STT_302_VIPER_EXIT(C_INFO)
{
	npc = stt_302_viper;
	nr = 999;
	condition = stt_302_viper_exit_condition;
	information = stt_302_viper_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_302_viper_exit_condition()
{
	return 1;
};

func void stt_302_viper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_302_VIPER_GREET(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_greet_condition;
	information = stt_302_viper_greet_info;
	important = 0;
	permanent = 0;
	description = "��, ������ ����, ����������.";
};


func int stt_302_viper_greet_condition()
{
	return 1;
};

func void stt_302_viper_greet_info()
{
	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01");	//��, ������ ����, ����������.
	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02");	//� �� ����� ������, ��� � ��������.
};


instance STT_302_VIPER_MELT(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_melt_condition;
	information = stt_302_viper_melt_info;
	important = 0;
	permanent = 0;
	description = "� ������, ��� � ����� �������������� ������ ����� ����.";
};


func int stt_302_viper_melt_condition()
{
	if(Npc_KnowsInfo(hero,stt_302_viper_greet) && Npc_KnowsInfo(hero,grd_260_drake_mine_mehr))
	{
		return 1;
	};
};

func void stt_302_viper_melt_info()
{
	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01");	//� ������, ��� � ����� �������������� ������ ����� ����.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02");	//�����-�� �� ������������ ��� ����. �� ����� � ���� ������, ��� ��� �� ������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03");	//��������� ������ ��� ���-�� ����� �������, ������������� ���� � ��� ���������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04");	//��� ����� ������ ���� � ������ ���� ����������� ���� � �� ����, � ������� �� ����� �� ��������� �������������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05");	//� ����� �� ����� ������������ ������ ����� ����, � ���� ���� ������ �� ������������.
};


instance STT_302_VIPER_BUY(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_buy_condition;
	information = stt_302_viper_buy_info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���� ��� ����?";
	trade = 1;
};


func int stt_302_viper_buy_condition()
{
	if(Npc_KnowsInfo(hero,stt_302_viper_greet))
	{
		return 1;
	};
};

func void stt_302_viper_buy_info()
{
	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01");	//�� ������ ���� ��� ����?
	AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02");	//���� � ���� ���� ���-������ ������.
};

