
instance GRD_277_GARDIST_SITTINGORK(C_INFO)
{
	npc = grd_277_gardist;
	condition = grd_277_gardist_sittingork_condition;
	information = grd_277_gardist_sittingork_info;
	important = 0;
	permanent = 0;
	description = "��� ��� �� ���?";
};


func int grd_277_gardist_sittingork_condition()
{
	if(IAN_GEARWHEEL != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void grd_277_gardist_sittingork_info()
{
	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01");	//��� ��� �� ���?
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02");	//�� ��� �������. �����������! � ��� ��������� ����������, � ���� �������� ����� �������� ������ ������.
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03");	//��� ������ ����� ����� ��������������, �� ����� �� ��������� � ������. ������������� �� �����.
};


instance GRD_277_GARDIST_WORKINGORK(C_INFO)
{
	npc = grd_277_gardist;
	condition = grd_277_gardist_workingork_condition;
	information = grd_277_gardist_workingork_info;
	important = 0;
	permanent = 0;
	description = "��� � ����, ����� ��� � �������.";
};


func int grd_277_gardist_workingork_condition()
{
	if(IAN_GEARWHEEL == LOG_SUCCESS && Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void grd_277_gardist_workingork_info()
{
	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01");	//��� � ����, ����� ��� � �������.
	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02");	//�������. ��������� �������� - ��� �� �����.
};

