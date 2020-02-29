
func int spell_logic_trf_crawler(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_CRAWLER)
	{
		Npc_SetActiveSpellInfo(self,minecrawler);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

