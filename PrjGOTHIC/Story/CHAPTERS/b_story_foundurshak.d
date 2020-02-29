
func void b_story_foundurshak()
{
	var C_NPC riordian;
	b_logentry(CH4_FINDORCSHAMAN,"Я спас орка-шамана по имени Ур-Шак от его сородичей. За это он рассказал мне всю историю о Спящем. Теперь я могу вернуться к Ксардасу и передать ему эту историю.");
	Log_CreateTopic(CH4_ULUMULU,LOG_MISSION);
	Log_SetTopicStatus(CH4_ULUMULU,LOG_RUNNING);
	b_logentry(CH4_ULUMULU,"Ур-Шак, изгнанный шаман, указал мне единственный способ пройти через город орков к храму Спящего так, чтобы они на меня не напали. Мне нужен Улу-Мулу, священный предмет, который служит знаком дружбы у орков. Друг Ур-Шака, который был пойман людьми и отправлен в шахту, может сделать мне такой знак.");
	b_givexp(XP_FOUNDORCSHAMAN);
	riordian = Hlp_GetNpc(kdw_605_riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	URSHAK_SPOKEOFULUMULU = TRUE;
};

