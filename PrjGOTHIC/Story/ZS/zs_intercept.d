
func void zs_intercept()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Intercept");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_interceptassessdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_interceptassessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assesssc);
	Npc_SetPercTime(self,0.5);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_intercept_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Intercept_Loop");
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_intercept_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Intercept_End");
};

func void b_interceptassessdamage()
{
	printdebugnpc(PD_TA_FRAME,"B_InterceptAssessDamage");
	if(Npc_CheckInfo(self,1))
	{
		printdebugnpc(PD_ZS_CHECK,"...wichtige Info zu vergeben!");
		hero.aivar[AIV_IMPORTANT] = TRUE;
		b_fullstop(self);
		AI_StartState(self,zs_talk,1,"");
		return;
	}
	else
	{
		b_fullstop(self);
		AI_StartState(self,zs_reacttodamage,0,"");
	};
};

func void b_interceptassessmagic()
{
	printdebugnpc(PD_TA_FRAME,"B_InterceptAssessMagic");
	if(Npc_CheckInfo(self,1))
	{
		printdebugnpc(PD_ZS_CHECK,"...wichtige Info zu vergeben!");
		hero.aivar[AIV_IMPORTANT] = TRUE;
		b_fullstop(self);
		AI_StartState(self,zs_talk,1,"");
		return;
	}
	else
	{
		b_fullstop(self);
		b_assessmagic();
	};
};

