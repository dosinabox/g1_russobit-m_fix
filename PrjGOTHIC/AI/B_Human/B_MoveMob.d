
func void b_movemob()
{
	var string door;
	printdebugnpc(PD_ZS_FRAME,"B_MoveMob");
	door = Npc_GetDetectedMob(self);
	printdebugnpc(PD_ZS_CHECK,ConcatStrings("...mob:",door));
	if(Hlp_StrCmp(door,"DOOR"))
	{
		printdebugnpc(PD_ZS_CHECK,"...mob is a door!");
		if(self.aivar[AIV_MOVINGMOB] == 0)
		{
			printdebugnpc(PD_ZS_CHECK,"...T�re wurde noch NICHT versucht zu �ffnen!");
			self.aivar[AIV_MOVINGMOB] = 1;
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...T�re wird schon versucht zu �ffnen -> geht wohl nicht!");
			Npc_PercDisable(self,PERC_MOVEMOB);
			self.aivar[AIV_MOVINGMOB] = 0;
			AI_StartState(self,zs_waitforpassage,0,"");
		};
	};
};

