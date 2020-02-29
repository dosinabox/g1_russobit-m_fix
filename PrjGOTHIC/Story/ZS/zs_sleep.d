
func void zs_sleep()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Sleep");
	b_setperception(self);
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sleep_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Sleep_Loop");
	if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	}
	else
	{
		AI_StartState(self,zs_sleepbed,1,"");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sleep_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Sleep_End");
};

func void zs_sleepbed()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SleepBed_Loop");
	lightsleepperception();
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_sleepenterroom);
	//Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_wakeup);
	//Npc_PercEnable(self,PERC_OBSERVEINTRUDER,zs_wakeup);
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Wld_IsMobAvailable(self,"BED"))
	{
		AI_UseMob(self,"BED",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"BEDHIGH"))
	{
		AI_UseMob(self,"BEDHIGH",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"BEDLOW"))
	{
		AI_UseMob(self,"BEDLOW",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"CHAIR"))
	{
		AI_UseMob(self,"CHAIR",1);
	}
	else
	{
		AI_StartState(self,zs_standaround,1,"");
	};
};

func int zs_sleepbed_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_SleepBed_Loop");
	AI_Wait(self,1);
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	return LOOP_CONTINUE;
};

func void zs_sleepbed_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SleepBed_End");
	if(Wld_IsTime(6,0,9,30))
	{
		b_say(self,NULL,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
	AI_UseMob(self,"BED",-1);
	b_resetfaceexpression(self);
};

func void b_sleepquietsound()
{
	printdebugnpc(PD_TA_DETAIL,"B_SleepQuietSound");
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpcFreeLOS(self,other) && other.guild != GIL_MEATBUG)
	{
		AI_StartState(self,zs_wakeup,0,"");
	}
	else
	{
		b_tossandturn();
	};
};

func void b_sleepenterroom()
{
	printdebugnpc(PD_TA_DETAIL,"B_SleepEnterRoom");
	if(c_bodystatecontains(other,BS_SNEAK) || other.guild == GIL_MEATBUG || other.guild == GIL_BLOODFLY || !Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	}
	else if(c_pcinmyroomisthief())
	{
		AI_StartState(self,zs_wakeup,0,"");
	}
	else
	{
		return;
	};
};

