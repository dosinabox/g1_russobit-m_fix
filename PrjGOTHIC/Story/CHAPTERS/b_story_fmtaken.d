
func void b_story_fmtaken()
{
	var C_NPC fighter;
	fighter = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(fighter,"NCREPORT");
	b_killnpc(sld_750_soeldner);
	b_killnpc(sld_751_soeldner);
	b_killnpc(sld_752_okyl);
	b_killnpc(sld_753_baloro);
	b_killnpc(sld_755_soeldner);
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
	b_killnpc(sfb_1040_schuerfer);
	b_killnpc(sfb_1041_schuerfer);
	b_killnpc(sfb_1042_schuerfer);
	b_killnpc(sfb_1043_schuerfer);
	b_killnpc(sfb_1044_schuerfer);
	b_killnpc(org_890_organisator);
	b_killnpc(org_891_organisator);
	b_killnpc(org_892_organisator);
	Wld_InsertNpc(grd_283_gardist,"FMC_ENTRANCE");
	Wld_InsertNpc(grd_285_gardist,"FMC_ENTRANCE");
	b_exchangeroutine(grd_201_jackal,"FMTaken");
	Wld_SetObjectRoutine(0,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(1,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(2,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(3,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(4,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(5,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(6,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(7,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(8,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(9,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(10,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(11,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(12,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(13,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(14,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(15,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(16,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(17,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(18,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(19,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(20,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(21,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(22,0,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine(23,0,"EVT_AM_LOB_GATE_BIG",1);
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

