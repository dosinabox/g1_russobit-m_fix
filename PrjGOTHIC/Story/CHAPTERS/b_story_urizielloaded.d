
func void b_story_urizielloaded()
{
	b_logentry(CH5_URIZIEL,"��� ����������. ������� ������������, ��� ���� ��� �� ������, ��� � � ������� �������. ������� � ���� ���� ���������� �������, ��� ��� ����� ��� ������ �� ���������� �� �� �����. �� ��� �� ��� �����, ���� ���� ���� ������!");
	if(Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_URIZIEL,LOG_SUCCESS);
	}
	else
	{
		b_logentry(CH5_URIZIEL,"�� ����� ����� ��������� ������� ������� �������� � ���, ��� ���� ������� ����� ������������ ���� ����. �� �� ��������� ��� �� ���� ������ ����� ����, ��� � ������ ���.");
	};
	b_givexp(XP_LOADEDURIZIEL);
	b_setpermattitude(kdw_600_saturas,ATT_HOSTILE);
	b_setpermattitude(kdw_601_myxir,ATT_HOSTILE);
	b_setpermattitude(kdw_602_merdarion,ATT_HOSTILE);
	b_setpermattitude(kdw_603_nefarius,ATT_HOSTILE);
	b_setpermattitude(kdw_604_cronos,ATT_HOSTILE);
	b_setpermattitude(kdw_605_riordian,ATT_HOSTILE);
	b_clearimmortal(kdw_600_saturas);
	b_clearimmortal(kdw_601_myxir);
	b_clearimmortal(kdw_602_merdarion);
	b_clearimmortal(kdw_603_nefarius);
	b_clearimmortal(kdw_604_cronos);
	b_clearimmortal(kdw_605_riordian);
	b_setnpctype(kdw_600_saturas,NPCTYPE_MAIN);
	b_setnpctype(kdw_601_myxir,NPCTYPE_MAIN);
	b_setnpctype(kdw_602_merdarion,NPCTYPE_MAIN);
	b_setnpctype(kdw_603_nefarius,NPCTYPE_MAIN);
	b_setnpctype(kdw_604_cronos,NPCTYPE_MAIN);
	b_setnpctype(kdw_605_riordian,NPCTYPE_MAIN);
};

