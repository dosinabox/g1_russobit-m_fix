
func void zs_meditate()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE"))
	{
		AI_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,zs_teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		b_smartturntonpc(self,other);
	};
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};

func void zs_meditate_loop()
{
	var int praytime;
	printdebugnpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	if(praytime <= 2)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	if(praytime >= 98)
	{
		AI_Output(self,NULL,"ZS_Meditate_Om");	//
	};
	AI_Wait(self,1);
};

func void zs_meditate_end()
{
	c_stoplookat(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate_End");
};

