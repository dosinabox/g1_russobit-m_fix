
func void b_orc_assesssomethingevil()
{
	var int att;
	printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessSomethingEvil");
	Npc_PercDisable(self,PERC_ASSESSTHREAT);
	if(other.guild < GIL_SEPERATOR_ORC)
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessSomethingEvil: other ist Nicht-Ork");
		att = Npc_GetPermAttitude(self,other);
		if(att == ATT_ANGRY)
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		}
		else if(att == ATT_NEUTRAL)
		{
			Npc_SetTempAttitude(self,ATT_ANGRY);
		}
		else if(att == ATT_FRIENDLY)
		{
			Npc_SetTempAttitude(self,ATT_NEUTRAL);
		};
	};
};

