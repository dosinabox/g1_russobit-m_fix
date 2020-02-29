
func void zs_assessfighter()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessFighter");
	printglobals(PD_ZS_CHECK);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessthreat);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_assessremoveweapon);
	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;
	c_zsinit();
	b_fullstop(self);
	b_whirlaround(self,other);
	if((self.aivar[AIV_WASDEFEATEDBYSC] || (c_npcisworker(self) && c_amiweaker(self,other))) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC wird zurückweichen!");
		if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
		{
			b_sayoverlay(self,other,"$YESYES");
		};
		if(Npc_GetDistToNpc(self,other) < HAI_DIST_MELEE)
		{
			AI_Dodge(self);
		};
		if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
		{
			AI_Wait(self,3);
		};
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_assessremoveweapon);
		Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessthreat);
		b_drawweapon(self,other);
	};
};

func int zs_assessfighter_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessFighter_Loop");
	if(Npc_GetDistToNpc(self,other) < HAI_DIST_ABORT_MELEE)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC ist in Nahkampfdistanz!");
		if(self.aivar[AIV_FIGHTSPEACHFLAG] == 0)
		{
			if(Npc_IsInFightMode(other,FMODE_MAGIC))
			{
				b_say(self,other,"$STOPMAGIC");
			}
			else
			{
				b_say(self,other,"$WEAPONDOWN");
			};
			self.aivar[AIV_FIGHTSPEACHFLAG] = 1;
		};
		if(Npc_GetStateTime(self) > 5)
		{
			printdebugnpc(PD_ZS_CHECK,"...Zeit abgelaufen!");
			AI_StartState(self,zs_assessfighterwait,0,"");
		};
	}
	else if(Npc_GetDistToNpc(self,other) < HAI_DIST_ABORT_RANGED)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC ist in Fernkampfdistanz!");
		if(!Npc_IsInFightMode(other,FMODE_FAR) && !Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			return LOOP_END;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...SC ist außerhalb Fernkampfdistanz!");
		return LOOP_END;
	};
	b_smartturntonpc(self,other);
	AI_Wait(self,0.3);
	return LOOP_CONTINUE;
};

func void zs_assessfighter_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessFighter_End");
	b_removeweapon(self);
};

func void zs_assessfighterwait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessFighterWait");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessthreat);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_assessremoveweapon);
	if(Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		b_say(self,other,"$ISAIDSTOPMAGIC");
	}
	else
	{
		b_say(self,other,"$ISAIDWEAPONDOWN");
	};
};

func int zs_assessfighterwait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessFighterWait_Loop");
	if(Npc_GetDistToNpc(self,other) > HAI_DIST_ABORT_MELEE)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC ist außerhalb Nahkampfreichweite!");
		b_assessremoveweapon();
	};
	if(Npc_GetStateTime(self) > 5)
	{
		printdebugnpc(PD_ZS_CHECK,"...Wartezeit abgelaufen!");
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,other);
		b_sayoverlay(self,other,"$YOUASKEDFORIT");
		AI_StartState(self,zs_attack,0,"");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_assessfighterwait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessFighterWait_End");
};

