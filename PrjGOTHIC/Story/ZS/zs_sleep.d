
func void zs_sleep()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Sleep");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
	AI_StartState(self,zs_sleepbed,1,"");
};

func void zs_sleepbed()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SleepBed_Loop");
	lightsleepperception();
	if(Wld_IsMobAvailable(self,"BED"))
	{
		AI_UseMob(self,"BED",1);
	}
	else if(Wld_IsMobAvailable(self,"BEDHIGH") || Wld_IsMobAvailable(self,"BEDLOW"))
	{
		AI_UseMob(self,"BEDHIGH",1);
		AI_UseMob(self,"BEDLOW",1);
	}
	else
	{
		AI_StartState(self,zs_standaround,1,"");
	};
};

func int zs_sleepbed_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_SleepBed_Loop");
	if(!c_bodystatecontains(self,BS_MOBINTERACT) && (Npc_GetStateTime(self) > 3))
	{
		AI_StartState(self,zs_sitaround,1,"");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sleepbed_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SleepBed_End");
	if(Wld_IsTime(7,0,8,30))
	{
		b_say(self,NULL,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
	AI_UseMob(self,"BED",-1);
};

func void b_sleepquietsound()
{
	printdebugnpc(PD_TA_DETAIL,"B_SleepQuietSound");
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		AI_StartState(self,zs_wakeup,0,"");
	}
	else
	{
		b_tossandturn();
	};
};

