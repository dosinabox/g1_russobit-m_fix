
func int spell_logic_thunderball(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Thunderball");
	if((manainvested >= 1) && (manainvested < SPL_SENDCAST_THUNDERBALL))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_THUNDERBALL)
	{
		Npc_ChangeAttribute(self,ATR_MANA,+1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

