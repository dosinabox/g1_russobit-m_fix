
func int spell_logic_trf_wolf(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_WOLF)
	{
		Npc_SetActiveSpellInfo(self,wolf);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

