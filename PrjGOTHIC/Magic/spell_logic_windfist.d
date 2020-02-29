
func int spell_logic_windfist(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Windfist");
	if((manainvested >= 1) && (manainvested < SPL_SENDCAST_WINDFIST))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_WINDFIST)
	{
		Npc_ChangeAttribute(self,ATR_MANA,+1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

