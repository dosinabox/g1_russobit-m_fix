
func void zs_iepymonte()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IEPYMONTE");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_iepymonte_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_IEPYMONTE_Loop");
	if(INEXTREMOPLAYING)
	{
		AI_UseMob(self,"MHARP",1);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",1);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",1);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",4);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",1);
		AI_UseMob(self,"MHARP",2);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",4);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",4);
		AI_UseMob(self,"MHARP",5);
		AI_UseMob(self,"MHARP",4);
		AI_UseMob(self,"MHARP",3);
		AI_UseMob(self,"MHARP",-1);
	};
	return LOOP_CONTINUE;
};

func void zs_iepymonte_end()
{
	AI_UseMob(self,"MHARP",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_IEPYMONTE_End");
};

