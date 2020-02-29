
func int spell_logic_trf_waran(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_WARAN)
	{
		Npc_SetActiveSpellInfo(self,waran);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

