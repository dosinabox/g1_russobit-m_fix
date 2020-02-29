
func int g_cansteal()
{
	if((other.npctype != NPCTYPE_FRIEND) && (other.npctype != NPCTYPE_MAIN))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_CANNOTSTEAL,-1,_YPOS_MESSAGE_CANNOTSTEAL,_STR_FONT_ONSCREEN,_TIME_MESSAGE_CANNOTSTEAL);
		return FALSE;
	};
};

