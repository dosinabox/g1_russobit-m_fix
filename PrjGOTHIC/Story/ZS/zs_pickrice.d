
func void zs_pickrice()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PickRice");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PICKRICE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PICKRICE"))
	{
		AI_GotoFP(self,"PICKRICE");
		AI_AlignToFP(self);
	};
	self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
};

func void zs_pickrice_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_PickRice_Loop");
	if((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && Hlp_Random(2))
	{
		printdebugnpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if(Npc_IsOnFP(self,"PICKRICE_1") && Wld_IsFPAvailable(self,"PICKRICE_1"))
		{
			printdebugnpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP(self,"PICKRICE_1");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE_2") && Wld_IsFPAvailable(self,"PICKRICE_2"))
		{
			printdebugnpc(PD_TA_DETAIL,"Platzwechsel auf Level 2");
			AI_GotoNextFP(self,"PICKRICE_2");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE_3") && Wld_IsFPAvailable(self,"PICKRICE_3"))
		{
			printdebugnpc(PD_TA_DETAIL,"Platzwechsel auf Level 3");
			AI_GotoNextFP(self,"PICKRICE_3");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE"))
		{
			printdebugnpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	}
	else if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		printdebugnpc(PD_TA_DETAIL,"PickRice Bücken");
		if(Npc_IsOnFP(self,"PICKRICE"))
		{
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	};
	if(!Npc_IsOnFP(self,"PICKRICE") && Wld_IsFPAvailable(self,"PICKRICE"))
	{
		AI_GotoFP(self,"PICKRICE");
	};
	AI_Wait(self,1);
};

func void zs_pickrice_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PickRice_End");
};

