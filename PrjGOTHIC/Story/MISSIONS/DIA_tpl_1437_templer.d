
instance TPL_1437_TEMPLER_EXIT(C_INFO)
{
	npc = tpl_1437_templer;
	nr = 999;
	condition = tpl_1437_templer_exit_condition;
	information = tpl_1437_templer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1437_templer_exit_condition()
{
	return TRUE;
};

func void tpl_1437_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_NERV(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_nerv_condition;
	information = tpl_1437_templer_nerv_info;
	important = 0;
	permanent = 1;
	description = "��� ����?";
};


func int tpl_1437_templer_nerv_condition()
{
	return TRUE;
};

func void tpl_1437_templer_nerv_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01");	//��� ����?
	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02");	//������, �� ���, ������� ���� ����� �������?
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_LEAVE(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_leave_condition;
	information = tpl_1437_templer_leave_info;
	important = 0;
	permanent = 0;
	description = "� ���� ��� � �������?";
};


func int tpl_1437_templer_leave_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1437_templer_nerv))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_leave_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01");	//� ���� ��� � �������?
	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02");	//� ���� �������� ����, ����? ���, ������� ���-������!
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_LEAVENOW(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_leavenow_condition;
	information = tpl_1437_templer_leavenow_info;
	important = 0;
	permanent = 0;
	description = "�� � �� ������� ����!";
};


func int tpl_1437_templer_leavenow_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1437_templer_leave))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_leavenow_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01");	//�� � �� ������� ����!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02");	//��, ������. � ���� �������!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03");	//���� ������!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04");	//�������� �� ���� �����!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05");	//������� ������ �� ��� �� �������!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06");	//������ ���, ����� � ���� ������ �� �����!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07");	//����� ���!
	AI_StopProcessInfos(self);
};

