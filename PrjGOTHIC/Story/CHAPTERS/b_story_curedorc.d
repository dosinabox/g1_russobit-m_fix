
func void b_story_curedorc()
{
	var C_NPC tarrok;
	b_logentry(CH4_ULUMULU,"� ����� ����-���� ������� �������� �����, � �� ������, ��� ������ ��� ������.");
	b_givexp(XP_CUREDORCSLAVE);
	tarrok = Hlp_GetNpc(freemineorc);
	tarrok.name[0] = "������";
	FREEMINEORC_SUCHEPOTION = LOG_SUCCESS;
	FREEMINEORC_LOOKINGULUMULU = LOG_RUNNING;
	KNOWS_GETULUMULU = TRUE;
};

