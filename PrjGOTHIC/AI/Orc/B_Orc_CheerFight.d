
func void b_orc_cheerfight()
{
	var int h;
	printdebugnpc(PD_ORC_FRAME,"B_Orc_CheerFight");
	h = Hlp_Random(20);
	if((npc_gettempattitude(self,victim) == ATT_FRIENDLY) || (victim.guild > GIL_SEPERATOR_ORC))
	{
		printdebugnpc(PD_ORC_CHECK,"B_Orc_CheerFight: Opfer ist mein Freund/Ork -> Trauer");
		b_say(self,NULL,"$OOH");
		if(h < 6)
		{
			AI_PlayAni(self,"T_FRIGHTENED");
		};
	}
	else
	{
		printdebugnpc(PD_ORC_CHECK,"B_Orc_CheerFight: Opfer ist nicht mein Freund -> Freude");
		b_say(self,NULL,"$CHEERFIGHT");
		if(h < 6)
		{
			AI_PlayAni(self,"T_HAPPY");
		};
	};
};

