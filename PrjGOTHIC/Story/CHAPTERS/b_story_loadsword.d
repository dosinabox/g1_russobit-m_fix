
func void b_story_loadsword()
{
	var C_NPC milten;
	b_logentry(CH5_URIZIEL,"������� ���������� ����������. ������ ��� ����� ����� ������� �������� ���������� �������. � �������, � ������� ���� ����� ��������, � ��, ��� �� �������, ��������� ������ ���� � �����...");
	b_givexp(XP_RETURNEDFROMSUNKENTOWER);
	CreateInvItem(hero,scroll4milten);
	milten = Hlp_GetNpc(pc_mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LOADSWORD = TRUE;
};

