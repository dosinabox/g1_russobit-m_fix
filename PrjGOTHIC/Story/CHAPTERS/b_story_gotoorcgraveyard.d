
func void b_story_gotoorcgraveyard()
{
	var C_NPC kalom;
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
	Log_CreateTopic(CH3_ORCGRAVEYARD,LOG_MISSION);
	Log_SetTopicStatus(CH3_ORCGRAVEYARD,LOG_RUNNING);
	b_logentry(CH3_ORCGRAVEYARD,"������� ��������� ������ ������� ������ �� ���, ��� ����������� ����. �� ������� ���� �������� ����������� ���� � �����-�� ������. �������, �������� ������� ��������, �� �������� ���������� � ������� ��������!");
	b_logentry(CH3_ORCGRAVEYARD,"��� �����, ����� �������, �������� ���� ����� �� �������� �����, ������� ����� �������� �� ��������� ������. ���� ��� ���������� ���� ���� ����� � ����������� ��������, ����� ����� �����-������ ��������, ������� ����� �� ������ ������������ �������.");
	Wld_InsertNpc(orcbiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(orcbiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(orcbiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(orcbiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(orcscout,"OW_PATH_198_ORCGRAVEYARD5");
	Wld_InsertNpc(orcscout,"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc(orcscout,"OW_PATH_198_ORCGRAVEYARD7");
	Wld_InsertNpc(orcscout,"OW_PATH_198_ORCGRAVEYARD8");
	Wld_InsertNpc(tpl_1463_templer,"OW_PATH_198_ORCGRAVEYARD8");
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	Npc_ExchangeRoutine(kalom,"FLEE");
	CORANGAR_GOTOOGY = TRUE;
	novize = Hlp_GetNpc(nov_1319_novize);
	Npc_ExchangeRoutine(novize,"START");
	AI_ContinueRoutine(novize);
	novize_1 = Hlp_GetNpc(nov_1320_novize);
	Npc_ExchangeRoutine(novize_1,"START");
	AI_ContinueRoutine(novize_1);
	novize_2 = Hlp_GetNpc(nov_1343_novize);
	Npc_ExchangeRoutine(novize_2,"START");
	AI_ContinueRoutine(novize_2);
	novize_3 = Hlp_GetNpc(nov_1344_novize);
	Npc_ExchangeRoutine(novize_3,"START");
	AI_ContinueRoutine(novize_3);
	novize_4 = Hlp_GetNpc(nov_1339_novize);
	Npc_ExchangeRoutine(novize_4,"START");
	AI_ContinueRoutine(novize_4);
	novize_5 = Hlp_GetNpc(nov_1341_novize);
	Npc_ExchangeRoutine(novize_5,"START");
	AI_ContinueRoutine(novize_5);
	novize_6 = Hlp_GetNpc(nov_1346_novize);
	Npc_ExchangeRoutine(novize_6,"START");
	AI_ContinueRoutine(novize_6);
	novize_7 = Hlp_GetNpc(nov_1347_novize);
	Npc_ExchangeRoutine(novize_7,"START");
	AI_ContinueRoutine(novize_7);
	novize_8 = Hlp_GetNpc(nov_1348_novize);
	Npc_ExchangeRoutine(novize_8,"START");
	AI_ContinueRoutine(novize_8);
	novize_9 = Hlp_GetNpc(nov_1349_novize);
	Npc_ExchangeRoutine(novize_9,"START");
	AI_ContinueRoutine(novize_9);
	novize_10 = Hlp_GetNpc(nov_1338_novize);
	Npc_ExchangeRoutine(novize_10,"START");
	AI_ContinueRoutine(novize_10);
	novize_11 = Hlp_GetNpc(nov_1337_novize);
	Npc_ExchangeRoutine(novize_11,"START");
	AI_ContinueRoutine(novize_11);
};
