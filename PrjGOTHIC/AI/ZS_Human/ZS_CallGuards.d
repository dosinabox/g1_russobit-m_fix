
func void zs_callguards()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_CallGuards");
	printglobals(PD_ZS_FRAME);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	b_smartturntonpc(self,hero);
	b_sayoverlay(self,hero,"$ALARM");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,hero);
	AI_StartState(self,zs_flee,0,"");
};

func void zs_callguardsonenterroom()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_CallGuardsOnEnterRoom");
	printglobals(PD_ZS_FRAME);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	b_smartturntonpc(self,hero);
	b_sayoverlay(self,hero,"$ALARM");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,hero);
};

