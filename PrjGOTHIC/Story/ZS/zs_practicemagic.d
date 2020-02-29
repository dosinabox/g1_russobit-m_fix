
func void zs_practicemagic()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeMagic");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PRACTICEMAGIC"))
	{
		AI_GotoFP(self,"PRACTICEMAGIC");
		AI_AlignToFP(self);
	};
	self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
};

func void zs_practicemagic_loop()
{
	var int magereaktion;
	printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
	magereaktion = Hlp_Random(100);
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop Freq");
		if(magereaktion <= 25)
		{
			printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni(self,"T_PRACTICEMAGIC");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
			Npc_SetStateTime(self,0);
		}
		else if(magereaktion <= 50)
		{
			printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni(self,"T_PRACTICEMAGIC2");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
			Npc_SetStateTime(self,0);
		}
		else if(magereaktion <= 70)
		{
			printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni(self,"T_PRACTICEMAGIC3");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
			Npc_SetStateTime(self,0);
		}
		else if(magereaktion <= 90)
		{
			printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni(self,"T_PRACTICEMAGIC4");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
			Npc_SetStateTime(self,0);
		}
		else if(magereaktion <= 100)
		{
			printdebugnpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni(self,"R_SCRATCHHEAD");
			self.aivar[AIV_ITEMFREQ] = Hlp_Random(6) + 4;
			Npc_SetStateTime(self,0);
		};
	};
	AI_Wait(self,1);
};

func void zs_practicemagic_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeMagic_End");
};

