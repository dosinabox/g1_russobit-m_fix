
func int b_stopmagicsleep()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_ClearAIQueue(self);
	AI_PlayAni(self,"T_VICTIM_SLE_2_STAND");
	AI_Standup(self);
	b_sayoverlay(self,other,"$WHATSTHAT");
	if(Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...'other' gültig!");
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_CHECK,"...'other' hostile!");
			AI_StartState(self,zs_assessenemy,0,"");
		};
	};
	AI_ContinueRoutine(self);
};

func void zs_magicsleep()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MagicSleep");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_stopmagicsleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	if(c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
	{
		AI_ContinueRoutine(self);
		return;
	};
	if(Npc_WasInState(self,zs_unconscious))
	{
		AI_ContinueRoutine(self);
		return;
	};
	Npc_ClearAIQueue(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		printdebugnpc(PD_MAGIC,"bodystate not interuptable, standing up...");
		AI_Standup(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
};

func void zs_magicsleep_loop()
{
	var int time;
	printdebugnpc(PD_ZS_LOOP,"MagicSleep Loop");
	time = Npc_GetStateTime(self);
	if(time > SPL_TIME_SLEEP)
	{
		b_stopmagicsleep();
	};
	AI_Wait(self,1);
};

func void zs_magicsleep_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MagicSleep_End");
};

