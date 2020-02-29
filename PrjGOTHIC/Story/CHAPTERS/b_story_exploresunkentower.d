
func void b_story_exploresunkentower()
{
	var C_NPC bartholo;
	var C_NPC skip;
	var C_NPC bullit;
	var C_NPC stone;
	var C_NPC gomez;
	var C_NPC scorpio;
	var C_NPC cutter;
	var C_NPC grd_220;
	var C_NPC grd_221;
	var C_NPC grd_222;
	var C_NPC grd_223;
	var C_NPC grd_239;
	var C_NPC grd_245;
	var C_NPC scar;
	var C_NPC arto;
	var C_NPC fisk;
	var C_NPC dexter;
	var C_NPC huno;
	b_logentry(CH5_URIZIEL,"���� ������� ����� ��������� ��� ���� ���������� �������� ������� ������ ���� �������, � ����� � ���������� ����� ���������� � ��������� ����� ���������, ������� ������� � ����� �� ������.");
	bartholo = Hlp_GetNpc(ebr_106_bartholo);
	skip = Hlp_GetNpc(grd_211_skip);
	bullit = Hlp_GetNpc(grd_203_bullit);
	stone = Hlp_GetNpc(grd_219_stone);
	gomez = Hlp_GetNpc(ebr_100_gomez);
	scorpio = Hlp_GetNpc(grd_205_scorpio);
	cutter = Hlp_GetNpc(grd_208_cutter);
	grd_220 = Hlp_GetNpc(grd_220_gardist);
	grd_221 = Hlp_GetNpc(grd_221_gardist);
	grd_222 = Hlp_GetNpc(grd_222_gardist);
	grd_223 = Hlp_GetNpc(grd_223_gardist);
	grd_239 = Hlp_GetNpc(grd_239_gardist);
	grd_245 = Hlp_GetNpc(grd_245_gardist);
	scar = Hlp_GetNpc(ebr_101_scar);
	arto = Hlp_GetNpc(ebr_102_arto);
	Npc_ExchangeRoutine(gomez,"OT");
	Npc_ExchangeRoutine(bartholo,"OT");
	Npc_ExchangeRoutine(arto,"OT");
	Npc_ExchangeRoutine(scar,"OT");
	Npc_ExchangeRoutine(bullit,"OT");
	//Npc_ExchangeRoutine(scorpio,"OT");
	//Npc_ExchangeRoutine(cutter,"OT");
	Npc_ExchangeRoutine(skip,"OT");
	Npc_ExchangeRoutine(stone,"OT");
	Npc_RemoveInvItems(stone,itmw_1h_sword_02,1);
	Npc_RemoveInvItems(stone,itmw_1h_sword_01,Npc_HasItems(stone,itmw_1h_sword_01));
	Npc_ExchangeRoutine(grd_220,"OT");
	Npc_ExchangeRoutine(grd_221,"OT");
	Npc_ExchangeRoutine(grd_222,"OT");
	Npc_ExchangeRoutine(grd_223,"OT");
	Npc_ExchangeRoutine(grd_239,"OT");
	Npc_ExchangeRoutine(grd_245,"OT");
	grd_220.guild = GIL_NONE;
	Npc_SetTrueGuild(grd_220,GIL_NONE);
	grd_221.guild = GIL_NONE;
	Npc_SetTrueGuild(grd_221,GIL_NONE);
	stone.guild = GIL_NONE;
	Npc_SetTrueGuild(stone,GIL_NONE);
	//skip.guild = GIL_NONE;
	//Npc_SetTrueGuild(skip,GIL_NONE);
	bullit.guild = GIL_NONE;
	Npc_SetTrueGuild(bullit,GIL_NONE);
	bartholo.guild = GIL_NONE;
	Npc_SetTrueGuild(bartholo,GIL_NONE);
	gomez.guild = GIL_NONE;
	Npc_SetTrueGuild(gomez,GIL_NONE);
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_fletcher_die) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
	OC_BANNED = TRUE;
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
	npc_setpermattitude(stone,ATT_NEUTRAL);
	Npc_SetTempAttitude(stone,ATT_NEUTRAL);
	//npc_setpermattitude(skip,ATT_NEUTRAL);
	//Npc_SetTempAttitude(skip,ATT_NEUTRAL);
	npc_setpermattitude(bullit,ATT_NEUTRAL);
	Npc_SetTempAttitude(bullit,ATT_NEUTRAL);
	npc_setpermattitude(bartholo,ATT_NEUTRAL);
	Npc_SetTempAttitude(bartholo,ATT_NEUTRAL);
	npc_setpermattitude(gomez,ATT_NEUTRAL);
	Npc_SetTempAttitude(gomez,ATT_NEUTRAL);
	fisk = Hlp_GetNpc(stt_311_fisk);
	dexter = Hlp_GetNpc(stt_329_dexter);
	huno = Hlp_GetNpc(vlk_538_huno);
	gomez.flags = 0;
	bartholo.flags = 0;
	//stone.flags = 0;
	skip.flags = 0;
	fisk.flags = 0;
	dexter.flags = 0;
	huno.flags = 0;
	CreateInvItem(gomez,dungeonkey);
	EXPLORESUNKENTOWER = TRUE;
};

