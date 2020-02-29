
func int spell_logic_armyofdarkness(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_ArmyOfDarkness");
	if(manainvested >= SPL_SENDCAST_ARMYOFDARKNESS)
	{
		if(Npc_IsPlayer(self))
		{
			Wld_SpawnNpcRange(self,summonedbypc_skeleton,6,800);
			Wld_SpawnNpcRange(self,summonedbypc_skeletonwarrior,3,800);
		}
		else
		{
			Wld_SpawnNpcRange(self,summonedbynpc_skeleton,6,800);
			Wld_SpawnNpcRange(self,summonedbynpc_skeletonwarrior,3,800);
		};
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

