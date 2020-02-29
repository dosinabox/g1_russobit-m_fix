
func void b_story_feueraufnahme()
{
	var C_NPC magier_1;
	var C_NPC magier_2;
	var C_NPC magier_3;
	var C_NPC magier_4;
	if(CORRISTO_KDFAUFNAHME == 4)
	{
		Npc_ExchangeRoutine(self,"KDFRITUAL");
		magier_1 = Hlp_GetNpc(kdf_400_rodriguez);
		Wld_PlayEffect("SPELLFX_TELEPORT_RING",magier_1,magier_1,0,0,0,FALSE);
		AI_Teleport(magier_1,"OCC_CHAPEL_MAGE_01");
		
		Npc_ExchangeRoutine(magier_1,"KDFRITUAL");
		AI_ContinueRoutine(magier_1);
		magier_2 = Hlp_GetNpc(kdf_401_damarok);
		Wld_PlayEffect("SPELLFX_TELEPORT_RING",magier_2,magier_2,0,0,0,FALSE);
		AI_Teleport(magier_2,"OCC_CHAPEL_MAGE_04");
		
		Npc_ExchangeRoutine(magier_2,"KDFRITUAL");
		AI_ContinueRoutine(magier_2);
		magier_3 = Hlp_GetNpc(kdf_403_drago);
		Wld_PlayEffect("SPELLFX_TELEPORT_RING",magier_3,magier_3,0,0,0,FALSE);
		AI_Teleport(magier_3,"OCC_CHAPEL_MAGE_03");
		
		Npc_ExchangeRoutine(magier_3,"KDFRITUAL");
		AI_ContinueRoutine(magier_3);
		magier_4 = Hlp_GetNpc(kdf_405_torrez);
		Wld_PlayEffect("SPELLFX_TELEPORT_RING",magier_4,magier_4,0,0,0,FALSE);
		AI_Teleport(magier_4,"OCC_CHAPEL_MAGE_02");
		
		Npc_ExchangeRoutine(magier_4,"KDFRITUAL");
		AI_ContinueRoutine(magier_4);
	}
	else if(CORRISTO_KDFAUFNAHME == 5)
	{
		magier_1 = Hlp_GetNpc(kdf_400_rodriguez);
		AI_AlignToWP(magier_1);
		magier_2 = Hlp_GetNpc(kdf_401_damarok);
		AI_AlignToWP(magier_2);
		magier_3 = Hlp_GetNpc(kdf_403_drago);
		AI_AlignToWP(magier_3);
		magier_4 = Hlp_GetNpc(kdf_405_torrez);
		AI_AlignToWP(magier_4);
	}
	else if(CORRISTO_KDFAUFNAHME == 6)
	{
		Npc_ExchangeRoutine(self,"START");
		magier_1 = Hlp_GetNpc(kdf_400_rodriguez);
		Npc_ExchangeRoutine(magier_1,"START");
		AI_ContinueRoutine(magier_1);
		magier_2 = Hlp_GetNpc(kdf_402_corristo);
		Npc_ExchangeRoutine(magier_2,"START");
		magier_3 = Hlp_GetNpc(kdf_403_drago);
		Npc_ExchangeRoutine(magier_3,"START");
		AI_ContinueRoutine(magier_3);
		magier_4 = Hlp_GetNpc(kdf_405_torrez);
		Npc_ExchangeRoutine(magier_4,"START");
		AI_ContinueRoutine(magier_4);
	};
};

