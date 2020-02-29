
func void b_kapitelwechsel(var int neues_kapitel)
{
	var C_NPC yberion;
	var C_NPC templer;
	var C_NPC templer_1;
	var C_NPC novize;
	var C_NPC novize_1;
	KAPITEL = neues_kapitel;
	if(neues_kapitel == 1)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ПЕРВАЯ ===---");
		b_give_skipchapter2weapons();
		IntroduceChapter("Глава 1","Мир обреченных","chapter1.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 2)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ВТОРАЯ ===---");
		b_give_fiskchapter2weapons();
		b_give_darrionchapter2weapons();
		b_give_sharkychapter2weapons();
		b_give_baalcadarchapter2runes();
		b_give_torrezchapter2runes();
		b_give_cronoschapter2runes();
		b_giveriordianchapter2potions();
		b_give_cavalornchapter2weapons();
		b_give_wolfchapter2weapons();
		b_give_skipchapter2weapons();
		b_story_respawnow();
		b_insertinextremo();
		IntroduceChapter("Глава 2","Логово ползунов","chapter2.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 3)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ТРЕТЬЯ ===---");
		b_inextremostopmusic();
		b_killinextremo();
		YBERION_BRINGFOCUS = LOG_SUCCESS;
		CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
		CORKALOM_BRINGBOOK = LOG_SUCCESS;
		b_give_fiskchapter3weapons();
		b_give_darrionchapter3weapons();
		b_give_sharkychapter3weapons();
		b_give_baalcadarchapter3runes();
		b_give_torrezchapter3runes();
		b_give_torrezchapter3runes();
		b_give_cronoschapter3runes();
		b_giveriordianchapter3potions();
		b_give_cavalornchapter3weapons();
		b_give_wolfchapter3weapons();
		b_give_skipchapter3weapons();
		PlayVideo("GREATPRAYER.BIK");
		yberion = Hlp_GetNpc(gur_1200_yberion);
		yberion.flags = 0;
		Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX] + 1);
		yberion.flags = NPC_FLAG_IMMORTAL;
		Npc_ExchangeRoutine(yberion,"DRAINED");
		AI_ContinueRoutine(yberion);
		templer = Hlp_GetNpc(tpl_1431_templer);
		templer.senses = hero.senses;
		templer_1 = Hlp_GetNpc(tpl_1430_templer);
		templer_1.senses = hero.senses;
		novize = Hlp_GetNpc(nov_1319_novize);
		novize.senses = hero.senses;
		novize_1 = Hlp_GetNpc(nov_1319_novize);
		novize_1.senses = hero.senses;
		IntroduceChapter("Глава 3","Артефакты древней силы","chapter3.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 4)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ЧЕТВЕРТАЯ ===---");
		b_exchangeroutine(grd_205_scorpio,"BANNISHED");
		b_changeguild(grd_205_scorpio,GIL_NONE);
		b_setpermattitude(grd_205_scorpio,ATT_NEUTRAL);
		b_changeguild(stt_336_cavalorn,GIL_NONE);
		b_give_scorpiochapter4weapons();
		b_give_darrionchapter4weapons();
		b_give_sharkychapter4weapons();
		b_give_baalcadarchapter4runes();
		b_give_xardaschapter4runes();
		b_give_cronoschapter4runes();
		b_giveriordianchapter4potions();
		b_give_cavalornchapter4weapons();
		b_give_wolfchapter4weapons();
		SATURAS_BRINGFOCI = 5;
		CreateInvItem(hero,itarruneteleport2);
		Log_CreateTopic(CH4_FIREMAGES,LOG_MISSION);
		Log_SetTopicStatus(CH4_FIREMAGES,LOG_RUNNING);
		b_logentry(CH4_FIREMAGES,"Сатурас, глава магов Круга Воды, попросил меня о последней услуге. Чтобы взорвать рудную гору, ему потребуется помощь магов Огня из Старого лагеря. Я не знаю, удастся ли мне убедить их помочь Сатурасу, ведь им не выгодно разрушать Барьер. Так они потеряют всю свою власть. Но я постараюсь что-нибудь придумать.");
		b_exchangeroutine(sld_700_lee,"DAMNPAST");
		b_exchangeroutine(bau_935_homer,"DAMNPAST");
		OLDHEROGUILD = Npc_GetTrueGuild(hero);
		if(c_npcbelongstooldcamp(hero))
		{
			Npc_SetTrueGuild(hero,GIL_NONE);
			hero.guild = GIL_NONE;
		};
		b_exchangeroutine(grd_228_gardist,"FMTaken");
		b_exchangeroutine(grd_230_gardist,"FMTaken");
		b_exchangeroutine(grd_280_gardist,"FMTaken");
		b_clearimmortal(grd_228_gardist);
		b_clearimmortal(grd_230_gardist);
		b_clearimmortal(grd_280_gardist);
		b_killnpc(kdf_400_rodriguez);
		b_killnpc(kdf_401_damarok);
		b_killnpc(kdf_402_corristo);
		b_killnpc(kdf_403_drago);
		b_killnpc(kdf_405_torrez);
		b_killnpc(nov_1330_baalparvez);
		b_killnpc(nov_1331_baaltaran);
		b_killnpc(tpl_1422_gorhanis);
		b_killnpc(sld_729_kharim);
		b_exchangeroutine(pc_thief,"OCWait");
		b_exchangeroutine(pc_mage,"OCWait");
		b_changeguild(pc_thief,GIL_KDF);
		b_setpermattitude(pc_thief,ATT_FRIENDLY);
		b_setpermattitude(pc_mage,ATT_FRIENDLY);
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
		b_initmonsterattitudes();
		b_exchangeroutine(grd_255_fletcher,"FMTaken");
		b_exchangeroutine(grd_252_gardist,"FMTaken");
		b_exchangeroutine(grd_253_gardist,"FMTaken");
		b_exchangeroutine(grd_244_gardist,"FMTaken");
		b_exchangeroutine(grd_214_torwache,"FMTaken");
		b_exchangeroutine(grd_215_torwache,"FMTaken");
		b_exchangeroutine(grd_233_bloodwyn,"FMTaken");
		b_exchangeroutine(grd_232_gardist,"FMTaken");
		b_exchangeroutine(grd_229_gardist,"FMTaken");
		b_exchangeroutine(grd_216_torwache,"FMTaken");
		b_exchangeroutine(grd_217_torwache,"FMTaken");
		b_exchangeroutine(tpl_1439_gornadrak,"FMTaken");
		b_exchangeroutine(tpl_1440_templer,"FMTaken");
		IntroduceChapter("Глава 4","Ксардас","chapter4.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 5)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ПЯТАЯ ===---");
		b_give_scorpiochapter5weapons();
		b_give_darrionchapter5weapons();
		b_give_sharkychapter5weapons();
		b_give_xardaschapter5runes();
		b_give_cavalornchapter5weapons();
		b_give_wolfchapter5weapons();
		b_give_cronoschapter5runes();
		b_giveriordianchapter5potions();
		b_give_scorpiochapter6weapons();
		b_give_darrionchapter6weapons();
		b_give_sharkychapter6weapons();
		b_give_xardaschapter6runes();
		b_giveriordianchapter6potions();
		b_give_cavalornchapter6weapons();
		b_give_wolfchapter6weapons();
		b_logentry(CH4_ENTERTEMPLE,"Горн сомневается, что Улу-Мулу поможет мне пройти в город орков. Так или иначе, скоро я узнаю насколько он прав!");
		b_story_respawnow();
		IntroduceChapter("Глава 5","Хранители порталов","chapter5.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 6)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ШЕСТАЯ ===---");
		b_give_xardaschapter6runes();
		PlayVideo("OREHEAP.BIK");
		CreateInvItem(hero,mythrilklinge02);
		IntroduceChapter("Глава 6","Храм Спящего","chapter6.tga","levelup.wav",6000);
	};
};

func int c_ischapter(var int chapter)
{
	if(KAPITEL == chapter)
	{
		return TRUE;
	};
};

