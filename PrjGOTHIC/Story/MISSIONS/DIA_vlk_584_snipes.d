
instance VLK_584_SNIPES_EXIT(C_INFO)
{
	npc = vlk_584_snipes;
	nr = 999;
	condition = vlk_584_snipes_exit_condition;
	information = vlk_584_snipes_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_584_snipes_exit_condition()
{
	return 1;
};

func void vlk_584_snipes_exit_info()
{
	AI_Output(other,self,"Info_Exit_Info_15_001");	//��� ��������!
	AI_Output(self,other,"Info_Exit_Info_07_02");	//�������, ��������!
	AI_StopProcessInfos(self);
};


instance VLK_584_SNIPES_DEAL(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_condition;
	information = vlk_584_snipes_deal_info;
	important = 0;
	permanent = 0;
	description = "��� ���� ����?";
};


func int vlk_584_snipes_deal_condition()
{
	return 1;
};

func void vlk_584_snipes_deal_info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01");	//��� ���� ����?
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02");	//� ���� ���������� ���� ���� ������.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03");	//���� �� ������� ��������� ������ �������� �� ��� �������, � ��� ���� ������ ������ ����.
	SNIPES_DEAL = LOG_RUNNING;
	Log_CreateTopic(CH2_SNIPESDEAL,LOG_MISSION);
	Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_RUNNING);
	b_logentry(CH2_SNIPESDEAL,"������� ������ ��������� ��� 10 ������ ����, ���� � ������� ��������� ������ �� ��� �������!");
};


instance VLK_584_SNIPES_DEAL_RUN(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_run_condition;
	information = vlk_584_snipes_deal_run_info;
	important = 0;
	permanent = 0;
	description = "��, ��� ��� ������ ������?";
};


func int vlk_584_snipes_deal_run_condition()
{
	if(SNIPES_DEAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void vlk_584_snipes_deal_run_info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01");	//��, ��� ��� ������ ������?
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//������, �� �������� ��.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03");	//��, ������, ��� ���: � ���� ���� ���� �� ����� �������. ������ ��� ���� - ����� �� �������� ������!
	CreateInvItems(self,itminugget,10);
	b_giveinvitems(self,other,itminugget,10);
	CreateInvItem(self,itke_om_02);
	b_givexp(XP_LUREAARONAWAY);
	b_logentry(CH2_SNIPESDEAL,"������ ��������� ��� ������ � ���� ���� �� 30 ������ ����.");
};


instance VLK_584_SNIPES_DEAL_2(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_2_condition;
	information = vlk_584_snipes_deal_2_info;
	important = 0;
	permanent = 1;
	description = "(������ ����)";
};


func int vlk_584_snipes_deal_2_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal_run) && Npc_HasItems(self,itke_om_02) && SNIPES_KEY == FALSE)
	{
		return 1;
	};
};

func void vlk_584_snipes_deal_2_info()
{
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01");	//�� �����, � ��� �������!
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02");	//�����, ���� ���� �����.
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03");	//� ��� � ����� �������� ��?
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04");	//��, ������, ��� ������ �������, ��� � ����� ������� ����-�� �� ���������� ������ ������. � ���� ���-�� �� ����� ������� �������� � ����, ��� �� ����.
		b_giveinvitems(hero,self,itminugget,30);
		b_giveinvitems(self,hero,itke_om_02,1);
		SNIPES_KEY = TRUE;
		b_logentry(CH2_SNIPESDEAL,"� ����� � ������� ���� �� �������. ���������, ��� ��� ������ �� ���� �����, ����� � �������� ��� �� ����?");
	}
	else
	{
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05");	//� �� ������: �������� ������, � ���� ����.
	};
};

