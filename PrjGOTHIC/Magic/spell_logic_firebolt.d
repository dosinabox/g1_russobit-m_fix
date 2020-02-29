
func int spell_logic_firebolt(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Firebolt");
	if(manainvested >= SPL_SENDCAST_FIREBOLT)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

