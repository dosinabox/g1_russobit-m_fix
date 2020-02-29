
instance DIA_VLK_534_EXIT(C_INFO)
{
	npc = vlk_534_buddler;
	nr = 999;
	condition = dia_vlk_534_exit_condition;
	information = dia_vlk_534_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_vlk_534_exit_condition()
{
	return 1;
};

func void dia_vlk_534_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_534_LEAVEME(C_INFO)
{
	npc = vlk_534_buddler;
	nr = 1;
	condition = dia_vlk_534_leaveme_condition;
	information = dia_vlk_534_leaveme_info;
	permanent = 1;
	description = "������ �� �� � ������?";
};


func int dia_vlk_534_leaveme_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_vlk_534_leaveme_info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//������ �� �� � ������?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//� ��� ������ ����� �� �����. �� �������� ��� ����.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//� ��� ���� ��� ������ ���������� � ������, ������ ��� � �� ����� ��������� ���������� �� ������, � ����� � ���� �������� ������� ������������.
	AI_StopProcessInfos(self);
};

