
func void zs_listen()
{
	printdebugnpc(PD_TA_FRAME,"ZS_LISTEN");
	self.aivar[AIV_FOUNDPERSON] = FALSE;
	occupiedperception();
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_listen_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_LISTEN");
	if(self.aivar[AIV_FOUNDPERSON] == FALSE)
	{
		printdebugnpc(PD_TA_CHECK,"...bisher keinen Redner gefunden...!");
		b_gotofp(self,"LISTEN");
		Npc_PerceiveAll(self);
		if(Wld_DetectNpc(self,-1,zs_teaching,-1))
		{
			printdebugnpc(PD_TA_CHECK,"...aber JETZT einen Redner gefunden...!");
			if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
			{
				printdebugnpc(PD_TA_CHECK,"...der nah genug ist!");
				AI_TurnToNPC(self,other);
				AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
				c_lookatnpc(self,other);
				self.aivar[AIV_FOUNDPERSON] = TRUE;
			};
		};
	};
	AI_Wait(self,1);
};

func void zs_listen_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Listen_End");
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
		c_stoplookat(self);
	};
};

