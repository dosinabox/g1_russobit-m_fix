
func void zs_sleeper()
{
	printdebugnpc(PD_MST_FRAME,"ZS_Sleeper");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_sleeper_assesssc);
	Npc_SetPercTime(self,0.5);
	AI_AlignToWP(self);
};

func int zs_sleeper_loop()
{
	if(Npc_IsDead(gur_1212_madcorkalom) && !Npc_IsDead(hero))
	{
		if(SLEEPER_AWAKEN == 0)
		{
			//AI_PlayAni(sleeper,"T_WAKEUP");
			SLEEPER_AWAKEN = 1;
			AI_PlayAni(sleeper,"T_HURT");
			Snd_Play("SLE_AMBIENT");
			Npc_SetStateTime(self,0);
		};
		AI_TurnToNPC(self,hero);
		if(Npc_GetStateTime(self) > 5)
		{
			Snd_Play("SLE_AMBIENT_A1");
			AI_PlayAni(sleeper,"T_HURT");
			Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,hero,3,150,DAM_FIRE,TRUE);
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
		Snd_Play("SLE_AMBIENT");
		b_fullstop(hero);
		AI_StartState(hero,zs_magicsleep,0,"");
	};
};

