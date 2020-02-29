
func void b_guildgreetings()
{
	printdebugnpc(PD_ZS_FRAME,"B_GuilGreetings");
	if(c_npcishuman(other) && ((self.guild == GIL_GUR) || (self.guild == GIL_NOV) || (self.guild == GIL_TPL)) && (npc_gettempattitude(self,other) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"B_GuilGreetings Guru");
		b_say(self,other,"$SECTGREETINGS");
	}
	else if(((other.guild == GIL_EBR) || (other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_VLK)) && ((self.guild == GIL_GRD) || (self.guild == GIL_STT) || (self.guild == GIL_VLK)) && ((npc_gettempattitude(self,other) == ATT_FRIENDLY) || (npc_gettempattitude(self,other) == ATT_NEUTRAL)))
	{
		printdebugnpc(PD_ZS_CHECK,"B_GuilGreetings OC both");
		b_say(self,other,"$ALGREETINGS");
	}
	else if(((other.guild == GIL_KDF) || (other.guild == GIL_KDW)) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW)) && ((npc_gettempattitude(self,other) == ATT_FRIENDLY) || (npc_gettempattitude(self,other) == ATT_NEUTRAL)))
	{
		printdebugnpc(PD_ZS_CHECK,"B_GuilGreetings NC both");
		b_say(self,other,"$MAGEGREETINGS");
	}
	else if(npc_gettempattitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ZS_CHECK,"B_GuilGreetings friend");
		b_say(self,other,"$FRIENDLYGREETINGS");
	};
};

