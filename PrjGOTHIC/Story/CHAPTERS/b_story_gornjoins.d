
func void b_story_gornjoins()
{
	var C_NPC gorn;
	Wld_InsertNpc(razor,"OW_PATH_3001_MOVE");
	Wld_InsertNpc(razor,"OW_PATH_3001_MOVE2");
	Wld_InsertNpc(razor,"OW_PATH_3001_MOVE3");
	Wld_InsertNpc(razor,"OW_PATH_3001_MOVE4");
	gorn = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(gorn,"FollowToFMC");
	b_givexp(XP_GORNJOINS);
	b_logentry(CH4_ULUMULU,"�� � ������ ������ �������� ������ �������� �� ���������� ��������� �����. ��� �� � ����� ��������� ����, ����� ��-����.");
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	GORN_JOINEDFORFM = TRUE;
};

