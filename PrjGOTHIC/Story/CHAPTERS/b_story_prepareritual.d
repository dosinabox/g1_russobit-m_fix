
func void b_story_prepareritual()
{
	var C_NPC yberion;
	var C_NPC corkalom;
	var C_NPC corangar;
	var C_NPC novize;
	var C_NPC novize_1;
	var C_NPC novize_2;
	var C_NPC novize_3;
	var C_NPC novize_4;
	var C_NPC novize_5;
	var C_NPC novize_6;
	var C_NPC novize_7;
	var C_NPC novize_8;
	var C_NPC novize_9;
	var C_NPC novize_10;
	var C_NPC novize_11;
	var C_NPC templer;
	var C_NPC templer_1;
	CORKALOM_BRINGBOOK = LOG_SUCCESS;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	Npc_ExchangeRoutine(yberion,"CALLSLEEPER");
	AI_ContinueRoutine(yberion);
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	Npc_ExchangeRoutine(corkalom,"CALLSLEEPER");
	corangar = Hlp_GetNpc(gur_1202_corangar);
	Npc_ExchangeRoutine(corangar,"CALLSLEEPER");
	AI_ContinueRoutine(corangar);
	novize = Hlp_GetNpc(nov_1319_novize);
	Npc_ExchangeRoutine(novize,"RITUAL");
	AI_ContinueRoutine(novize);
	novize.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	novize_1 = Hlp_GetNpc(nov_1320_novize);
	Npc_ExchangeRoutine(novize_1,"RITUAL");
	AI_ContinueRoutine(novize_1);
	novize_1.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	b_exchangeroutine(gur_1205_chani,"dead");
	b_exchangeroutine(gur_1207_natalia,"dead");
	novize_2 = Hlp_GetNpc(nov_1343_novize);
	Npc_ExchangeRoutine(novize_2,"RITUAL");
	AI_ContinueRoutine(novize_2);
	novize_3 = Hlp_GetNpc(nov_1344_novize);
	Npc_ExchangeRoutine(novize_3,"RITUAL");
	AI_ContinueRoutine(novize_3);
	novize_4 = Hlp_GetNpc(nov_1339_novize);
	Npc_ExchangeRoutine(novize_4,"RITUAL");
	AI_ContinueRoutine(novize_4);
	novize_5 = Hlp_GetNpc(nov_1341_novize);
	Npc_ExchangeRoutine(novize_5,"RITUAL");
	AI_ContinueRoutine(novize_5);
	novize_6 = Hlp_GetNpc(nov_1346_novize);
	Npc_ExchangeRoutine(novize_6,"RITUAL");
	AI_ContinueRoutine(novize_6);
	novize_7 = Hlp_GetNpc(nov_1347_novize);
	Npc_ExchangeRoutine(novize_7,"RITUAL");
	AI_ContinueRoutine(novize_7);
	novize_8 = Hlp_GetNpc(nov_1348_novize);
	Npc_ExchangeRoutine(novize_8,"RITUAL");
	AI_ContinueRoutine(novize_8);
	novize_9 = Hlp_GetNpc(nov_1349_novize);
	Npc_ExchangeRoutine(novize_9,"RITUAL");
	AI_ContinueRoutine(novize_9);
	novize_10 = Hlp_GetNpc(nov_1338_novize);
	Npc_ExchangeRoutine(novize_10,"RITUAL");
	AI_ContinueRoutine(novize_10);
	novize_11 = Hlp_GetNpc(nov_1337_novize);
	Npc_ExchangeRoutine(novize_11,"RITUAL");
	AI_ContinueRoutine(novize_11);
	templer = Hlp_GetNpc(tpl_1431_templer);
	templer.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	templer_1 = Hlp_GetNpc(tpl_1430_templer);
	templer_1.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	b_exchangeroutine(nov_1300_talas,"BackInCamp");
};

func int c_timeforgreatprayer()
{
	if(Wld_IsTime(20,0,4,0))
	{
		return TRUE;
	};
};

