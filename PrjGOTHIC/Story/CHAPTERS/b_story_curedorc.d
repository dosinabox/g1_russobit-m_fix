
func void b_story_curedorc()
{
	var C_NPC tarrok;
	b_logentry(CH4_ULUMULU,"Я отдал орку-рабу Тарроку лечебное зелье, и он сказал, что сможет мне помочь.");
	b_givexp(XP_CUREDORCSLAVE);
	tarrok = Hlp_GetNpc(freemineorc);
	tarrok.name[0] = "Таррок";
	FREEMINEORC_SUCHEPOTION = LOG_SUCCESS;
	FREEMINEORC_LOOKINGULUMULU = LOG_RUNNING;
	KNOWS_GETULUMULU = TRUE;
};

