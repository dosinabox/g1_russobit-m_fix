
func void b_checkdeadmissionnpcs()
{
	if(Hlp_GetInstanceID(org_844_lefty) == Hlp_GetInstanceID(self))
	{
		if(LEFTY_MISSION == LOG_RUNNING)
		{
			b_logentry(CH1_CARRYWATER,"����� ������ ����� �������� � ����� ���� ������. ���� ��� ��� ����� ��� ���������.");
			Log_SetTopicStatus(CH1_CARRYWATER,LOG_SUCCESS);
			LEFTYDEAD = TRUE;
		};
	};
};

