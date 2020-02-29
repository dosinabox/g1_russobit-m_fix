
func int spell_logic_trf_shadowbeast(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_SHADOWBEAST)
	{
		Npc_SetActiveSpellInfo(self,shadowbeast);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

