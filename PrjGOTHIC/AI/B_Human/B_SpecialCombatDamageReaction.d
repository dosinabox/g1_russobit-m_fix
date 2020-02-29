
func void b_specialcombatdamagereaction()
{
	printdebugnpc(PD_ZS_FRAME,"B_SpecialCombatDamageReaction");
	if(self.id == 2999)
	{
		self.aivar[AIV_MISSION1] = self.aivar[AIV_MISSION1] + 1;
		if(self.aivar[AIV_MISSION1] >= HIGHPRIEST_MAXHIT)
		{
			printdebugnpc(PD_ZS_CHECK,"...Hohepriester 5mal getroffen!");
			hero.aivar[AIV_IMPORTANT] = TRUE;
			Npc_SetTempAttitude(self,ATT_NEUTRAL);
			npc_setpermattitude(self,ATT_NEUTRAL);
			b_fullstop(self);
			AI_ContinueRoutine(self);
		};
		AI_ContinueRoutine(self);
	};
};

