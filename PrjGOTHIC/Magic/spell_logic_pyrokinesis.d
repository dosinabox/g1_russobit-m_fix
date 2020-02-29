
func int spell_logic_pyrokinesis(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Pyrokinesis");
	if(Npc_IsDead(other) || Npc_IsInState(other,zs_unconscious) || (other.guild == GIL_SLF) || (other.guild == GIL_DEMON) || (other.guild == GIL_GOLEM) || (other.guild == GIL_SKELETON) || (other.guild == GIL_ZOMBIE))
	{
		return SPL_SENDSTOP;
	};
	if(manainvested >= 1)
	{
		return SPL_NEXTLEVEL;
	};
	return SPL_RECEIVEINVEST;
};

