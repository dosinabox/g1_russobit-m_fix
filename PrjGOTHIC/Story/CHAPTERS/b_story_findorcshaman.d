
func void b_story_findorcshaman()
{
	b_logentry(CH4_FINDXARDAS,"� �������-�� ����� ��������. �� ���� ������� ������ �� ������ ���, ��� � �����������. ��� ���������� �� ���������� ������ ����, �� ��� � ������ �� ������� ������ ������. �� ��������� � ��� �������. ���������, ��� �������� �� ���� �������?");
	Log_CreateTopic(CH4_FINDORCSHAMAN,LOG_MISSION);
	Log_SetTopicStatus(CH4_FINDORCSHAMAN,LOG_RUNNING);
	b_logentry(CH4_FINDORCSHAMAN,"������� ����� ����� ���� ��������. �� �����, ����� � ����� ������ �� �����-�������, ������� �������� � ������ �����, � ����� � ���� ���, ��� �������� �������. ����� ��������� �� ������� ���� � ������� �� ����� ��������. ��� ��� �� ������ �������, ��� � ����� ���������� � �����, ��, �����, ����� � ����� ��� ��������.");
	Wld_InsertNpc(orc_2200_shaman,"CASTLE_06");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(stonegolem,"CASTLE_04");
	FINDORCSHAMAN = LOG_RUNNING;
};

