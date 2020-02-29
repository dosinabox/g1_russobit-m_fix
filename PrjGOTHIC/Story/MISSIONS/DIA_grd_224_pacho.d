
instance INFO_PACHO_EXIT(C_INFO)
{
	npc = grd_224_pacho;
	nr = 999;
	condition = info_pacho_exit_condition;
	information = info_pacho_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_pacho_exit_condition()
{
	return TRUE;
};

func void info_pacho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_STOP(C_INFO)
{
	npc = grd_224_pacho;
	condition = info_pacho_stop_condition;
	information = info_pacho_stop_info;
	important = 1;
	permanent = 0;
};


func int info_pacho_stop_condition()
{
	return TRUE;
};

func void info_pacho_stop_info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//��, ��!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//���? �?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//���, ���� ������... ������� ��, ��� � ���?
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//� �� �� ����� ����� ���� �� �����!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//������?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//������, �� ����� �������.
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//������, ��� ������ ����� �������� � �����...
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//��� � �������� ������� �� ���� �������!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//��...
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//�� �� ���!
	Npc_ExchangeRoutine(self,"start2");
	AI_StopProcessInfos(self);
};

