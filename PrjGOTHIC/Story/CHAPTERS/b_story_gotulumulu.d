
func void b_story_gotulumulu()
{
	CreateInvItem(hero,ulumulu);
	b_logentry(CH4_ULUMULU,"� ���� ��� ����������. � ������ ������� ��, ��� �� ������, � �� ������ ��� ���-����. �������, ���� ������������� ������� �������� � �� ������� ���, ��� ����� ���� ����.");
	Log_SetTopicStatus(CH4_ULUMULU,LOG_SUCCESS);
	b_givexp(XP_GOTULUMULU);
	FREEMINEORC_LOOKINGULUMULU = LOG_SUCCESS;
};

