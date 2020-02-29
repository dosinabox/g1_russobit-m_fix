
func int spell_logic_thunderbolt(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Thunderbolt");
	if(manainvested >= SPL_SENDCAST_THUNDERBOLT)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

