
func void b_story_senttonc()
{
	var C_NPC angar;
	var C_NPC yberion;
	var C_NPC gorn;
	angar = Hlp_GetNpc(gur_1202_corangar);
	Npc_ExchangeRoutine(angar,"start");
	yberion = Hlp_GetNpc(gur_1200_yberion);
	Npc_ExchangeRoutine(yberion,"dead");
	gorn = Hlp_GetNpc(pc_fighter);
	printdebugnpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	b_logentry(CH3_ESCAPEPLANNC,"���� �������, �������� ���� ��������! �� ��������� �� � �����! ����� ������� �� ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����.");
	b_logentry(CH3_ESCAPEPLANNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������ ��� �������� ����� ����������� ����� ����. ");
	CreateInvItem(self,itarruneteleport5);
	b_giveinvitems(self,hero,itarruneteleport5,1);
	CORANGAR_SENDTONC = TRUE;
};

