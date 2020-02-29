
func void b_orc_assessdefeat()
{
	printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessDefeat");
	if((Npc_GetPermAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetPermAttitude(self,victim) == ATT_ANGRY))
	{
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self))
		{
			printdebugnpc(PD_ORC_CHECK,"B_Orc_AssessDefeat: Hostile wird gefinished");
			AI_TurnToNPC(self,victim);
			AI_FinishingMove(self,victim);
		};
	};
	if(Npc_HasReadiedRangedWeapon(other) && (other.guild < GIL_SEPERATOR_ORC) && ((victim.guild > GIL_SEPERATOR_ORC) || (victim.guild == GIL_ORCDOG)))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessDefeat: Fernkampfwaffentraeger sind Schweine");
		AI_StartState(self,zs_orc_attack,0,"");
	};
	if(npc_gettempattitude(self,other) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(self,ATT_ANGRY);
	};
	if(npc_gettempattitude(self,victim) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(self,ATT_ANGRY);
	};
};

