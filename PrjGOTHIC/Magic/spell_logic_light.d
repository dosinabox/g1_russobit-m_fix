
func int spell_logic_light(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Light");
	if(manainvested >= SPL_SENDCAST_LIGHT)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

