
func void zs_sitaround()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SitAround");
	b_setperception(self);
	if((Npc_GetDistToWP(self,self.wp) > PERC_DIST_FLEE) && (!c_bodystatecontains(self,BS_SIT)))
	{
		printdebugnpc(PD_TA_CHECK,"...zu weit weg vom TA-Startpunkt!");
		AI_Standup(self);
		AI_RemoveWeapon(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	};
};

func int zs_sitaround_loop()
{
	var int sitreaktion;
	printdebugnpc(PD_TA_LOOP,"ZS_SitAround_Loop");
	if(!c_bodystatecontains(self,BS_SIT))
	{
		printdebugnpc(PD_TA_CHECK,"...NSC sitzt noch nicht!");
		AI_RemoveWeapon(self);
		if(Wld_IsMobAvailable(self,"BENCH"))
		{
			printdebugnpc(PD_TA_CHECK,"...Bank gefunden!");
			AI_UseMob(self,"BENCH",1);
			self.aivar[AIV_HANGAROUNDSTATUS] = 2;
		}
		else if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			printdebugnpc(PD_TA_CHECK,"...Stuhl gefunden!");
			AI_UseMob(self,"CHAIR",1);
			self.aivar[AIV_HANGAROUNDSTATUS] = 3;
		}
		else if(Wld_IsMobAvailable(self,"SMALL THRONE"))
		{
			printdebugnpc(PD_TA_CHECK,"...kl. Thron gefunden!");
			AI_UseMob(self,"SMALL THRONE",1);
			self.aivar[AIV_HANGAROUNDSTATUS] = 4;
		}
		else
		{
			printdebugnpc(PD_TA_CHECK,"...FP 'SIT' gefunden!");
			//AI_GotoFP(self,"SIT");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
			self.aivar[AIV_HANGAROUNDSTATUS] = 1;
		};
		//else
		//{
			//printdebugnpc(PD_TA_CHECK,"...keine Sitzgelegenheit gefunden!");
			//AI_StartState(self,zs_standaround,1,"");
			//return LOOP_CONTINUE;
		//};
	}
	else
	{
		sitreaktion = Hlp_Random(100);
		printdebugint(PD_TA_DETAIL,"...Zufallsani-Wurf:",sitreaktion);
		if(sitreaktion >= 95)
		{
			b_pee(self);
		}
		else if(sitreaktion >= 90)
		{
			if(self.aivar[AIV_HANGAROUNDSTATUS] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
			}
			else if(self.aivar[AIV_HANGAROUNDSTATUS] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_1",BS_SIT);
			};
		}
		else if(sitreaktion >= 85)
		{
			if(self.aivar[AIV_HANGAROUNDSTATUS] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
			}
			else if(self.aivar[AIV_HANGAROUNDSTATUS] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_2",BS_SIT);
			};
		}
		else if(sitreaktion >= 80)
		{
			if(self.aivar[AIV_HANGAROUNDSTATUS] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
			}
			else if(self.aivar[AIV_HANGAROUNDSTATUS] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_3",BS_SIT);
			};
		}
		else if(sitreaktion >= 75)
		{
			if(self.aivar[AIV_HANGAROUNDSTATUS] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
			}
			else if(self.aivar[AIV_HANGAROUNDSTATUS] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_4",BS_SIT);
			};
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sitaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SitAround_End");
	if(self.aivar[AIV_HANGAROUNDSTATUS] == 1)
	{
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_PlayAni(self,"T_SIT_2_STAND");
		};
		self.aivar[AIV_HANGAROUNDSTATUS] = 0;
	}
	else if(self.aivar[AIV_HANGAROUNDSTATUS] == 4)
	{
		AI_UseMob(self,"SMALL THRONE",-1);
		self.aivar[AIV_HANGAROUNDSTATUS] = 0;
	}
	else if(self.aivar[AIV_HANGAROUNDSTATUS] == 2)
	{
		AI_UseMob(self,"BENCH",-1);
		self.aivar[AIV_HANGAROUNDSTATUS] = 0;
	}
	else if(self.aivar[AIV_HANGAROUNDSTATUS] == 3)
	{
		AI_UseMob(self,"CHAIR",-1);
		self.aivar[AIV_HANGAROUNDSTATUS] = 0;
	};
};

