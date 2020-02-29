
func void b_story_showedurizieltoxardas()
{
	b_logentry(CH4_ENTERTEMPLE,"Ксардаса очень удивило то, что я смог попасть в подземный храм. Теперь он считает меня героем из какого-то древнего пророчества орков.");
	Log_SetTopicStatus(CH4_ENTERTEMPLE,LOG_SUCCESS);
	Log_CreateTopic(CH5_URIZIEL,LOG_MISSION);
	Log_SetTopicStatus(CH5_URIZIEL,LOG_RUNNING);
	b_logentry(CH5_URIZIEL,"Ксардас узнал странный меч, который я нашел в храме Спящего. Он назвал его УРИЗЕЛЬ. Это древнее оружие когда-то обладало невероятной силой. Но со временем меч растерял ее. Я должен найти способ восстановить его.");
	b_givexp(XP_SHOWURIZIELTOXARDAS);
};

