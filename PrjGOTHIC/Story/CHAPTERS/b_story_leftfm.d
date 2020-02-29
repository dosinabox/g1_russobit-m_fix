
func void b_story_leftfm()
{
	var C_NPC gorn;
	var C_NPC urshak;
	gorn = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(gorn,"WaitFM");
	gorn.aivar[AIV_PARTYMEMBER] = FALSE;
	Wld_InsertNpc(firewaran,"OW_PATH_SCAVENGER15_SPAWN01");
	Wld_InsertNpc(firewaran,"SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc(firewaran,"OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc(swampshark,"PATH_AROUND_PSI16");
	Wld_InsertNpc(swampshark,"PATH_AROUND_PSI17");
	Wld_InsertNpc(swampshark,"PATH_AROUND_PSI18");
	Wld_InsertNpc(shadowbeast,"OW_PATH_260");
	Wld_InsertNpc(shadowbeast,"OW_PATH_033_TO_CAVE5");
	Wld_InsertNpc(shadowbeast,"SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");
	Wld_InsertNpc(troll,"OW_RUIN_TROLL");
	Wld_InsertNpc(troll,"LOCATION_12_12");
	Wld_InsertNpc(troll,"OW_PATH_2_08");
	urshak = Hlp_GetNpc(orc_2200_shaman);
	Npc_ExchangeRoutine(urshak,"LeftFM");
	ENTEREDFREEMINE = TRUE;
};

