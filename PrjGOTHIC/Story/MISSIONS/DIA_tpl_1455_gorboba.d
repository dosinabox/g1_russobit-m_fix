
instance INFO_TPL_1455_GORBOBA(C_INFO)
{
	npc = tpl_1455_gorboba;
	condition = info_tpl_1455_gorboba_condition;
	information = info_tpl_1455_gorboba_info;
	important = 1;
	permanent = 0;
};


func int info_tpl_1455_gorboba_condition()
{
	return TRUE;
};

func void info_tpl_1455_gorboba_info()
{
	AI_Output(self,other,"Info_TPL_1455_GorBoba_08_01");	//����������! ���� ����� �� �����!
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_01");	//� �� ������ ���� ����������?
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_02");	//��! � ��������� ����, ����� �� �� ���� ������� ����� ������� ������. �� ��������� � ����������� �������.
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_03");	//�� ������� �������� �� ����. ��������� ���� ������� ������ � ��� ����� ����� ����. �� ����� ������������.
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_04");	//������ � ���� ������, ��������� �� ����������!
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05");	//����������� � ������� � ����������!
	AI_StopProcessInfos(self);
	//Log_CreateTopic("���� �����",LOG_NOTE);
	//b_logentry("���� �����","��� ���� ������ ���, ��� �� �������� ����������, � ��� ������ ����� �� ������. ��� ����� � ��� ������������� �������� ���� �� �������, � ������ �� ������ ����� ������������ �������.");
	b_logentry(CH4_ENTERTEMPLE,"��� ���� ������ ���, ��� �� �������� ����������, � ��� ������ ����� �� ������. ��� ����� � ��� ������������� �������� ���� �� �������, � ������ �� ������ ����� ������������ �������.");
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

