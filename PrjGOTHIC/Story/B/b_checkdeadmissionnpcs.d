
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
	if(Hlp_GetInstanceID(bau_935_homer) == Hlp_GetInstanceID(self))
	{
		if(HOMER_DAMLURKER == LOG_RUNNING)
		{
			HOMER_DAMLURKER = LOG_FAILED;
			Log_SetTopicStatus(CH1_DAMLURKER,LOG_FAILED);
		};
	};
	if(Hlp_GetInstanceID(sld_753_baloro) == Hlp_GetInstanceID(self))
	{
		if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING && FMTAKEN == FALSE)
		{
			SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_FAILED;
			Log_SetTopicStatus(BALOROS_WAFFE,LOG_FAILED);
		};
	};
	if(Hlp_GetInstanceID(vlk_581_snaf) == Hlp_GetInstanceID(self))
	{
		if(SNAF_ZUTATEN == LOG_RUNNING)
		{
			SNAF_ZUTATEN = LOG_FAILED;
			Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_FAILED);
		};
	};
};

