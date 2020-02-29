
func void b_failch4quests()
{
	if(GETNEWGUY_STARTED == TRUE)
	{
		b_logentry(CH1_RECRUITDUSTY,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && !Npc_KnowsInfo(hero,grd_271_ulbert_angry))
	{
		b_logentry(CH2_STORAGESHED,"В Старой шахте произошел обвал, теперь туда не попасть!");
		Log_SetTopicStatus(CH2_STORAGESHED,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal) && !Npc_KnowsInfo(hero,grd_262_aaron_sellnow))
	{
		b_logentry(CH2_SNIPESDEAL,"Старая шахта обрушилась! Я не смогу выполнить просьбу Снайпса...");
		Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,org_801_lares_bringlistback))
	{
		b_logentry(THELISTFORNC,"Список припасов для Старой шахты и план Ларса больше не имеют никакого смысла.");
		Log_SetTopicStatus(THELISTFORNC,LOG_FAILED);
		LARES_BRINGLISTBACK = LOG_FAILED;
		DIEGO_BRINGLIST = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer) && !Npc_KnowsInfo(hero,info_diego_bringlist_success))
	{
		b_logentry(CH1_BRINGLIST,"Список припасов для Старой шахты больше не имеет никакого смысла.");
		Log_SetTopicStatus(CH1_BRINGLIST,LOG_FAILED);
		LARES_BRINGLISTBACK = LOG_FAILED;
		DIEGO_BRINGLIST = LOG_FAILED;
	};
	if(CRONOS_MESSENGER == LOG_RUNNING && !Npc_KnowsInfo(hero,dia_milten_nocheinbrief))
	{
		b_logentry(KDWLETTER,"Все маги Огня мертвы, я не успел передать им письмо...");
		Log_SetTopicStatus(KDWLETTER,LOG_FAILED);
		CRONOS_MESSENGER = LOG_FAILED;
	};
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
		b_logentry(KDFLETTER,"Все маги Огня мертвы, я не успел передать им письмо...");
		Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
		PYROCAR_MESSENGER = LOG_FAILED;
	};
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		DEXTER_GETKALOMSRECIPE = LOG_FAILED;
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_FAILED);
		b_logentry(CH1_KALOMSRECIPE,"Не думаю, что теперь Декстеру это нужно.");
	};
	if(FISK_GETNEWHEHLER == LOG_RUNNING)
	{
		FISK_GETNEWHEHLER = LOG_FAILED;
		Log_SetTopicStatus(CH1_FISKNEWDEALER,LOG_FAILED);
		b_logentry(CH1_FISKNEWDEALER,"Теперь между лагерями открытая война, никто не согласится на такое!");
	};
	if(SNAF_ZUTATEN == LOG_RUNNING)
	{
		SNAF_ZUTATEN = LOG_FAILED;
		Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_FAILED);
		b_logentry(CH1_SNAFSRECIPE,"Теперь лучше не появляться в Старом лагере...");
	};
	if(THORUS_MORDRAGKO == LOG_RUNNING)
	{
		THORUS_MORDRAGKO = LOG_FAILED;
		Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
		b_logentry(CH1_MORDRAGKO,"Теперь лучше не появляться в Старом лагере...");
	};
};

