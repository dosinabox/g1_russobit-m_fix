
func void g_cannottrade()
{
	PrintScreen(_STR_MESSAGE_TRADE_FAILURE,-1,65,"font_old_10_white.tga",2);
	var C_NPC trader;
	trader = Hlp_GetNpc(hero.aivar[AIV_LASTTARGET]);
	b_say(trader,hero,"$YOUWANNAFOOLME");
};

