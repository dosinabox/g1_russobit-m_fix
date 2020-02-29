
instance DIA_BAALISIDRO_EXIT(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 999;
	condition = dia_baalisidro_exit_condition;
	information = dia_baalisidro_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalisidro_exit_condition()
{
	return 1;
};

func void dia_baalisidro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALISIDRO_HELLO(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_hello_condition;
	information = dia_baalisidro_hello_info;
	permanent = 0;
	description = "�����-�� � ���� ������� �������� ���.";
};


func int dia_baalisidro_hello_condition()
{
	return 1;
};

func void dia_baalisidro_hello_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//�����-�� � ���� ������� �������� ���.
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01");	//����� ��������������! 
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02");	//��� ������ ����� ���������� �� ����� ���� ���������.
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03");	//�� �������� ������ �� ������ ���������?
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04");	//��. 
};


instance DIA_BAALISIDRO_TRADE(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 800;
	condition = dia_baalisidro_trade_condition;
	information = dia_baalisidro_trade_info;
	permanent = 1;
	description = "������, ��� �� ��� ��������.";
	trade = 1;
};


func int dia_baalisidro_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_hello))
	{
		return 1;
	};
};

func void dia_baalisidro_trade_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//������, ��� �� ��� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01");	//���...
};


instance DIA_BAALISIDRO_GIMMEKRAUT(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_gimmekraut_condition;
	information = dia_baalisidro_gimmekraut_info;
	permanent = 0;
	description = "� ���� ������ ��������� ��������. �� ���� �������� ����������.";
};


func int dia_baalisidro_gimmekraut_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_hello))
	{
		return 1;
	};
};

func void dia_baalisidro_gimmekraut_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00");	//� ���� ������ ���� ��������� ��������. �� ���� �������� ����������.
	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01");	//���� �� ����� ���� ��������, � ��� �� ������� ����, ����� ������ ���� ��� �������� ������� ����������.
	Log_CreateTopic(CH1_DEALERJOB,LOG_MISSION);
	Log_SetTopicStatus(CH1_DEALERJOB,LOG_RUNNING);
	b_logentry(CH1_DEALERJOB,"��������� ���� ������ ������ ����� ���������� � ���� �� �����. ��� ����� ������� ���� ��������, �� �� ������ �� ����� � ����� ��������. ����� ����, � ����� ��������� ��� �������� ��� ���� ���...");
};


instance DIA_BAALISIDRO_PROBLEM(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_problem_condition;
	information = dia_baalisidro_problem_info;
	permanent = 0;
	description = "���� ����� ����� ����� ���� ������� ���������...";
};


func int dia_baalisidro_problem_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wannahelp))
	{
		return 1;
	};
};

func void dia_baalisidro_problem_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00");	//�������� ����: ���� ����� ����� ����� ���� ������� ���������. �������, ����� ���� �������� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01");	//���? � ������� ������! ��� �� ��� ���������� �� ���� �����...
	if(BAALISIDRO_GOTDRINK == FALSE)
	{
		b_logentry(CH1_DEALERJOB,"���� ������ ��� ������ �������, ����� � ��������� ��� � ������ ����� ������ ����� ��� ������. �� ����� ���� ������������, ����� ��������� ���.");
	}
	else
	{
		b_logentry(CH1_DEALERJOB,"���� ������ ��� ������ �������, ����� � ��������� ��� � ������ ����� ������ ����� ��� ������. �� ����� ���� ������������, ����� ��������� ���.");
	};
};


var int baalisidro_gotdrink;

instance DIA_BAALISIDRO_DRINK(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_drink_condition;
	information = dia_baalisidro_drink_info;
	permanent = 1;
	description = "� ���� ��� �����. ���, �����.";
};


func int dia_baalisidro_drink_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_gimmekraut) && (BAALISIDRO_GOTDRINK == FALSE))
	{
		return 1;
	};
};

