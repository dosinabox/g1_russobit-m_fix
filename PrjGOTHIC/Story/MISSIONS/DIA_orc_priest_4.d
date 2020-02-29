
instance INFO_HIGHPRIEST4(C_INFO)
{
	npc = orc_priest_4;
	nr = 1;
	condition = info_highpriest4_condition;
	information = info_highpriest4_info;
	permanent = 0;
	important = 1;
};


func int info_highpriest4_condition()
{
	return 1;
};

func void info_highpriest4_info()
{
	b_selectweapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_HighPriest4_17_01");	//���� ������ ���� ����!
	AI_Output(self,other,"Info_HighPriest4_17_02");	//�� ������� � ����!
	AI_Output(other,self,"Info_HighPriest4_15_03");	//��� �������, ��� ��� �� ����� ������ ����!
	b_logentry(CH4_ENTERTEMPLE,"������ ���� ������-�����, ���� �� ����������� �������, ��������� �������. �� �� ������ ���������� ����!");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

