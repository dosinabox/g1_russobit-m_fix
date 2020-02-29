
func int spell_logic_trf_molerat(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_MOLERAT)
	{
		Npc_SetActiveSpellInfo(self,molerat);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

