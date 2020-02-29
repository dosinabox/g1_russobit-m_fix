
func void b_story_findxardas()
{
	Log_CreateTopic(CH4_FINDXARDAS,LOG_MISSION);
	Log_SetTopicStatus(CH4_FINDXARDAS,LOG_RUNNING);
	b_logentry(CH4_FINDXARDAS,"После убийства магов Круга Огня остался еще один способ взорвать рудную гору. Сатурас сказал, что Барьер создавали тринадцать магов, а не двенадцать, как все думали.");
	b_logentry(CH4_FINDXARDAS,"Тринадцатого мага звали Ксардас. Сейчас он живет в землях орков, в своей башне. Я вызвался найти его и попросить о помощи.");
	Wld_InsertNpc(xardasdemon,"DT_E1_06");
	FINDXARDAS = TRUE;
};

