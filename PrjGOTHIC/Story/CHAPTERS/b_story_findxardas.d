
func void b_story_findxardas()
{
	Log_CreateTopic(CH4_FINDXARDAS,LOG_MISSION);
	Log_SetTopicStatus(CH4_FINDXARDAS,LOG_RUNNING);
	b_logentry(CH4_FINDXARDAS,"����� �������� ����� ����� ���� ������� ��� ���� ������ �������� ������ ����. ������� ������, ��� ������ ��������� ���������� �����, � �� ����������, ��� ��� ������.");
	b_logentry(CH4_FINDXARDAS,"������������ ���� ����� �������. ������ �� ����� � ������ �����, � ����� �����. � �������� ����� ��� � ��������� � ������.");
	Wld_InsertNpc(xardasdemon,"DT_E1_06");
	Wld_InsertNpc(kdf_404_xardas,"DT_E3_07");
	b_give_xardaschapter4runes();
	FINDXARDAS = TRUE;
};

