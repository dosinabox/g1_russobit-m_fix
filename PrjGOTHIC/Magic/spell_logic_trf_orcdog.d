
func int spell_logic_trf_orcdog(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_ORCDOG)
	{
		Npc_SetActiveSpellInfo(self,orcdog);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

