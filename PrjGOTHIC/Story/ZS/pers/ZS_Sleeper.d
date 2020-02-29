
func void zs_sleeper()
{
	printdebugnpc(PD_MST_FRAME,"ZS_Sleeper");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_sleeper_assesssc);
	Npc_SetPercTime(self,0.5);
	AI_AlignToWP(self);
};

func int zs_sleeper_loop()
{
	if(SLF_FIRE == TRUE)
	{
		AI_TurnToNPC(self,hero);
		if(Npc_GetStateTime(self) > 5)
		{
			Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,hero,2,150,DAM_FIRE,TRUE);
			Npc_SetStateTime(self,0);
		};
	};
	return 0;
};

func void zs_sleeper_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_Sleeper_end");
};

func void b_sleeper_assesssc()
{
	if((Npc_GetDistToNpc(self,hero) < 800) && !Npc_IsInState(hero,zs_magicsleep))
	{
		b_fullstop(hero);
		AI_StartState(hero,zs_magicsleep,0,"");
	};
};

