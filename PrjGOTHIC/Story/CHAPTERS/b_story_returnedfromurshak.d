
func void b_story_returnedfromurshak()
{
	var C_NPC riordian;
	b_logentry(CH4_FINDORCSHAMAN,"Кажется, Ксардасу пригодилась история, рассказанная Ур-Шаком. Теперь я должен пойти в Свободную шахту, чтобы найти друга Ур-Шака.");
	Log_SetTopicStatus(CH4_FINDORCSHAMAN,LOG_SUCCESS);
	Log_CreateTopic(CH4_ENTERTEMPLE,LOG_MISSION);
	Log_SetTopicStatus(CH4_ENTERTEMPLE,LOG_RUNNING);
	b_logentry(CH4_ENTERTEMPLE,"Я понимаю, что хочет Ксардас. Я попросил его, чтобы он помог нам разрушить Барьер. Он предложил мне один способ, который оказался никак не связан с рудной горой. Он потребовал найти вход в подземный храм Спящего.");
	b_givexp(XP_RETURNEDFROMURSHAK);
	riordian = Hlp_GetNpc(kdw_605_riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	URSHAK_SPOKEOFULUMULU = TRUE;
};

