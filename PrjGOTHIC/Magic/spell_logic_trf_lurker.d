
func int spell_logic_trf_lurker(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_LURKER)
	{
		Npc_SetActiveSpellInfo(self,lurker);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

