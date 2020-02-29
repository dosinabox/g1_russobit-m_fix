
func int spell_logic_trf_bloodfly(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manainvested >= SPL_SENDCAST_TRF_BLOODFLY)
	{
		Npc_SetActiveSpellInfo(self,bloodfly);
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTER,self,other);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

