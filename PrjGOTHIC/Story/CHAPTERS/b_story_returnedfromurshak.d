
func void b_story_returnedfromurshak()
{
	var C_NPC riordian;
	b_logentry(CH4_FINDORCSHAMAN,"�������, �������� ����������� �������, ������������ ��-�����. ������ � ������ ����� � ��������� �����, ����� ����� ����� ��-����.");
	Log_SetTopicStatus(CH4_FINDORCSHAMAN,LOG_SUCCESS);
	Log_CreateTopic(CH4_ENTERTEMPLE,LOG_MISSION);
	Log_SetTopicStatus(CH4_ENTERTEMPLE,LOG_RUNNING);
	b_logentry(CH4_ENTERTEMPLE,"� �������, ��� ����� �������. � �������� ���, ����� �� ����� ��� ��������� ������. �� ��������� ��� ���� ������, ������� �������� ����� �� ������ � ������ �����. �� ���������� ����� ���� � ��������� ���� �������.");
	b_givexp(XP_RETURNEDFROMURSHAK);
	riordian = Hlp_GetNpc(kdw_605_riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	URSHAK_SPOKEOFULUMULU = TRUE;
};

