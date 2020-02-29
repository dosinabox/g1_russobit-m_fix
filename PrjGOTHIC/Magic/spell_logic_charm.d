
func int spell_logic_charm(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Charm");
	if(manainvested >= SPL_SENDCAST_CHARM)
	{
		Npc_SendSinglePerc(self,other,PERC_ASSESSMAGIC);
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

