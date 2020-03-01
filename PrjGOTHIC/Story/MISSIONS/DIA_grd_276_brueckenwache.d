
instance INFO_GRD_276_EXIT(C_INFO)
{
	npc = grd_276_brueckenwache;
	nr = 999;
	condition = info_grd_276_exit_condition;
	information = info_grd_276_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_276_exit_condition()
{
	return 1;
};

func void info_grd_276_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_276_TIPS(C_INFO)
{
	npc = grd_276_brueckenwache;
	nr = 1;
	condition = info_grd_276_tips_condition;
	information = info_grd_276_tips_info;
	permanent = 0;
	description = "������, � ����� �������...";
};


func int info_grd_276_tips_condition()
{
	if(KAPITEL <= 2)
	{
		return 1;
	};
};

func void info_grd_276_tips_info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//������, � ����� �������...
	AI_Output(self,other,"Info_GRD_276_Tips_07_01");	//��� �� ����.
};


instance INFO_GRD_276_BLA(C_INFO)
{
	npc = grd_276_brueckenwache;
	nr = 2;
	condition = info_grd_276_bla_condition;
	information = info_grd_276_bla_info;
	permanent = 1;
	description = "���, �� �����, ������ ������, ��?";
};


func int info_grd_276_bla_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_276_tips))
	{
		return 1;
	};
};

func void info_grd_276_bla_info()
{
	AI_Output(other,self,"Info_GRD_276_Bla_15_00");	//���, �� �����, ������ ������, ��?
	//AI_Output(self,other,"Info_GRD_276_Bla_07_01");	//���, ��� ��������� ����� ������. ������ ������ ������, �� ������.
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//�� ��, ��� ��.
	AI_StopProcessInfos(self);
};

