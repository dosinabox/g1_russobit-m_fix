
func int spell_logic_summongolem(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_SummonGolem");
	if(manainvested >= SPL_SENDCAST_SUMMONGOLEM)
	{
		if(Npc_IsPlayer(self))
		{
			Wld_SpawnNpcRange(self,summonedbypc_stonegolem,1,500);
		}
		else
		{
			Wld_SpawnNpcRange(self,summonedbynpc_stonegolem,1,500);
		};
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

