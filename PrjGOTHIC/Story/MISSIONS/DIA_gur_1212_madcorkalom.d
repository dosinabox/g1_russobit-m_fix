
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
	if(Npc_GetDistToPlayer(self) < 5000)
	{
		return TRUE;
	};
};

func void gur_1212_madcorkalom_talk2sc_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,Npc_GetNearestWP(hero));
	b_whirlaround(self,hero);
	AI_GotoWP(hero,Npc_GetNearestWP(hero));
	b_whirlaround(hero,self);
	AI_Wait(hero,4);
	b_whirlaround(hero,self);
	AI_Wait(hero,3);
	b_whirlaround(hero,self);
	AI_Wait(hero,2);
	b_whirlaround(hero,self);
	AI_Wait(hero,1);
	b_whirlaround(hero,self);
	AI_Wait(hero,1);
	b_whirlaround(hero,self);
	AI_Wait(hero,1);
	b_whirlaround(hero,self);
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_01");	//��� �� ����� � �����������!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_02");	//��� ���������� ��� ������� ��� � ����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_03");	//�� ���������, ��� �� �����.
	AI_Output(hero,self,"GUR_1212_MadCorKalom_Talk2SC_15_04");	//����� � ������� � ���� ���� �����, ��� ��� �� ��������!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_05");	//�� �� �������� ���� ��������� ���.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_06");	//��� �� ������ ����������� ������ ����������, � ����� �� ��������� ���.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_07");	//��� �������� �������� �� ���� �����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_08");	//� �� ������ ������ � �� �����.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_09");	//���������, ������!
	b_exchangeroutine(kdf_406_otxardas,"REMOVE");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	AI_Wait(self,2);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,0,"");
};

