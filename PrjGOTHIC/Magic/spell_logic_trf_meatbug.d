
func int spell_logic_trf_meatbug(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_MEATBUG)
	{
		Npc_SetActiveSpellInfo(self,meatbug);
		if(Npc_KnowsInfo(hero,info_gorn_ruinwall))
		{
			TRF_MEATBUG_USED = TRUE;
		};
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

