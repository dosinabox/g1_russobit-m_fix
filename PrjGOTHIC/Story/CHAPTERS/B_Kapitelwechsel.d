
func void b_kapitelwechsel(var int neues_kapitel)
{
	var C_NPC yberion;
	var C_NPC templer;
	var C_NPC templer_1;
	var C_NPC novize;
	var C_NPC novize_1;
	var C_NPC grim;
	var C_NPC jackal;
	var C_NPC corkalom;
	var C_NPC corangar;
	var C_NPC chani;
	var C_NPC natalia;
	var C_NPC guard;
	var C_NPC bloodwyn;
	var C_NPC gardist_204;
	var C_NPC gardist_206;
	var C_NPC gardist_208;
	var C_NPC gardist_209;
	var C_NPC gardist_211;
	var C_NPC gardist_212;
	var C_NPC gardist_213;
	var C_NPC gardist_214;
	var C_NPC gardist_215;
	var C_NPC gardist_216;
	var C_NPC gardist_217;
	var C_NPC gardist_218;
	var C_NPC gardist_220;
	var C_NPC gardist_221;
	var C_NPC gardist_222;
	var C_NPC gardist_223;
	var C_NPC gardist_224;
	var C_NPC gardist_225;
	var C_NPC gardist_226;
	var C_NPC gardist_227;
	var C_NPC gardist_228;
	var C_NPC gardist_229;
	var C_NPC gardist_230;
	var C_NPC gardist_231;
	var C_NPC gardist_232;
	var C_NPC gardist_237;
	var C_NPC gardist_238;
	var C_NPC gardist_239;
	var C_NPC gardist_240;
	var C_NPC gardist_241;
	var C_NPC gardist_242;
	var C_NPC gardist_243;
	var C_NPC gardist_244;
	var C_NPC gardist_245;
	var C_NPC gardist_250;
	var C_NPC gardist_251;
	var C_NPC gardist_252;
	var C_NPC gardist_253;
	var C_NPC gardist_254;
	var C_NPC gardist_265;
	var C_NPC gardist_275;
	var C_NPC gardist_276;
	var C_NPC gardist_279;
	var C_NPC gardist_280;
	var C_NPC gardist_281;
	var C_NPC fletcher;
	KAPITEL = neues_kapitel;
	if(neues_kapitel == 1)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ПЕРВАЯ ===---");
		b_give_skipchapter1weapons();
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
		b_give_fortunochapter2herbs();
		if(!Npc_IsDead(org_826_mordrag))
		{
			b_give_mordragchapter2crap();
		};
		if(Npc_HasItems(kdw_604_cronos,itarscrollsleep))
		{
			Npc_RemoveInvItems(kdw_604_cronos,itarscrollsleep,1);
		};
		b_give_silaschapter2food();
		b_give_cipherchapter2crap();
		b_give_gornchapter2crap();
		b_give_bartholochapter2food();
		b_story_respawnow();
		b_insertinextremo();
		b_exchangeroutine(vlk_572_gravo,"WATCH");
		IntroduceChapter("Глава 2","Логово ползунов","chapter2.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 3)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ТРЕТЬЯ ===---");
		yberion = Hlp_GetNpc(gur_1200_yberion);
		AI_Teleport(yberion,"PSI_TEST");
		Npc_ExchangeRoutine(yberion,"DEAD");
	    AI_ContinueRoutine(yberion);
		yberion.flags = 0;
		Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX]+201);
		yberion.flags = NPC_FLAG_IMMORTAL;
		b_inextremostopmusic();
		b_killinextremo();
		b_exchangeroutine(vlk_572_gravo,"START");
		b_exchangeroutine(gur_999_baallukor,"remove");
		b_exchangeroutine(tpl_1418_templer,"remove");
		b_exchangeroutine(tpl_1412_templer,"remove");
		b_exchangeroutine(tpl_1411_templer,"remove");
		b_exchangeroutine(tpl_1414_templer,"remove");
		b_exchangeroutine(tpl_1419_templer,"remove");
		b_exchangeroutine(tpl_1402_gornatoth,"train");
		if(GHORIM_KICKHARLOK == LOG_SUCCESS)
		{
			b_exchangeroutine(nov_1358_harlok,"ch2");
			b_exchangeroutine(nov_1310_ghorim,"ch2");
		};
		YBERION_BRINGFOCUS = LOG_SUCCESS;
		CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
		CORKALOM_BRINGBOOK = LOG_SUCCESS;
		Log_CreateTopic(CH3_ORCGRAVEYARD,LOG_MISSION);
		Log_SetTopicStatus(CH3_ORCGRAVEYARD,LOG_RUNNING);
		b_logentry(CH3_ORCGRAVEYARD,"Великая Церемония вызова Спящего прошла не так, как планировали Гуру. Мы увидели лишь нечеткое изображение орка и какой-то пещеры. Юберион, духовный Учитель Братства, не выдержал напряжения и потерял сознание! Сейчас он пытается прийти в себя в своих покоях, Кор Галом и Кор Ангар присматривают за ним.");
		b_give_fiskchapter3weapons();
		b_give_darrionchapter3weapons();
		b_give_sharkychapter3weapons();
		b_give_baalcadarchapter3runes();
		b_give_torrezchapter3runes();
		b_give_cronoschapter3runes();
		b_giveriordianchapter3potions();
		b_give_cavalornchapter3weapons();
		b_give_wolfchapter3weapons();
		b_give_skipchapter3weapons();
		b_give_fortunochapter3herbs();
		if(!Npc_IsDead(org_826_mordrag))
		{
			b_give_mordragchapter3crap();
		};
		b_give_silaschapter3food();
		b_give_cipherchapter3crap();
		b_give_gornchapter3crap();
		b_give_bartholochapter3food();
		HANIS_CHARGED = FALSE;
		b_exchangeroutine(tpl_1422_gorhanis,"START");
		if(!Npc_IsDead(vlk_580_grim))
	    {
	        Wld_InsertNpc(stt_594_grim,"OCR_HUT_2");
			b_exchangeroutine(vlk_580_grim,"REMOVE");
	    };
		PlayVideo("GREATPRAYER.BIK");
		//PlayVideo("GREATPRAYER_RUSSOBIT.BIK");
		corkalom = Hlp_GetNpc(gur_1201_corkalom);
		corangar = Hlp_GetNpc(gur_1202_corangar);
		chani = Hlp_GetNpc(gur_1205_chani);
		natalia = Hlp_GetNpc(gur_1207_natalia);
		guard = Hlp_GetNpc(tpl_1406_templer);
		AI_SetWalkMode(corkalom,NPC_RUN);
		AI_SetWalkMode(corangar,NPC_RUN);
		AI_GotoWP(corkalom,"PSI_TEMPLE_ROOMS_IN_02");
		AI_Wait(corangar,2);
		AI_GotoWP(corangar,"PSI_TEMPLE_ROOMS_IN_02");
		AI_Teleport(guard,"PSI_TEMPLE_ROOMS_03");
		Npc_ExchangeRoutine(guard,"CARE");
		AI_ContinueRoutine(guard);
		Npc_ExchangeRoutine(corkalom,"CARE");
		Npc_ExchangeRoutine(corangar,"CARE");
		Npc_ExchangeRoutine(chani,"DEAD");
		Npc_ExchangeRoutine(natalia,"DEAD");
        AI_ContinueRoutine(corkalom);
		AI_ContinueRoutine(corangar);
		AI_ContinueRoutine(chani);
		AI_ContinueRoutine(natalia);
		templer = Hlp_GetNpc(tpl_1431_templer);
		templer.senses = hero.senses;
		templer_1 = Hlp_GetNpc(tpl_1430_templer);
		templer_1.senses = hero.senses;
		novize = Hlp_GetNpc(nov_1319_novize);
		novize.senses = hero.senses;
		novize_1 = Hlp_GetNpc(nov_1320_novize);
		novize_1.senses = hero.senses;
		b_story_respawnow();
		if(BAALISIDRO_DEALERJOB != LOG_SUCCESS)
		{
			b_exchangeroutine(nov_1333_baalisidro,"ch5");
			b_exchangeroutine(nov_1308_novize,"ch5");
			b_exchangeroutine(nov_1332_baalkagan,"ch5");
			b_exchangeroutine(org_806_organisator,"ch5");
		};
		IntroduceChapter("Глава 3","Артефакты древней силы","chapter3.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 4)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ЧЕТВЕРТАЯ ===---");
		b_changeguild(vlk_511_herek,GIL_VLK);
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
		b_give_fortunochapter4herbs();
		if(!Npc_IsDead(org_826_mordrag))
	    {
			b_give_mordragchapter4crap();
		};
		b_give_silaschapter4food();
		b_give_cipherchapter4crap();
		b_give_gornchapter4crap();
		SATURAS_BRINGFOCI = 5;
		CreateInvItem(hero,itarruneteleport2);
		Log_CreateTopic(CH4_FIREMAGES,LOG_MISSION);
		Log_SetTopicStatus(CH4_FIREMAGES,LOG_RUNNING);
		b_logentry(CH4_FIREMAGES,"Сатурас, глава магов Круга Воды, попросил меня о последней услуге. Чтобы взорвать рудную гору, ему потребуется помощь магов Огня из Старого лагеря. Я не знаю, удастся ли мне убедить их помочь Сатурасу, ведь им не выгодно разрушать Барьер. Так они потеряют всю свою власть. Но я постараюсь что-нибудь придумать.");
		b_exchangeroutine(sld_700_lee,"DAMNPAST");
		b_exchangeroutine(bau_935_homer,"DAMNPAST");
		OLDHEROGUILD = Npc_GetTrueGuild(hero);
		b_exchangeroutine(grd_228_gardist,"FMTaken");
		b_exchangeroutine(grd_230_gardist,"FMTaken");
		b_exchangeroutine(grd_280_gardist,"FMTaken");
		b_exchangeroutine(grd_281_gardist,"FMTaken");
		if(!Npc_KnowsInfo(hero,org_801_lares_bringlistback))
		{
			b_exchangeroutine(grd_896_gardist,"FMTaken");
			b_exchangeroutine(grd_895_gardist,"FMTaken");
			b_exchangeroutine(grd_894_gardist,"FMTaken");
			b_exchangeroutine(grd_893_gardist,"FMTaken");
			b_exchangeroutine(grd_872_gardist,"dead");
			b_killnpc(grd_872_gardist);
		};
		b_clearimmortal(grd_228_gardist);
		b_clearimmortal(grd_230_gardist);
		b_clearimmortal(grd_280_gardist);
		b_clearimmortal(grd_998_gardist);
		jackal = Hlp_GetNpc(grd_201_jackal);
		jackal.aivar[43] = TRUE;
		bloodwyn = Hlp_GetNpc(grd_233_bloodwyn);
		gardist_204 = Hlp_GetNpc(grd_204_gardist);
		gardist_206 = Hlp_GetNpc(grd_206_gardist);
		gardist_208 = Hlp_GetNpc(grd_208_cutter);
		gardist_209 = Hlp_GetNpc(grd_209_gardist);
		gardist_211 = Hlp_GetNpc(grd_211_skip);
		gardist_212 = Hlp_GetNpc(grd_212_torwache);
		gardist_213 = Hlp_GetNpc(grd_213_torwache);
		gardist_214 = Hlp_GetNpc(grd_214_torwache);
		gardist_215 = Hlp_GetNpc(grd_215_torwache);
		gardist_216 = Hlp_GetNpc(grd_216_torwache);
		gardist_217 = Hlp_GetNpc(grd_217_torwache);
		gardist_218 = Hlp_GetNpc(grd_218_gardist);
		gardist_220 = Hlp_GetNpc(grd_220_gardist);
		gardist_221 = Hlp_GetNpc(grd_221_gardist);
		gardist_222 = Hlp_GetNpc(grd_222_gardist);
		gardist_223 = Hlp_GetNpc(grd_223_gardist);
		gardist_224 = Hlp_GetNpc(grd_224_pacho);
		gardist_225 = Hlp_GetNpc(grd_225_gardist);
		gardist_226 = Hlp_GetNpc(grd_226_gardist);
		gardist_227 = Hlp_GetNpc(grd_227_gardist);
		gardist_228 = Hlp_GetNpc(grd_228_gardist);
		gardist_229 = Hlp_GetNpc(grd_229_gardist);
		gardist_230 = Hlp_GetNpc(grd_230_gardist);
		gardist_231 = Hlp_GetNpc(grd_231_gardist);
		gardist_232 = Hlp_GetNpc(grd_232_gardist);
		gardist_237 = Hlp_GetNpc(grd_237_gardist);
		gardist_238 = Hlp_GetNpc(grd_238_gardist);
		gardist_239 = Hlp_GetNpc(grd_239_gardist);
		gardist_240 = Hlp_GetNpc(grd_240_gardist);
		gardist_241 = Hlp_GetNpc(grd_241_gardist);
		gardist_242 = Hlp_GetNpc(grd_242_gardist);
		gardist_243 = Hlp_GetNpc(grd_243_gardist);
		gardist_244 = Hlp_GetNpc(grd_244_gardist);
		gardist_245 = Hlp_GetNpc(grd_245_gardist);
		gardist_250 = Hlp_GetNpc(grd_250_gardist);
		gardist_251 = Hlp_GetNpc(grd_251_kirgo);
		gardist_252 = Hlp_GetNpc(grd_252_gardist);
		gardist_253 = Hlp_GetNpc(grd_253_gardist);
		gardist_254 = Hlp_GetNpc(grd_254_orry);
		gardist_265 = Hlp_GetNpc(grd_265_gardist);
		gardist_275 = Hlp_GetNpc(grd_275_brueckenwache);
		gardist_276 = Hlp_GetNpc(grd_276_brueckenwache);
		gardist_279 = Hlp_GetNpc(grd_279_gardist);
		gardist_280 = Hlp_GetNpc(grd_280_gardist);
		gardist_281 = Hlp_GetNpc(grd_281_gardist);
		fletcher = Hlp_GetNpc(grd_255_fletcher);
		gardist_204.aivar[43] = TRUE;
		gardist_206.aivar[43] = TRUE;
		gardist_208.aivar[43] = TRUE;
		gardist_209.aivar[43] = TRUE;
		gardist_211.aivar[43] = TRUE;
		gardist_212.aivar[43] = TRUE;
		gardist_213.aivar[43] = TRUE;
		gardist_214.aivar[43] = TRUE;
		gardist_215.aivar[43] = TRUE;
		gardist_216.aivar[43] = TRUE;
		gardist_217.aivar[43] = TRUE;
		gardist_218.aivar[43] = TRUE;
		gardist_220.aivar[43] = TRUE;
		gardist_221.aivar[43] = TRUE;
		gardist_222.aivar[43] = TRUE;
		gardist_223.aivar[43] = TRUE;
		gardist_224.aivar[43] = TRUE;
		gardist_225.aivar[43] = TRUE;
		gardist_226.aivar[43] = TRUE;
		gardist_227.aivar[43] = TRUE;
		gardist_228.aivar[43] = TRUE;
		gardist_229.aivar[43] = TRUE;
		gardist_230.aivar[43] = TRUE;
		gardist_231.aivar[43] = TRUE;
		gardist_232.aivar[43] = TRUE;
		gardist_237.aivar[43] = TRUE;
		gardist_238.aivar[43] = TRUE;
		gardist_239.aivar[43] = TRUE;
		gardist_240.aivar[43] = TRUE;
		gardist_241.aivar[43] = TRUE;
		gardist_242.aivar[43] = TRUE;
		gardist_243.aivar[43] = TRUE;
		gardist_244.aivar[43] = TRUE;
		gardist_245.aivar[43] = TRUE;
		gardist_250.aivar[43] = TRUE;
		gardist_251.aivar[43] = TRUE;
		gardist_252.aivar[43] = TRUE;
		gardist_253.aivar[43] = TRUE;
		gardist_254.aivar[43] = TRUE;
		gardist_265.aivar[43] = TRUE;
		gardist_275.aivar[43] = TRUE;
		gardist_276.aivar[43] = TRUE;
		gardist_279.aivar[43] = TRUE;
		gardist_280.aivar[43] = TRUE;
		gardist_281.aivar[43] = TRUE;
		fletcher.aivar[43] = TRUE;
		b_killnpc(kdf_400_rodriguez);
		b_killnpc(kdf_401_damarok);
		b_killnpc(kdf_402_corristo);
		b_killnpc(kdf_403_drago);
		b_killnpc(kdf_405_torrez);
		b_exchangeroutine(grd_224_pacho,"fmtaken");
		b_exchangeroutine(vlk_520_buddler,"fmtaken");
		b_exchangeroutine(vlk_534_buddler,"fmtaken");
		b_exchangeroutine(kdf_400_rodriguez,"dead");
		b_exchangeroutine(kdf_401_damarok,"dead");
		b_exchangeroutine(kdf_402_corristo,"dead");
		b_exchangeroutine(kdf_403_drago,"dead");
		b_exchangeroutine(kdf_405_torrez,"dead");
		b_exchangeroutine(vlk_513_buddler,"noarena");
		b_exchangeroutine(vlk_514_buddler,"noarena");
		b_exchangeroutine(vlk_515_buddler,"noarena");
		b_exchangeroutine(vlk_530_guy,"noarena");
		b_exchangeroutine(stt_306_schatten,"noarena");
		b_exchangeroutine(stt_316_schatten,"noarena");
		b_exchangeroutine(stt_328_schatten,"noarena");
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_haste_01,Npc_HasItems(kdf_405_torrez,itfo_potion_haste_01));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_haste_02,Npc_HasItems(kdf_405_torrez,itfo_potion_haste_02));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_haste_03,Npc_HasItems(kdf_405_torrez,itfo_potion_haste_03));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_health_01,Npc_HasItems(kdf_405_torrez,itfo_potion_health_01));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_health_02,Npc_HasItems(kdf_405_torrez,itfo_potion_health_02));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_health_03,Npc_HasItems(kdf_405_torrez,itfo_potion_health_03));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_mana_01,Npc_HasItems(kdf_405_torrez,itfo_potion_mana_01));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_mana_02,Npc_HasItems(kdf_405_torrez,itfo_potion_mana_02));
		Npc_RemoveInvItems(kdf_405_torrez,itfo_potion_mana_03,Npc_HasItems(kdf_405_torrez,itfo_potion_mana_03));
		Npc_RemoveInvItems(kdf_405_torrez,itminugget,Npc_HasItems(kdf_405_torrez,itminugget));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrollheal,Npc_HasItems(kdf_405_torrez,itarscrollheal));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolllight,Npc_HasItems(kdf_405_torrez,itarscrolllight));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrollfirebolt,Npc_HasItems(kdf_405_torrez,itarscrollfirebolt));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrollfireball,Npc_HasItems(kdf_405_torrez,itarscrollfireball));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrollfirestorm,Npc_HasItems(kdf_405_torrez,itarscrollfirestorm));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfwolf,Npc_HasItems(kdf_405_torrez,itarscrolltrfwolf));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrflurker,Npc_HasItems(kdf_405_torrez,itarscrolltrflurker));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfscavenger,Npc_HasItems(kdf_405_torrez,itarscrolltrfscavenger));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfmolerat,Npc_HasItems(kdf_405_torrez,itarscrolltrfmolerat));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfcrawler,Npc_HasItems(kdf_405_torrez,itarscrolltrfcrawler));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfbloodfly,Npc_HasItems(kdf_405_torrez,itarscrolltrfbloodfly));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfmeatbug,Npc_HasItems(kdf_405_torrez,itarscrolltrfmeatbug));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrolltrfwaran,Npc_HasItems(kdf_405_torrez,itarscrolltrfwaran));
		Npc_RemoveInvItems(kdf_405_torrez,itarscrollfirerain,Npc_HasItems(kdf_405_torrez,itarscrollfirerain));
		Npc_RemoveInvItem(kdf_405_torrez,itarrunelight);
		Npc_RemoveInvItem(kdf_405_torrez,itarrunefirebolt);
		Npc_RemoveInvItem(kdf_405_torrez,itarruneheal);
		Npc_RemoveInvItem(kdf_405_torrez,itarrunefireball);
		Npc_RemoveInvItem(kdf_405_torrez,itarrunefirestorm);
		Npc_RemoveInvItem(kdf_405_torrez,alchemybook);
		Npc_RemoveInvItem(kdf_405_torrez,alchemy_hp1_priced);
		b_killnpc(nov_1330_baalparvez);
		b_killnpc(nov_1331_baaltaran);
		b_killnpc(tpl_1422_gorhanis);
		b_killnpc(sld_729_kharim);
		b_exchangeroutine(nov_1330_baalparvez,"dead");
		b_exchangeroutine(nov_1331_baaltaran,"dead");
		b_exchangeroutine(tpl_1422_gorhanis,"dead");
		b_exchangeroutine(sld_729_kharim,"dead");
		b_exchangeroutine(grd_251_kirgo,"FMTaken");
		b_exchangeroutine(grd_998_gardist,"aopen");
		Npc_RemoveInvItems(nov_1330_baalparvez,itminugget,Npc_HasItems(nov_1330_baalparvez,itminugget));
		Npc_RemoveInvItems(nov_1331_baaltaran,itminugget,Npc_HasItems(nov_1331_baaltaran,itminugget));
		Npc_RemoveInvItems(tpl_1422_gorhanis,itminugget,Npc_HasItems(tpl_1422_gorhanis,itminugget));
		Npc_RemoveInvItems(sld_729_kharim,itminugget,Npc_HasItems(sld_729_kharim,itminugget));
		Npc_RemoveInvItem(nov_1330_baalparvez,itmw_1h_mace_04);
		Npc_RemoveInvItem(nov_1331_baaltaran,itmw_1h_axe_old_01);
		Npc_RemoveInvItem(tpl_1422_gorhanis,itmw_gorhanis);
		Npc_RemoveInvItem(sld_729_kharim,itmw_kharim);
		b_exchangeroutine(pc_thief,"OCWait");
		b_exchangeroutine(pc_mage,"OCWait");
		b_exchangeroutine(org_826_mordrag,"START");
		b_exchangeroutine(ebr_105_raven,"FLEE");
	    b_exchangeroutine(grd_200_thorus,"FLEE");
		b_exchangeroutine(ebr_108_velaya,"FLEE");
		b_exchangeroutine(ebr_109_syra,"FLEE");
		b_exchangeroutine(ebr_110_seraphia,"FLEE");
		b_exchangeroutine(stt_329_dexter,"FLEE");
		b_exchangeroutine(stt_311_fisk,"FLEE");
		b_exchangeroutine(vlk_538_huno,"FLEE");
		b_exchangeroutine(bloodwyn,"FLEE");
		b_changeguild(pc_thief,GIL_KDF);
		b_setpermattitude(pc_thief,ATT_FRIENDLY);
		b_setpermattitude(pc_mage,ATT_FRIENDLY);
		//Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
		b_initmonsterattitudes();
		b_exchangeroutine(grd_255_fletcher,"FMTaken");
		b_exchangeroutine(grd_252_gardist,"FMTaken");
		b_exchangeroutine(grd_253_gardist,"FMTaken");
		b_exchangeroutine(grd_244_gardist,"FMTaken");
		b_exchangeroutine(grd_214_torwache,"FMTaken");
		b_exchangeroutine(grd_215_torwache,"FMTaken");
		b_exchangeroutine(grd_208_cutter,"FMTaken");
		b_exchangeroutine(grd_232_gardist,"FMTaken");
		b_exchangeroutine(grd_229_gardist,"FMTaken");
		b_exchangeroutine(grd_216_torwache,"FMTaken");
		b_exchangeroutine(grd_217_torwache,"FMTaken");
		b_exchangeroutine(grd_275_brueckenwache,"FMTaken");
		b_exchangeroutine(grd_276_brueckenwache,"FMTaken");
		b_exchangeroutine(org_818_ratford,"FMTaken");
		b_exchangeroutine(org_819_drax,"FMTaken");
		if(GATE_D04_STATE == 0)
		{
			Wld_SendTrigger("AM_GATE");
			GATE_D04_STATE = 1;
		};
		if(GATE_01_STATE == 0)
		{
			Wld_SendTrigger("EVT_OW_STARTLOCKOUT_MOVER");
			GATE_01_STATE = 1;
		};
		if(GATE_02_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_MAINGATE01_01");
			GATE_02_STATE = 1;
		};
		if(GATE_03_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_MAINGATE02_02");
			GATE_03_STATE = 1;
		};
		if(GATE_04_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_INNERMAINGATE");
			GATE_04_STATE = 1;
		};
		if(GATE_07_STATE == 0)
		{
			Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
			GATE_07_STATE = 1;
		};
		if(!Npc_IsDead(vlk_582_melvin))
	    {
	        Wld_InsertNpc(nov_1373_melvin,"PSI_12_HUT_EX_TEACH");
			b_exchangeroutine(vlk_582_melvin,"REMOVE");
	    };
		if(GETNEWGUY_DUSTY_JOINED == TRUE && !Npc_IsDead(vlk_524_dusty))
	    {
		    Wld_InsertNpc(nov_1372_dusty,"PSI_25_HUT_IN");
			b_exchangeroutine(vlk_524_dusty,"REMOVE");
	    }
		else
		{
			b_killnpc(vlk_524_dusty);
			b_exchangeroutine(vlk_524_dusty,"dead");
		};
		b_story_respawnow();
		b_exchangeroutine(gur_1205_chani,"wash");
		b_exchangeroutine(gur_1207_natalia,"wash");
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
		b_give_fortunochapter5herbs();
		if(!Npc_IsDead(org_826_mordrag))
	    {
			b_give_mordragchapter5crap();
		};
		b_give_silaschapter5food();
		b_give_cipherchapter5crap();
		b_giveriordianchapter5potions();
		b_give_gornchapter5crap();
		b_exchangeroutine(tpl_1405_gornaran,"Remove");
		b_logentry(CH4_ENTERTEMPLE,"Горн сомневается, что Улу-Мулу поможет мне пройти в город орков. Так или иначе, скоро я узнаю насколько он прав!");
		b_story_respawnow();
		IntroduceChapter("Глава 5","Хранители порталов","chapter5.tga","levelup.wav",6000);
	}
	else if(neues_kapitel == 6)
	{
		printdebugnpc(PD_MISSION,"---=== ГЛАВА ШЕСТАЯ ===---");
		b_give_scorpiochapter6weapons();
		b_give_darrionchapter6weapons();
		b_give_sharkychapter6weapons();
		b_give_cavalornchapter6weapons();
		b_give_wolfchapter6weapons();
		b_give_xardaschapter6runes();
		PlayVideo("OREHEAP.BIK");
		CreateInvItem(hero,mythrilklinge02);
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_haste_01,Npc_HasItems(kdw_604_cronos,itfo_potion_haste_01));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_haste_02,Npc_HasItems(kdw_604_cronos,itfo_potion_haste_02));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_haste_03,Npc_HasItems(kdw_604_cronos,itfo_potion_haste_03));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_health_01,Npc_HasItems(kdw_604_cronos,itfo_potion_health_01));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_health_02,Npc_HasItems(kdw_604_cronos,itfo_potion_health_02));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_health_03,Npc_HasItems(kdw_604_cronos,itfo_potion_health_03));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_mana_01,Npc_HasItems(kdw_604_cronos,itfo_potion_mana_01));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_mana_02,Npc_HasItems(kdw_604_cronos,itfo_potion_mana_02));
		Npc_RemoveInvItems(kdw_604_cronos,itfo_potion_mana_03,Npc_HasItems(kdw_604_cronos,itfo_potion_mana_03));
		Npc_RemoveInvItems(kdw_604_cronos,itminugget,Npc_HasItems(kdw_604_cronos,itminugget));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_haste_01,Npc_HasItems(kdw_605_riordian,itfo_potion_haste_01));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_haste_02,Npc_HasItems(kdw_605_riordian,itfo_potion_haste_02));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_haste_03,Npc_HasItems(kdw_605_riordian,itfo_potion_haste_03));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_health_01,Npc_HasItems(kdw_605_riordian,itfo_potion_health_01));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_health_02,Npc_HasItems(kdw_605_riordian,itfo_potion_health_02));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_health_03,Npc_HasItems(kdw_605_riordian,itfo_potion_health_03));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_mana_01,Npc_HasItems(kdw_605_riordian,itfo_potion_mana_01));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_mana_02,Npc_HasItems(kdw_605_riordian,itfo_potion_mana_02));
		Npc_RemoveInvItems(kdw_605_riordian,itfo_potion_mana_03,Npc_HasItems(kdw_605_riordian,itfo_potion_mana_03));
		Npc_RemoveInvItems(kdw_605_riordian,itminugget,Npc_HasItems(kdw_605_riordian,itminugget));
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

