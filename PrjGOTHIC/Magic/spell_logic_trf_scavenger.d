
func int spell_logic_trf_scavenger(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_SCAVENGER)
	{
		Npc_SetActiveSpellInfo(self,scavenger);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

