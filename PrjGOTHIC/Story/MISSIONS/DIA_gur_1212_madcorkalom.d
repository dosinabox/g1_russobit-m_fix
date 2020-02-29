
instance GUR_1212_MADCORKALOM_TALK2SC(C_INFO)
{
	npc = gur_1212_madcorkalom;
	condition = gur_1212_madcorkalom_talk2sc_condition;
	information = gur_1212_madcorkalom_talk2sc_info;
	important = 1;
	permanent = 0;
};


func int gur_1212_madcorkalom_talk2sc_condition()
{
	return TRUE;
};

func void gur_1212_madcorkalom_talk2sc_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_01");	//��� �� ����� � �����������!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_02");	//��� ���������� ��� ������� ��� � ����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_03");	//�� ���������, ��� �� �����.
	AI_Output(hero,self,"GUR_1212_MadCorKalom_Talk2SC_15_04");	//����� � ������� � ���� ���� �����, ��� ��� �� ��������!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_05");	//�� �� �������� ���� ��������� ���.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_06");	//��� �� ������ ����������� ������ ����������, � ����� �� ��������� ���.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_07");	//��� �������� �������� �� ���� �����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_08");	//� �� ������ ������ � �� �����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_09");	//���������, ������!
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	AI_Wait(self,2);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,0,"");
};

