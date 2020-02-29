
func int spell_logic_breathofdeath(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_BreathOfDeath");
	if(manainvested >= SPL_SENDCAST_BREATHOFDEATH)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

