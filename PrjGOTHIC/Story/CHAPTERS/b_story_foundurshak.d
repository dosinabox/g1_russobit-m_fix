
func void b_story_foundurshak()
{
	var C_NPC riordian;
	b_logentry(CH4_FINDORCSHAMAN,"� ���� ����-������ �� ����� ��-��� �� ��� ���������. �� ��� �� ��������� ��� ��� ������� � ������. ������ � ���� ��������� � �������� � �������� ��� ��� �������.");
	Log_CreateTopic(CH4_ULUMULU,LOG_MISSION);
	Log_SetTopicStatus(CH4_ULUMULU,LOG_RUNNING);
	b_logentry(CH4_ULUMULU,"��-���, ��������� �����, ������ ��� ������������ ������ ������ ����� ����� ����� � ����� ������� ���, ����� ��� �� ���� �� ������. ��� ����� ���-����, ��������� �������, ������� ������ ������ ������ � �����. ���� ��-����, ������� ��� ������ ������ � ��������� � �����, ����� ������� ��� ����� ����.");
	b_givexp(XP_FOUNDORCSHAMAN);
	riordian = Hlp_GetNpc(kdw_605_riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	URSHAK_SPOKEOFULUMULU = TRUE;
};

