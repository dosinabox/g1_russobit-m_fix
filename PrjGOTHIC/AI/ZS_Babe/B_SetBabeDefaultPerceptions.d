
func void b_setbabedefaultperceptions()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,b_babe_refusetalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_babe_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
};

func void b_babe_assessfighter()
{
	if(Npc_IsInFightMode(other,FMODE_FIST) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Fighter hat nur Fäuste 'gezogen'!");
		return;
	}
	else if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		Npc_ClearAIQueue(self);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_PlayAni(self,"T_CHAIR_STANDUP_QUICK");
		}
		else if(c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
		{
			if(Npc_IsInState(self,zs_babe_sleep))
			{
				AI_PlayAni(self,"T_BABEBED_STANDUP_QUICK");
			};
		};
		AI_StandupQuick(self);
		AI_StartState(self,zs_babe_flee,0,"");
	};
};

func void b_babe_assessdamage()
{
	Npc_ClearAIQueue(self);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_CHAIR_STANDUP_QUICK");
	}
	else if(c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
		{
			if(Npc_IsInState(self,zs_babe_sleep))
			{
				AI_PlayAni(self,"T_BABEBED_STANDUP_QUICK");
			};
		};
	AI_StandupQuick(self);
	AI_StartState(self,zs_babe_flee,0,"");
};

