
func void b_orc_assesswarn()
{
	printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessWarn");
	if(c_npcisorc(victim))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessWarn: Von Ork geschickt -> hingehen");
		Npc_ClearAIQueue(self);
		AI_StandupQuick(self);
		AI_SetWalkMode(self,NPC_RUN);
		if(!Npc_HasReadiedWeapon(self))
		{
			AI_EquipBestMeleeWeapon(self);
			AI_DrawWeapon(self);
		};
		AI_GotoNpc(self,victim);
	};
};

