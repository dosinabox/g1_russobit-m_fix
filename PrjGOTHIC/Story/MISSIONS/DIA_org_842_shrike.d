
instance DIA_SHRIKE_EXIT(C_INFO)
{
	npc = org_842_shrike;
	nr = 999;
	condition = dia_shrike_exit_condition;
	information = dia_shrike_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_shrike_exit_condition()
{
	return 1;
};

func void dia_shrike_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRIKE_HELLO(C_INFO)
{
	npc = org_842_shrike;
	nr = 1;
	condition = dia_shrike_hello_condition;
	information = dia_shrike_hello_info;
	important = 0;
	description = "��� ����?";
};


func int dia_shrike_hello_condition()
{
	return 1;
};

func void dia_shrike_hello_info()
{
	AI_Output(other,self,"DIA_Shrike_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Shrike_Hello_07_01");	//���� �� ����!
	AI_StopProcessInfos(self);
};


instance DIA_SHRIKE_GETLOST(C_INFO)
{
	npc = org_842_shrike;
	nr = 1;
	condition = dia_shrike_getlost_condition;
	information = dia_shrike_getlost_info;
	important = 0;
	description = "��������.";
};


func int dia_shrike_getlost_condition()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC])
	{
		return 1;
	};
};

func void dia_shrike_getlost_info()
{
	AI_Output(other,self,"DIA_Shrike_GetLost_15_00");	//��������.
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01");	//�� ��� ��������� �� ����!
	Log_CreateTopic(CH1_SHRIKESHUT,LOG_MISSION);
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_RUNNING);
	b_logentry(CH1_SHRIKESHUT,"� '������' ������ ����� ������ ���. ���������, ��� �� ��� ������ ����.");
	b_givexp(XP_KICKEDSHRIKE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"start");
};

