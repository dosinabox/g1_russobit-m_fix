
func void zs_babe_assessplayer()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Babe_AssessPlayer");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	c_lookatnpc(self,other);
};

func int zs_babe_assessplayer_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Babe_AssessPlayer_Loop");
	if(!Npc_CanSeeNpc(self,other))
	{
		b_smartturntonpc(self,other);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG)
	{
		c_stoplookat(self);
		AI_ContinueRoutine(self);
	};
	return 0;
};

func void zs_babe_assessplayer_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Babe_AssessPlayer_End");
};

