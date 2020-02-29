
func int spell_logic_shrink(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Shrink");
	if(c_npcismonster(other) && (other.aivar[AIV_WASDEFEATEDBYSC] == 0))
	{
		printdebugnpc(PD_MAGIC,"...Ziel ist Monster!");
		if(manainvested >= SPL_SENDCAST_SHRINK)
		{
			Npc_SendSinglePerc(self,other,PERC_ASSESSMAGIC);
			return SPL_SENDCAST;
		};
		return SPL_NEXTLEVEL;
	}
	else
	{
		printdebugnpc(PD_MAGIC,"...Ziel ist KEIN Monster!");
		return SPL_SENDSTOP;
	};
};

