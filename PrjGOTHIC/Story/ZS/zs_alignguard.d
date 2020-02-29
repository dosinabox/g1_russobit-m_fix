
func void zs_alignguard()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Guard");
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	b_initarmor();
};

func void zs_alignguard_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Guard_Loop");
	b_gotofp(self,"GUARD");
	b_playarmor();
	AI_Wait(self,0.5);
};

func void zs_alignguard_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Guard_End");
	b_exitarmor();
};