func void dia_baalisidro_drink_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00");	//� ���� ��� �����. ���, �����.
	if((Npc_HasItems(other,itfobooze) > 0) || (Npc_HasItems(other,itfobeer) > 0) || (Npc_HasItems(other,itfowine) > 0))
	{
		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01");	//������� ����! � ����� �� ���� ��������!
		if(Npc_HasItems(other,itfobooze))
		{
			b_giveinvitems(other,self,itfobooze,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfobooze);
		}
		else if(Npc_HasItems(other,itfobeer))
		{
			b_giveinvitems(other,self,itfobeer,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfobeer);
		}
		else if(Npc_HasItems(other,itfowine))
		{
			b_giveinvitems(other,self,itfowine,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfowine);
		};
		BAALISIDRO_GOTDRINK = TRUE;
		if(Npc_KnowsInfo(hero,dia_baalisidro_problem))
		{
			b_logentry(CH1_DEALERJOB,"��� �������� ������������� ��� �����. �����, ������ ���� ������ ������ ��� �����������.");
		}
		else
		{
			b_logentry(CH1_DEALERJOB,"���� ������ � �������� ����� �� ��� ��������. ��, �������, �� ��� ��� �� �������� ������ ��� ���� ��������.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00");	//���? ���?
	};
};


var int baalisidro_dealerjob;

instance DIA_BAALISIDRO_THINKAGAIN(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_thinkagain_condition;
	information = dia_baalisidro_thinkagain_info;
	permanent = 1;
	description = "�������, � ������ ���� ��������, � ������� �� ������� �������!";
};


func int dia_baalisidro_thinkagain_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_gimmekraut) && ((BAALISIDRO_DEALERJOB != LOG_RUNNING) && (BAALISIDRO_DEALERJOB != LOG_SUCCESS)))
	{
		return 1;
	};
};

func void dia_baalisidro_thinkagain_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00");	//�������, � ������ ���� ��������, � ������� �� ������� �������!
	if((BAALISIDRO_GOTDRINK == TRUE) && Npc_KnowsInfo(hero,dia_baalisidro_problem))
	{
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01");	//� ������! ��� �� � ��������� � ���� ����������. �� �� �� ������ ������� ���� ������ ������, ��?
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02");	//������� �����.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03");	//������, ��� ���� ���� ��������... �� ������ �������� �� ���� �� ������ 400 ������ ����. �� ������� �� �������. ��� ���������� �� ����, ������� �� ���. � ��� ����� ���� �����.
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04");	//�� ������, ��� ����� ����� ������ ������� ������ ���������?
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05");	//���� �� � ����, � �� � ��� ������ � ����.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06");	//��, ��� ���� ��������� ����� � �������� ���� ������� �����.
		BAALISIDRO_DEALERJOB = LOG_RUNNING;
		b_logentry(CH1_DEALERJOB,"���� ������ ������� ��� ���� ��������. � ������ ��� ������� � �������� ������� �������� ���.");
		CreateInvItems(self,itmijoint_1,40);
		b_giveinvitems(self,other,itmijoint_1,50);
		Npc_RemoveInvItems(self,itmijoint_2,20);
		Npc_RemoveInvItems(self,itmijoint_3,20);
		Npc_RemoveInvItems(other,itmijoint_1,40);
		CreateInvItems(other,itmijoint_2,20);
		CreateInvItems(other,itmijoint_3,20);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00");	//���, �� �� ���. � � ��� ����� � ���� ����������...
	};
};


instance DIA_BAALISIDRO_RUNNING(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_running_condition;
	information = dia_baalisidro_running_info;
	permanent = 0;
	description = "� ������ ���� ��������.";
};


func int dia_baalisidro_running_condition()
{
	if(BAALISIDRO_DEALERJOB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_baalisidro_running_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00");	//� ������ ���� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01");	//� ��� ��� 200 ������?
	if(Npc_HasItems(other,itminugget) >= 200)
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02");	//��� ���.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03");	//������... � ���� ���� ����� ����� ������ ��� �����! 
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04");	//������� ����� � ����� ����, ����.
		b_giveinvitems(hero,self,itminugget,200);
		BAALISIDRO_DEALERJOB = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_DEALERJOB,LOG_SUCCESS);
		b_logentry(CH1_DEALERJOB,"���� ������ ��� ����� ���, ��� � ������� ��� �� ���� ��������� � ������ 200 ������ ����.");
		b_givexp(XP_BAALISIDROPAYSHARE);
	}
	else
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05");	//� ����� ����� ���� ����.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06");	//��� ������� ��!
		AI_StopProcessInfos(self);
	};
};

