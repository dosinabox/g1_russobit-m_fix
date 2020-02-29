
func void zs_erpresser()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Erpresser");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_SetPercTime(self,1);
	AI_GotoWP(self,self.wp);
	if(Wld_IsFPAvailable(self,"FP_"))
	{
		AI_GotoFP(self,"FP_");
		AI_AlignToFP(self);
	};
};

func void zs_erpresser_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Erpresser_Loop");
	if(Npc_GetDistToNpc(self,hero) > 2000)
	{
		self.aivar[AIV_HAS_ERPRESSED] = 0;
	};
	b_smartturntonpc(self,other);
	AI_Wait(self,0.5);
};

func void zs_erpresser_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Erpresser_End");
};

