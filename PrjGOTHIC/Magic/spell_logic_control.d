
func int spell_logic_control(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Control");
	if(!Npc_IsInState(other,zs_controlled))
	{
		printdebugnpc(PD_MAGIC,"npc is valid...");
		printdebugnpc(PD_MAGIC,"manainvested 0...starting ZS_PsiDefense on npc");
		if(!Npc_IsInState(other,zs_psidefense))
		{
			b_fullstop(other);
			AI_StartState(other,zs_psidefense,1,"");
		};
		if(other.flags != NPC_FLAG_IMMORTAL)
		{
			printdebugnpc(PD_MAGIC,"npc is not immortal, sub mana");
			if(manainvested >= (other.level * 2))
			{
				printdebugnpc(PD_MAGIC,"controlled success, starting states");
				AI_StartState(self,zs_pc_controlling,0,"");
				Npc_SetActiveSpellInfo(self,1);
				return SPL_SENDCAST;
			};
			return SPL_NEXTLEVEL;
		}
		else
		{
			printdebugnpc(PD_MAGIC,"npc is immortal");
			return SPL_NEXTLEVEL;
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

