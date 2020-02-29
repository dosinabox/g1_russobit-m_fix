
func void b_story_urizielloaded()
{
	//b_logentry(CH5_URIZIEL,"");
	Log_SetTopicStatus(CH5_URIZIEL,LOG_SUCCESS);
	b_givexp(XP_LOADEDURIZIEL);
	b_setpermattitude(kdw_600_saturas,ATT_HOSTILE);
	b_setpermattitude(kdw_601_myxir,ATT_HOSTILE);
	b_setpermattitude(kdw_602_merdarion,ATT_HOSTILE);
	b_setpermattitude(kdw_603_nefarius,ATT_HOSTILE);
	b_setpermattitude(kdw_604_cronos,ATT_HOSTILE);
	b_setpermattitude(kdw_605_riordian,ATT_HOSTILE);
	b_clearimmortal(kdw_600_saturas);
	b_clearimmortal(kdw_601_myxir);
	b_clearimmortal(kdw_602_merdarion);
	b_clearimmortal(kdw_603_nefarius);
	b_clearimmortal(kdw_604_cronos);
	b_clearimmortal(kdw_605_riordian);
	b_setnpctype(kdw_600_saturas,NPCTYPE_MAIN);
	b_setnpctype(kdw_601_myxir,NPCTYPE_MAIN);
	b_setnpctype(kdw_602_merdarion,NPCTYPE_MAIN);
	b_setnpctype(kdw_603_nefarius,NPCTYPE_MAIN);
	b_setnpctype(kdw_604_cronos,NPCTYPE_MAIN);
	b_setnpctype(kdw_605_riordian,NPCTYPE_MAIN);
	AI_Teleport(sld_723_soeldner,"NC_OREALERT_2");
	AI_Teleport(sld_732_soeldner,"NC_OREALERT_1");
	AI_Teleport(kdw_603_nefarius,"NC_LOWER_CAVE_01");
	AI_Teleport(kdw_601_myxir,"NC_KDW03+04_OUT");
	AI_Teleport(kdw_604_cronos,"NC_KDW05+06_OUT");
	AI_Teleport(kdw_602_merdarion,"NC_PLACE02");
	b_exchangeroutine(sld_723_soeldner,"OREALERT");
	b_exchangeroutine(sld_732_soeldner,"OREALERT");
	b_exchangeroutine(kdw_603_nefarius,"OREALERT");
	b_exchangeroutine(kdw_601_myxir,"OREALERT");
	b_exchangeroutine(kdw_604_cronos,"OREALERT");
	b_exchangeroutine(kdw_602_merdarion,"OREALERT");
	b_setpermattitude(sld_723_soeldner,ATT_HOSTILE);
	b_setpermattitude(sld_732_soeldner,ATT_HOSTILE);
	NC_BANNED = TRUE;
	Log_CreateTopic(CH6_SLEEPER,LOG_MISSION);
	Log_SetTopicStatus(CH6_SLEEPER,LOG_RUNNING);
	b_logentry(CH6_SLEEPER,"Все получилось. УРИЗЕЛЬ восстановлен, его сила так же велика, как и в древние времена. Сатурас и маги Воды смертельно обижены, так что лучше мне больше не попадаться им на глаза. Но это не так важно, ведь меня ждет Спящий!");
};

