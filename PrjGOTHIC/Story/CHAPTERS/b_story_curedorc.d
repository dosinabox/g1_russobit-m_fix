
func void b_story_curedorc()
{
	b_logentry(CH4_ULUMULU,"� ����� ����-���� ������� �������� �����, � �� ������, ��� ������ ��� ������.");
	b_givexp(XP_CUREDORCSLAVE);
	FREEMINEORC_SUCHEPOTION = LOG_SUCCESS;
	FREEMINEORC_LOOKINGULUMULU = LOG_RUNNING;
	KNOWS_GETULUMULU = TRUE;
};

