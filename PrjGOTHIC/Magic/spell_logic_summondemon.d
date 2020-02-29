
func int spell_logic_summondemon(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_SummonDemon");
	if(manainvested >= SPL_SENDCAST_SUMMONDEMON)
	{
		if(Npc_IsPlayer(self))
		{
			printdebugnpc(PD_MAGIC,"...beschwört von Spieler");
			Wld_SpawnNpcRange(self,summonedbypc_demon,1,1000);
		}
		else
		{
			printdebugnpc(PD_MAGIC,"...beschwört von NSC");
			Wld_SpawnNpcRange(self,summonedbynpc_demon,1,1000);
		};
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

