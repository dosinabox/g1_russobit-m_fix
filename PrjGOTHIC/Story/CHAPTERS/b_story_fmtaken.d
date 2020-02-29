
func void b_story_fmtaken()
{
	var C_NPC fighter;
	fighter = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(fighter,"NCREPORT");
	CreateInvItem(sld_753_baloro,baloronote);
	b_killnpc(sld_750_soeldner);
	b_killnpc(sld_751_soeldner);
	b_killnpc(sld_752_okyl);
	b_killnpc(sld_753_baloro);
	b_killnpc(sld_756_soeldner);
	b_killnpc(sld_757_soeldner);
	b_killnpc(sld_758_soeldner);
	b_killnpc(sld_759_soeldner);
	b_killnpc(sld_760_soeldner);
	b_killnpc(sld_761_soeldner);
	b_killnpc(sld_762_soeldner);
	b_killnpc(sld_763_soeldner);
	b_killnpc(sld_764_soeldner);
	b_killnpc(sld_765_soeldner);
	b_killnpc(sfb_1030_schuerfer);
	b_killnpc(sfb_1031_schuerfer);
	b_killnpc(sfb_1032_schuerfer);
	b_killnpc(sfb_1033_schuerfer);
	b_killnpc(sfb_1034_schuerfer);
	b_killnpc(sfb_1035_schuerfer);
	b_killnpc(sfb_1036_schuerfer);
	b_killnpc(sfb_1037_swiney);
	b_killnpc(sfb_1038_schuerfer);
	b_killnpc(sfb_1039_schuerfer);
	b_killnpc(sfb_1042_schuerfer);
	b_killnpc(sfb_1043_schuerfer);
	b_killnpc(sfb_1044_schuerfer);
	b_killnpc(org_890_organisator);
	b_killnpc(org_891_organisator);
	b_killnpc(org_892_organisator);
	b_exchangeroutine(sld_755_soeldner,"saved");
	b_exchangeroutine(sld_758_soeldner,"dead");
	b_exchangeroutine(sld_765_soeldner,"dead");
	b_exchangeroutine(sfb_1030_schuerfer,"dead");
	b_exchangeroutine(sfb_1031_schuerfer,"dead");
	b_exchangeroutine(sfb_1032_schuerfer,"dead");
	b_exchangeroutine(sfb_1033_schuerfer,"dead");
	b_exchangeroutine(sfb_1034_schuerfer,"dead");
	b_exchangeroutine(sfb_1035_schuerfer,"dead");
	b_exchangeroutine(sfb_1036_schuerfer,"dead");
	b_exchangeroutine(sfb_1037_swiney,"dead");
	b_exchangeroutine(sfb_1038_schuerfer,"dead");
	b_exchangeroutine(sfb_1039_schuerfer,"dead");
	b_exchangeroutine(sfb_1040_schuerfer,"saved");
	b_exchangeroutine(sfb_1041_schuerfer,"saved");
	b_exchangeroutine(sfb_1042_schuerfer,"dead");
	b_exchangeroutine(sfb_1043_schuerfer,"dead");
	b_exchangeroutine(sfb_1044_schuerfer,"dead");
	b_exchangeroutine(org_890_organisator,"dead");
	b_exchangeroutine(org_891_organisator,"dead");
	b_exchangeroutine(org_892_organisator,"dead");
	if(!GATE_05_STATE)
	{
		Wld_SendTrigger("EVT_NC_LOCKOUT_MOVER_01");
		GATE_05_STATE = 1;
	};
	Wld_InsertNpc(grd_283_gardist,"FMC_ENTRANCE");
	Wld_InsertNpc(grd_285_gardist,"FMC_ENTRANCE");
	b_clearimmortal(grd_201_jackal);
	b_exchangeroutine(grd_201_jackal,"FMTaken");
	b_exchangeroutine(org_857_calash,"FMTaken");
	b_exchangeroutine(org_834_organisator,"FMTaken");
	b_exchangeroutine(org_829_organisator,"FMTaken");
	b_exchangeroutine(org_830_organisator,"FMTaken");
	b_exchangeroutine(sld_710_soeldner,"FMTaken");
	b_exchangeroutine(sld_704_blade,"FMTaken");
	b_exchangeroutine(sld_703_soeldner,"FMTaken");
	b_exchangeroutine(sld_706_soeldner,"FMTaken");
	b_exchangeroutine(sld_708_soeldner,"FMTaken");
	b_exchangeroutine(sld_720_soeldner,"FMTaken");
	b_exchangeroutine(sld_705_soeldner,"FMTaken");
	b_exchangeroutine(grd_205_scorpio,"BANNISHED");
	b_changeguild(grd_205_scorpio,GIL_NONE);
	b_setpermattitude(grd_205_scorpio,ATT_NEUTRAL);
	var C_NPC calash;
	calash = Hlp_GetNpc(org_857_calash);
	calash.guild = GIL_NONE;
	Npc_SetTrueGuild(calash,GIL_NONE);
	if(Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		b_logentry(CH4_FIREMAGES,"Диего мог бы многое рассказать мне о событиях в Старом лагере.");
	}
	else
	{
		b_logentry(CH4_FIREMAGES,"У входа в Старый лагерь меня нашел Диего и рассказал о том, что там недавно произошло.");
	};
	b_logentry(CH4_FIREMAGES,"После разрушения Старой шахты Гомез приказал своим людям захватить Свободную шахту в Новом лагере. Корристо и все маги Огня выступили против захвата, и за это были убиты.");
	b_logentry(CH4_FIREMAGES,"Я должен как можно быстрее предупредить людей Нового лагеря и рассказать Сатурасу о том, что произошло с магами Огня. Надеюсь, я не опоздаю.");
	if(SCORPIO_EXILE == FALSE)
	{
		Log_CreateTopic(GE_TRADEROW,LOG_NOTE);
		b_logentry(GE_TRADEROW,"Скорпио покинул Старый лагерь и остановился в охотничьем домике Кавалорна, между Старым и Новым лагерями.");
		SCORPIO_EXILE = TRUE;
	};
	FMTAKEN = TRUE;
};

