
func void b_story_gotulumulu()
{
	CreateInvItem(hero,ulumulu);
	b_logentry(CH4_ULUMULU,"У меня все получилось. Я принес Тарроку то, что он просил, и он сделал мне Улу-Мулу. Надеюсь, орки действительно уважают традиции и не трогают тех, кто носит этот знак.");
	Log_SetTopicStatus(CH4_ULUMULU,LOG_SUCCESS);
	b_givexp(XP_GOTULUMULU);
	FREEMINEORC_LOOKINGULUMULU = LOG_SUCCESS;
};

