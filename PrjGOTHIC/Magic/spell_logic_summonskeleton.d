
func int spell_logic_summonskeleton(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_SummonSkeleton");
	if(manainvested >= SPL_SENDCAST_SUMMONSKELETON)
	{
		if(Npc_IsPlayer(self))
		{
			Wld_SpawnNpcRange(self,summonedbypc_skeleton,2,500);
			Wld_SpawnNpcRange(self,summonedbypc_skeletonwarrior,1,500);
		}
		else
		{
			Wld_SpawnNpcRange(self,summonedbynpc_skeleton,2,500);
			Wld_SpawnNpcRange(self,summonedbynpc_skeletonwarrior,1,500);
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_NEXTLEVEL;
	};
};

