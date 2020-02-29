
func void b_assessquietsound()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessQuietSound");
	printglobals(PD_ZS_FRAME);
	if(Npc_GetDistToItem(self,item) > PERC_DIST_DIALOG)
	{
		printdebugnpc(PD_ZS_FRAME,"... to far");
		return;
	};
	if(Npc_CanSeeSource(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...kann Geräuschquelle sehen!");
		if(Snd_IsSourceNpc(self))
		{
			printdebugnpc(PD_ZS_CHECK,"...Geräuschquelle ist SC!");
			if(npc_gettempattitude(self,other) == ATT_HOSTILE)
			{
				printdebugnpc(PD_ZS_CHECK,"...SC ist HOSTILE!");
				Npc_ClearAIQueue(self);
				AI_StartState(self,zs_assessenemy,0,"");
			};
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...kann NICHT Geräuschquelle sehen!");
		if(Snd_IsSourceNpc(self))
		{
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_assessquietsound,0,"");
		};
	};
};

