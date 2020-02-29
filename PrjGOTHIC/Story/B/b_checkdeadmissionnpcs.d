
func void b_checkdeadmissionnpcs()
{
	if(Hlp_GetInstanceID(org_844_lefty) == Hlp_GetInstanceID(self))
	{
		if(LEFTY_MISSION == LOG_RUNNING)
		{
			b_logentry(CH1_CARRYWATER,"После смерти Лефти проблема с водой была решена. Этот тип все равно был невыносим.");
			Log_SetTopicStatus(CH1_CARRYWATER,LOG_SUCCESS);
			LEFTYDEAD = TRUE;
		};
	};
};

