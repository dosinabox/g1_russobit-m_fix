
func int spell_logic_stormfist(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Stormfist");
	if((manainvested >= 1) && (manainvested < SPL_SENDCAST_STORMFIST))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_STORMFIST)
	{
		Npc_ChangeAttribute(self,ATR_MANA,+1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

