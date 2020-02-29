
func void zs_wakeup()
{
	var int portalguild;
	printdebugnpc(PD_ZS_FRAME,"ZS_WakeUp");
	AI_UseMob(self,"BED",-1);
	AI_UseMob(self,"BEDLOW",-1);
	AI_UseMob(self,"BEDHIGH",-1);
	b_resetfaceexpression(self);
	c_zsinit();
	b_setperception(self);
	Npc_PercDisable(self,PERC_OBSERVEINTRUDER);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_clearroomenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_clearroomusemob);
	Npc_PercDisable(self,PERC_ASSESSCALL);
	portalguild = Wld_GetPlayerPortalGuild();
	if(((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...Spieler im Raum des NSCs!");
		b_assessenterroom();
	}
	else
	{
		if(Npc_CanSeeNpcFreeLOS(self,other))
		{
			AI_TurnToNPC(self,other);
			b_say(self,other,"$YOUDISTURBEDMYSLUMBER");
		}
		else
		{
			b_lookaround();
			b_say(self,NULL,"$WHATSTHAT");
		};
		AI_Wait(self,3);
		b_observeintruder();
	};
};

