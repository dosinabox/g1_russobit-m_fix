
func int spell_logic_new1(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Destroyer");
	if(manainvested >= SPL_SENDCAST_NEW1)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

