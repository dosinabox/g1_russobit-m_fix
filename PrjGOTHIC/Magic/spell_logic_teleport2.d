
func int spell_logic_teleport2(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Teleport2");
	if(manainvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,"NC_KDW_CAVE_CENTER");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		KDW_TP_USED = TRUE;
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

