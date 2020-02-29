
instance GRD_264_GARDIST_GARDEAUFNAHME(C_INFO)
{
	npc = grd_264_gardist;
	condition = grd_264_gardist_gardeaufnahme_condition;
	information = grd_264_gardist_gardeaufnahme_info;
	important = 1;
	permanent = 0;
};


func int grd_264_gardist_gardeaufnahme_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_260_drake_gardeaufnahme))
	{
		return TRUE;
	};
};

func void grd_264_gardist_gardeaufnahme_info()
{
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01");	//Эй, отличная работа. Ты расправился с ползунами! Ты достоин быть одним из стражников! Ты это заслужил.
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02");	//Иди в Старый лагерь и поговори с Торусом.
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"Когда я вынесу яйца ползунов из шахты, то должен буду поговорить с Торусом. Может быть, он зачислит меня в ряды стражников.");
};

