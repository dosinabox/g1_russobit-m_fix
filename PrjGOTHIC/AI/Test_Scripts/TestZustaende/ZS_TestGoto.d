
func void zs_testgotowp()
{
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	printdebugs("ZS_TestGoto");
	AI_GotoWP(self,self.wp);
};

func void zs_testgotowp_loop()
{
	var C_NPC player;
	Npc_SetTarget(self,hero);
	printglobals(PD_ZS_FRAME);
	Npc_GetTarget(self);
	AI_GotoNpc(self,other);
	AI_Wait(self,3);
};

func void zs_testgotowp_end()
{
};

