
func void zs_watchinextremo()
{
	printdebugnpc(PD_ZS_FRAME,"zs_WatchInExtremo");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_STAND_2_CLAPHANDS");
};

func int zs_watchinextremo_loop()
{
	printdebugnpc(PD_ZS_LOOP,"zs_WatchInExtremo_Loop");
};

func void zs_watchinextremo_end()
{
	printdebugnpc(PD_ZS_FRAME,"zs_WatchInExtremo_End");
	AI_PlayAni(self,"T_CLAPHANDS_2_STAND");
	AI_ContinueRoutine(self);
};

