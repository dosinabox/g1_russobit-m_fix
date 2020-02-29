
func int spell_logic_control(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Control");
	if(!Npc_IsInState(other,zs_controlled))
	{
		printdebugnpc(PD_MAGIC,"npc is valid...");
		printdebugnpc(PD_MAGIC,"manainvested 0...starting ZS_PsiDefense on npc");
		Npc_ChangeAttribute(self,ATR_MANA,-1);
		if(!Npc_IsInState(other,zs_psidefense))
		{
			b_fullstop(other);
			AI_StartState(other,zs_psidefense,1,"");
		};
		if(other.flags != NPC_FLAG_IMMORTAL)
		{
			printdebugnpc(PD_MAGIC,"npc is not immortal, sub mana");
			if(manainvested >= other.level)
			{
				printdebugnpc(PD_MAGIC,"controlled success, starting states");
				AI_StartState(self,zs_pc_controlling,0,"");
				Npc_SetActiveSpellInfo(self,1);
				Npc_ChangeAttribute(self,ATR_MANA,+1);
				return SPL_SENDCAST;
			};
			return SPL_NEXTLEVEL;
		}
		else
		{
			if(manainvested >= 1)
			{
				printdebugnpc(PD_MAGIC,"npc is immortal");
				b_sayoverlay(self,other,"$AARGH_1");
				AI_PlayAni(self,"T_PSI_VICTIM");
				AI_Wait(self,3.5);
				return SPL_DONTINVEST;
			};
		};
		return SPL_NEXTLEVEL;
	}
	else
	{
		printdebugnpc(PD_MAGIC,"npc is not valid...");
		return SPL_SENDSTOP;
	};
	return SPL_DONTINVEST;
};

