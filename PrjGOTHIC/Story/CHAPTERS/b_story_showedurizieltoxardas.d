
func void b_story_showedurizieltoxardas()
{
	b_logentry(CH4_ENTERTEMPLE,"�������� ����� ������� ��, ��� � ���� ������� � ��������� ����. ������ �� ������� ���� ������ �� ������-�� �������� ����������� �����.");
	Log_SetTopicStatus(CH4_ENTERTEMPLE,LOG_SUCCESS);
	Log_CreateTopic(CH5_URIZIEL,LOG_MISSION);
	Log_SetTopicStatus(CH5_URIZIEL,LOG_RUNNING);
	b_logentry(CH5_URIZIEL,"������� ����� �������� ���, ������� � ����� � ����� �������. �� ������ ��� �������. ��� ������� ������ �����-�� �������� ����������� �����. �� �� �������� ��� �������� ��. � ������ ����� ������ ������������ ���.");
	b_givexp(XP_SHOWURIZIELTOXARDAS);
};

