
func int spell_logic_trf_snapper(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_SNAPPER)
	{
		Npc_SetActiveSpellInfo(self,snapper);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

