
func int g_cansteal()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET))
	{
		if(other.npctype != NPCTYPE_FRIEND)
		{
			return TRUE;
		}
		else
		{
			PrintScreen(_STR_MESSAGE_CANNOTSTEAL,-1,_YPOS_MESSAGE_CANNOTSTEAL,_STR_FONT_ONSCREEN,_TIME_MESSAGE_CANNOTSTEAL);
		};
	}
	else
	{
		PrintScreen("Я не умею обшаривать чужие карманы.",-1,10,"FONT_OLD_10_WHITE.TGA",3);
	};
	return FALSE;
};

