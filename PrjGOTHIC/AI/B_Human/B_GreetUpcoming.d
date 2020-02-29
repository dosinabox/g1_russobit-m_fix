
func void b_greetupcoming()
{
	var int greet;
	printdebugnpc(PD_ZS_FRAME,"B_GreetUpcoming");
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"B_GreetUpcoming see // First");
		if(Npc_CanSeeNpc(other,self))
		{
			printdebugnpc(PD_ZS_CHECK,"B_GreetUpcoming see // Second");
			if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
			{
				printdebugnpc(PD_ZS_CHECK,"B_GreetUpcoming see Dialog");
				b_assesssc();
				b_guildgreetings();
				return;
			};
		};
	};
};

