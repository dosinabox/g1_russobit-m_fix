
func void zs_getbackbelongings()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackBelongings");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalkangry);
	Npc_PercEnable(self,PERC_ASSESSITEM,b_getbackitem_seen);
	if(c_amistronger(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC is stronger");
		b_say(self,other,"$IWILLTEACHYOURESPECTFORFOREIGNPROPERTY");
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC is weaker");
		b_say(self,other,"$GIVEITTOME");
		AI_StartState(self,zs_getbackbelongingswait,0,"");
	};
};

func void zs_getbackbelongingswait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackBelongingsWait");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalkangry);
	Npc_PercEnable(self,PERC_ASSESSITEM,b_getbackitem_seen);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_getbackbelongingsthreat);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_getbackbelongingsthreat);
};

func void zs_getbackbelongingswait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_GetBackBelongingsWait_Loop");
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		printdebugnpc(PD_ZS_CHECK,"...Dieb weiter weg!");
		b_say(self,other,"$YOUCANKEEPTHECRAP");
		self.aivar[AIV_PCISSTRONGER] = 1;
		if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC nicht HOSTILE zum Dieb!");
			Npc_SetTempAttitude(self,ATT_ANGRY);
			AI_ContinueRoutine(self);
			return;
		};
		AI_ContinueRoutine(self);
		return;
	};
};

func void zs_getbackbelongingswait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackBelongingsWait_End");
};

func void b_getbackbelongingsthreat()
{
	printdebugnpc(PD_ZS_FRAME,"B_GetBackBelongingsThreat");
	b_say(self,other,"$OKAYKEEPIT");
	self.aivar[AIV_PCISSTRONGER] = 1;
	AI_ContinueRoutine(self);
};

