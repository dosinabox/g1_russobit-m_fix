
func void zs_guard()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Guard");
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_RemoveWeapon(self);
	if(Npc_GetDistToWP(self,self.wp) > 400)
	{
		AI_GotoWP(self,self.wp);
	};
	//AI_GotoWP(self,self.wp);
	b_initarmor();
};

func void zs_guard_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Guard_Loop");
	//b_gotofp(self,"GUARD");
	if(!Npc_IsOnFP(self,"GUARD"))
	{
		AI_GotoFP(self,"GUARD");
	};
	if(Npc_GetDistToNpc(self,hero) < 800 && !c_bodystatecontains(hero,BS_SNEAK))
	{
		b_smartturntonpc(self,hero);
	}
	else
	{
		AI_AlignToFP(self);
	};
	b_playarmor();
	AI_Wait(self,0.5);
};

func void zs_guard_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Guard_End");
	b_exitarmor();
};

