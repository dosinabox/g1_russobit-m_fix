
func void b_story_accesstoxardas()
{
	CreateInvItem(hero,itarruneteleport3);
	b_logentry(CH4_FINDXARDAS,"� ����� ������ ���� ���� ������� � ����� �� ������-���������. ������ �� ��� ��� ���� ������������. ���������, ���� ��� ���� ���������.");
	b_givexp(XP_DELIVEREDGOLEMHEARTS);
	FINDGOLEMHEARTS = 4;
};

