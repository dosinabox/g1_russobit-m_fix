
func int spell_logic_chainlightning(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_ChainLightning");
	if(manainvested >= 1)
	{
		return SPL_NEXTLEVEL;
	};
	return SPL_RECEIVEINVEST;
};

