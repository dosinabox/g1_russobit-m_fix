
func void zs_meditate()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate");
	//b_setperception(self);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	//Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_movenpc);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE") && !c_bodystatecontains(self,BS_SIT))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE") && !c_bodystatecontains(self,BS_SIT))
	{
		AI_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,zs_teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		b_smartturntonpc(self,other);
	};
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	};
};

func void zs_meditate_loop()
{
	var int praytime;
	printdebugnpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	c_stoplookat(self);
	if(praytime >= 80)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	if(praytime >= 90)
	{
		b_sayoverlay(self,NULL,"$Om");
	};
	AI_Wait(self,1);
};

func void zs_meditate_end()
{
	c_stoplookat(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate_End");
};

