
func void zs_interceptmadcorkalom()
{
	printdebugnpc(PD_TA_FRAME,"ZS_InterceptMadCorKalom");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessscmadcorkalom);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_interceptmadcorkalomassessdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_interceptmadcorkalomassessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assessscmadcorkalom);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessscmadcorkalom);
	Npc_SetPercTime(self,0.5);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_interceptmadcorkalom_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_InterceptMadCorKalom_Loop");
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_interceptmadcorkalom_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_InterceptMadCorKalom_End");
};

func void b_assessscmadcorkalom()
{
	printdebugnpc(PD_ZS_DETAIL,"B_AssessSCMadCorKalom");
	if(Npc_CheckInfo(self,1))
	{
		printdebugnpc(PD_ZS_CHECK,"...wichtige Info zu vergeben!");
		hero.aivar[AIV_IMPORTANT] = TRUE;
		b_fullstop(self);
		AI_StartState(self,zs_talk,1,"");
		return;
	};
};

func void b_interceptmadcorkalomassessdamage()
{
	printdebugnpc(PD_TA_FRAME,"B_InterceptMadCorKalomAssessDamage");
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

func void b_interceptmadcorkalomassessmagic()
{
	printdebugnpc(PD_TA_FRAME,"B_InterceptMadCorKalomAssessMagic");
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

