
instance INFO_GORNFM_EXIT(C_INFO)
{
	npc = pc_fighterfm;
	nr = 999;
	condition = info_gornfm_exit_condition;
	information = info_gornfm_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gornfm_exit_condition()
{
	return 1;
};

func void info_gornfm_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_GornFM_EXIT_09_01");	//������ � ���!
	}
	else
	{
		AI_Output(self,other,"Info_GornFM_EXIT_09_02");	//�� �������.
	};
	AI_StopProcessInfos(self);
};


instance INFO_GORNFM_WAIT(C_INFO)
{
	npc = pc_fighterfm;
	condition = info_gornfm_wait_condition;
	information = info_gornfm_wait_info;
	important = 0;
	permanent = 1;
	description = "������ �����, � � ��������, ��� ��� ����������!";
};


func int info_gornfm_wait_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void info_gornfm_wait_info()
{
	AI_Output(hero,self,"Info_GornFM_WAIT_15_01");	//������ �����, � � ��������, ��� ��� ����������!
	AI_Output(self,hero,"Info_GornFM_WAIT_09_02");	//������. � ���� ����� ���� � ����� � ����� � �������� �� ���, ����� �� ���� �� ������ �����!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"wait");
};


instance INFO_GORNFM_FOLLOW(C_INFO)
{
	npc = pc_fighterfm;
	condition = info_gornfm_follow_condition;
	information = info_gornfm_follow_info;
	important = 0;
	permanent = 1;
	description = "������ �� ����, ��� ����� ���� ������.";
};


func int info_gornfm_follow_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void info_gornfm_follow_info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//������ �� ����, ��� ����� ���� ������.
	AI_Output(self,hero,"Info_GornFM_FOLLOW_09_02");	//�������-��! ��� ������, � � ����� ������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
};

