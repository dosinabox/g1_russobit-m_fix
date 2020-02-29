
instance INFO_XARDAS_OT(C_INFO)
{
	npc = kdf_406_otxardas;
	condition = info_xardas_ot_condition;
	information = info_xardas_ot_info;
	important = 1;
	permanent = 0;
};


func int info_xardas_ot_condition()
{
	if(Npc_GetDistToWP(self,"TPL_331") < 1000)
	{
		return TRUE;
	};
};

func void info_xardas_ot_info()
{
	AI_Output(self,other,"Info_Xardas_OT_14_01");	//������ ���� �����������, � ��� ��� ������� �� ������ ���������!
	AI_Output(other,self,"Info_Xardas_OT_15_02");	//� ��� ��...
	AI_Output(self,other,"Info_Xardas_OT_14_03");	//������ ��� ����� � �����������. � ����������� ��� ���� ����, ����� ��������� ����.
	AI_Output(self,other,"Info_Xardas_OT_14_04");	//� ������� ����������� ����� � �����, ��� ���� ���� ������ �������.
	AI_Output(self,other,"Info_Xardas_OT_14_05");	//���� ������ ���� ����������� ����� �������, ���������� � ���� �������.
	AI_Output(self,other,"Info_Xardas_OT_14_06");	//�� �������� �������, �� ��� ������ ����� ���������� ������ ���� �� ������ �������, ������� ������ ������ ��� ����.
	AI_Output(self,other,"Info_Xardas_OT_14_07");	//���� ����� ����� �������� ��� ������ ����� ��������. ������ ��� �� �������� ���� ��� �� �������.
	AI_Output(other,self,"Info_Xardas_OT_15_08");	//� �����.
	AI_Output(self,other,"Info_Xardas_OT_14_09");	//��������, � ��������, ��� ����������� ������ ��� ������, � �������� ��� ����� � ��� ������������� ��� �����.
	AI_Output(self,other,"Info_Xardas_OT_14_10");	//��� ��� ��������� � ���� �������.
	AI_Output(other,self,"Info_Xardas_OT_15_11");	//� ���� ������! ������ ���� ����� �� ������ ����������!
	AI_Output(self,other,"Info_Xardas_OT_14_12");	//���� ������� ������, � ������ ��...
	AI_Output(other,self,"Info_Xardas_OT_15_13");	//��� � �����?
	AI_Output(self,other,"Info_Xardas_OT_14_14");	//�... ������...
	Npc_ExchangeRoutine(self,"DRAINED");
	//Log_CreateTopic(CH6_SLEEPER,LOG_MISSION);
	//Log_SetTopicStatus(CH6_SLEEPER,LOG_RUNNING);
	b_logentry(CH6_SLEEPER,"��� �, �������, � ��� �������� �� �����, ��� ��������� ������. ������� ���������� �������� ������ ���� � ��� ��� ��������� ������� ����� ����������� ������. � ������ ��������� �������� ���� ������ ����������� �����-�������, ������� ������� � ����������. ������ ��� � ����� �������� �������. �������, ��� �� ��� �� ������...");
	AI_StopProcessInfos(self);
};

