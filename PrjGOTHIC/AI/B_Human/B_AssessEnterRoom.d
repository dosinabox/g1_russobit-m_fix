
func void b_assessenterroom()
{
	var int self_guild;
	var int portalguild;
	var int formerportalguild;
	printdebugnpc(PD_ZS_FRAME,"B_AssessEnterRoom");
	self_guild = self.guild;
	printglobals(PD_ZS_CHECK);
	portalguild = Wld_GetPlayerPortalGuild();
	printguild(PD_ZS_CHECK,portalguild);
	formerportalguild = Wld_GetFormerPlayerPortalGuild();
	printguild(PD_ZS_CHECK,formerportalguild);
	if(!c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_CHECK,"Monster betritt Raum!");
		b_fullstop(self);
		AI_StartState(self,zs_assessmonster,0,"");
	};
	if(!Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC betritt Raum!");
		return;
	};
	if((self.npctype == NPCTYPE_FRIEND) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY");
		return;
	};
	if(Npc_CanSeeNpc(self,other) || (!c_bodystatecontains(other,BS_SNEAK) && (Npc_GetDistToNpc(self,other) < HAI_DIST_HEARROOMINTRUDER)))
	{
		printdebugnpc(PD_ZS_CHECK,"...Nsc sieht/h�rt Eindringling!");
		if(c_npcisguard(self))
		{
			printdebugnpc(PD_ZS_CHECK,"...Nsc ist Wache!");
			if((portalguild != GIL_NONE) && (Wld_GetGuildAttitude(self_guild,portalguild) == ATT_FRIENDLY))
			{
				printdebugnpc(PD_ZS_CHECK,"...betretener Portalraum geh�rt Sch�tzling-Gilde!");
				b_fullstop(self);
				AI_StartState(self,zs_clearroom,0,"");
			}
			else if((formerportalguild != GIL_NONE) && (Wld_GetGuildAttitude(self_guild,formerportalguild) == ATT_FRIENDLY))
			{
				printdebugnpc(PD_ZS_CHECK,"...verlassener Portalraum geh�rt Sch�tzling-Gilde!");
				b_fullstop(self);
				b_whirlaround(self,other);
				AI_PointAtNpc(self,other);
				b_say(self,other,"$HEYYOU");
				AI_StopPointAt(self);
				Npc_PercDisable(self,PERC_MOVENPC);
				AI_SetWalkMode(self,NPC_RUN);
				AI_GotoNpc(self,other);
				b_say(self,other,"$WHATDIDYOUINTHERE");
			};
		}
		else if(c_npcisguardarcher(self))
		{
			printdebugnpc(PD_ZS_CHECK,"...ich bin Fernkampfwache und ignoriere R�ume betreten grunds�tzlich!");
			Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
			AI_ContinueRoutine(self);
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Nsc ist KEINE Wache!");
			if((Npc_GetDistToNpc(self,other) < HAI_DIST_CLEARROOM) && (portalguild != GIL_NONE) && ((self_guild == portalguild) || (Wld_GetGuildAttitude(self_guild,portalguild) == ATT_FRIENDLY)))
			{
				printdebugnpc(PD_ZS_CHECK,"...SC nah & betretener Portalraum geh�rt Gilde des NSCs");
				b_fullstop(self);
				AI_StartState(self,zs_clearroom,0,"");
				return;
			};
			if((Npc_GetDistToNpc(self,other) < HAI_DIST_CLEARROOM) && (formerportalguild != GIL_NONE) && ((self_guild == formerportalguild) || (Wld_GetGuildAttitude(self_guild,formerportalguild) == ATT_FRIENDLY)))
			{
				printdebugnpc(PD_ZS_CHECK,"...SC nah & SC verl��t eigenen Portalraum");
				b_fullstop(self);
				b_whirlaround(self,other);
				AI_PointAtNpc(self,other);
				b_say(self,other,"$HEYYOU");
				AI_StopPointAt(self);
				Npc_PercDisable(self,PERC_MOVENPC);
				AI_SetWalkMode(self,NPC_RUN);
				AI_GotoNpc(self,other);
				b_say(self,other,"$WHATDIDYOUINTHERE");
			};
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann den Eindringling weder sehen noch h�ren!");
	};
};

