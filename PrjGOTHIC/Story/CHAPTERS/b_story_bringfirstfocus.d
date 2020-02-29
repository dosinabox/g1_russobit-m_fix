
func void b_story_bringfirstfocus()
{
	var C_NPC nyras;
	CreateInvItem(self,itwrfocusmappsi);
	b_giveinvitems(self,hero,itwrfocusmappsi,1);
	nyras = Hlp_GetNpc(nov_1303_nyras);
	Npc_ExchangeRoutine(nyras,"PrepareRitual");
	AI_ContinueRoutine(nyras);
	nyras.flags = 0;
	CreateInvItem(nyras,focus_1);
	YBERION_BRINGFOCUS = LOG_RUNNING;
};

