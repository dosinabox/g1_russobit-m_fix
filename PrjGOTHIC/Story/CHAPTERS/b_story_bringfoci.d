
func void b_story_bringfoci()
{
	var C_NPC gorn;
	var C_NPC lester;
	var C_NPC lestermonster;
	var C_NPC milten;
	var C_NPC diego;
	var C_NPC diegomonster;
	var C_NPC sld723;
	var C_NPC sld732;
	CreateInvItem(hero,itwrfocimap);
	CreateInvItem(hero,itarscrollteleport2);
	gorn = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(gorn,"RuinWait");
	AI_ContinueRoutine(gorn);
	lester = Hlp_GetNpc(pc_psionic);
	Npc_ExchangeRoutine(lester,"FORTRESSWAIT");
	b_exchangeroutine(tpl_1400_gornabar_psi,"Namib");
	AI_ContinueRoutine(lester);
	lestermonster = Hlp_GetNpc(bridgegolem);
	if(Npc_IsDead(lestermonster))
	{
		Wld_InsertNpc(bridgegolem,"PATH_TO_PLATEAU04_BRIDGE2");
	};
	milten = Hlp_GetNpc(pc_mage);
	Npc_ExchangeRoutine(milten,"SHWait");
	AI_ContinueRoutine(milten);
	diego = Hlp_GetNpc(pc_thief);
	Npc_ExchangeRoutine(diego,"TROLLWAIT");
	AI_ContinueRoutine(diego);
	diegomonster = Hlp_GetNpc(troll);
	if(Npc_IsDead(diegomonster))
	{
		Wld_InsertNpc(troll,"LOCATION_12_14");
	};
	sld723 = Hlp_GetNpc(sld_723_soeldner);
	sld723.aivar[AIV_PASSGATE] = TRUE;
	sld732 = Hlp_GetNpc(sld_732_soeldner);
	sld732.aivar[AIV_PASSGATE] = TRUE;
	b_logentry(CH3_ESCAPEPLANNC,"Я предложил Сатурасу помочь разрушить Барьер. Он дал мне задание: найти четыре камня-юнитора.");
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_SUCCESS);
	Log_CreateTopic(CH3_BRINGFOCI,LOG_MISSION);
	Log_SetTopicStatus(CH3_BRINGFOCI,LOG_RUNNING);
	b_logentry(CH3_BRINGFOCI,"После того, как я отдал Сатурасу юнитор и альманах из Болотного лагеря, он попросил меня найти еще четыре камня-юнитора и принести их магам Воды.");
	b_logentry(CH3_BRINGFOCI,"Сатурас дал мне старую карту, на которой отмечены места последнего пребывания юниторов. Вместе с картой я получил от него Свиток Телепортации, прочитав который, я смогу перенестись к магам Воды.");
	b_logentry(CH3_BRINGFOCI,"Риордан, один из магов Воды, приготовил для моего путешествия несколько зелий. Я смогу взять их в химической лаборатории на втором уровне Нового лагеря.");
	SATURAS_BRINGFOCI = 1;
};

