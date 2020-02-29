
func void b_story_findorcshaman()
{
	b_logentry(CH4_FINDXARDAS,"Я наконец-то нашел Ксардаса. Но наша встреча прошла не совсем так, как я предполагал. Его совершенно не интересует рудная гора, но вот о Спящем он захотел узнать больше. Он рассказал о нем немного. Интересно, что подумает об этом Сатурас?");
	Log_CreateTopic(CH4_FINDORCSHAMAN,LOG_MISSION);
	Log_SetTopicStatus(CH4_FINDORCSHAMAN,LOG_RUNNING);
	b_logentry(CH4_FINDORCSHAMAN,"Ксардас снова хочет меня испытать. Он хочет, чтобы я нашел одного из орков-шаманов, который прячется в руинах храма, и узнал у него все, что касается Спящего. Руины находятся на вершине горы к востоку от башни Ксардаса. Мне еще не совсем понятно, как я смогу поговорить с орком, но, думаю, скоро я смогу это выяснить.");
	Wld_InsertNpc(orc_2200_shaman,"CASTLE_06");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(orcwarrior4,"CASTLE_07");
	Wld_InsertNpc(stonegolem,"CASTLE_04");
	FINDORCSHAMAN = LOG_RUNNING;
};

