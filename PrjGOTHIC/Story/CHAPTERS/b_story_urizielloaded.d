
func void b_story_urizielloaded()
{
	b_logentry(CH5_URIZIEL,"Все получилось. УРИЗЕЛЬ восстановлен, его сила так же велика, как и в древние времена. Сатурас и маги Воды смертельно обижены, так что лучше мне больше не попадаться им на глаза. Но это не так важно, ведь меня ждет Спящий!");
	if(Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_URIZIEL,LOG_SUCCESS);
	}
	else
	{
		b_logentry(CH5_URIZIEL,"Во время нашей последней встречи Ксардас упомянул о том, что силу УРИЗЕЛЯ могут использовать даже маги. Но он расскажет мне об этом только после того, как я заряжу меч.");
	};
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
};

