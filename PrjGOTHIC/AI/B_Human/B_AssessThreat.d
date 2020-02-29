
func void b_assessthreat()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessThreat");
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann Bedrohung sehen!");
		if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
		{
			b_sayoverlay(self,other,"$WATCHYOURAIM");
			Npc_SetTempAttitude(self,ATT_NEUTRAL);
		}
		else if(Npc_GetAttitude(self,other) == ATT_NEUTRAL)
		{
			b_sayoverlay(self,other,"$WATCHYOURAIMANGRY");
			Npc_SetTempAttitude(self,ATT_ANGRY);
		}
		else if(Npc_GetAttitude(self,other) == ATT_ANGRY)
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			AI_StartState(self,zs_assessenemy,0,"");
			return;
		};
		Npc_PercDisable(self,PERC_ASSESSTHREAT);
	};
};

