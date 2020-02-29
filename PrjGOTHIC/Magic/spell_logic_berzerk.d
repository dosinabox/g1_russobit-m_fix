
func int spell_logic_berzerk(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Berzerk");
	if((other.guild == GIL_SLF) || (other.guild == GIL_TROLL) || (other.guild == GIL_DEMON) || (other.guild == GIL_GOLEM) || (other.guild == GIL_SKELETON) || (other.guild == GIL_ZOMBIE))
	{
		printdebugnpc(PD_MAGIC,"...Ziel immun!");
		return SPL_SENDSTOP;
	}
	else if(manainvested >= SPL_SENDCAST_BERZERK)
	{
		Npc_SendSinglePerc(self,other,PERC_ASSESSMAGIC);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_RECEIVEINVEST;
	};
};

