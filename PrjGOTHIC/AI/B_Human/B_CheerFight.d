
func void b_cheerfight()
{
	printdebugnpc(PD_ZS_FRAME,"B_CheerFight");
	if(Npc_GetStateTime(self) > 5)
	{
		Npc_SetStateTime(self,0);
		if(npc_gettempattitude(self,victim) == ATT_FRIENDLY)
		{
			printdebugnpc(PD_ZS_CHECK,"B_CheerFight // Friendly victim");
			if((npc_gettempattitude(self,other) == ATT_NEUTRAL) || (npc_gettempattitude(self,other) == ATT_ANGRY))
			{
				printdebugnpc(PD_ZS_CHECK,"B_CheerFight // Friendly victim // neutral Attacker");
				b_say(self,NULL,"$OOH");
				AI_PlayAni(self,"T_WATCHFIGHT_OHNO");
			}
			else if(npc_gettempattitude(self,other) == ATT_FRIENDLY)
			{
				printdebugnpc(PD_ZS_CHECK,"B_CheerFight // Friendly victim // friendly Attacker");
				b_say(self,NULL,"$CHEERFIGHT");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"B_CheerFight // No Friendly victim");
			if(npc_gettempattitude(self,other) == ATT_FRIENDLY)
			{
				printdebugnpc(PD_ZS_CHECK,"B_CheerFight // No Friendly victim // friendly aggressor");
				b_say(self,NULL,"$CHEERFRIEND");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"B_CheerFight // NO Friendly victim //  NO friendly aggressor");
				b_say(self,NULL,"$CHEERFIGHT");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
			};
		};
	};
};

