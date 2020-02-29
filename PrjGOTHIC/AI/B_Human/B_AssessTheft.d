
func void b_guarditemsassesstheft()
{
	printdebugnpc(PD_ZS_CHECK,"B_GuardItemsAssessTheft");
	if(Npc_IsPlayer(other))
	{
		if(Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim))
		{
			if(Npc_CanSeeNpcFreeLOS(self,other))
			{
				b_sayoverlay(self,other,"$HANDSOFF");
				Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
				if(c_amistronger(self,other))
				{
					AI_Standup(self);
					AI_StartState(self,zs_catchthief,0,"");
				};
			};
		};
	};
};

func void b_assesstheft()
{
	var int other_guild;
	var int self_guild;
	var int item_ownerguild;
	if(self.aivar[AIV_ITEMSCHWEIN] == TRUE)
	{
		b_guarditemsassesstheft();
	};
	printdebugnpc(PD_ZS_CHECK,"B_AssessTheft");
	other_guild = other.guild;
	self_guild = self.guild;
	if(!Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...anderer Nsc hat ein Item aufgehoben");
		return;
	};
	AI_QuickLook(self,other);
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann den Dieb sehen!");
		if(Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"...Item wurde aufgehoben!");
			item_ownerguild = item.ownerguild;
			if(Npc_OwnedByNpc(item,self))
			{
				printdebugnpc(PD_ZS_CHECK,"...Item gehört NSC!");
				Npc_ClearAIQueue(self);
				c_lookatnpc(self,other);
				AI_StartState(self,zs_catchthief,0,"");
				return;
			}
			else if((Wld_GetGuildAttitude(self_guild,item_ownerguild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self_guild,other_guild) != ATT_FRIENDLY))
			{
				b_fullstop(self);
				printdebugnpc(PD_ZS_CHECK,"Gilden-Bes.");
				c_lookatnpc(self,other);
				AI_StartState(self,zs_catchthief,0,"");
				return;
			}
			else if(self.aivar[AIV_WANTEDITEM] == Hlp_GetInstanceID(item))
			{
				b_fullstop(self);
				printdebugnpc(PD_ZS_CHECK,"Wanted Item");
				if(c_amistronger(self,other) && !Wld_DetectItem(self,ITEM_MULTI))
				{
					printdebugnpc(PD_ZS_CHECK,"Wanted Item & Stronger");
					Npc_PerceiveAll(self);
					if(!Wld_DetectNpc(self,-1,zs_getbackitem,-1))
					{
						AI_StartState(self,zs_getbackitem,0,"");
					}
					else
					{
						AI_StartState(self,zs_observeperson,0,"");
					};
				}
				else
				{
					Npc_ClearAIQueue(self);
					AI_QuickLook(self,other);
					b_say(self,other,"$YOUCANKEEPTHECRAP");
					AI_ContinueRoutine(self);
				};
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Taschendiebstahl!");
			if(c_npcishuman(victim) && !c_npcisdown(victim) && ((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) || (Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_NEUTRAL) || (Npc_GetPermAttitude(self,other) == ATT_ANGRY)))
			{
				printdebugnpc(PD_ZS_CHECK,"...Opfer FRIENDLY/NEUTRAL oder Dieb ANGRY");
				b_fullstop(self);
				c_lookatnpc(self,other);
				AI_PointAtNpc(self,other);
				b_say(self,other,"$BEHINDYOU");
				b_assessandmemorize(NEWS_THEFT,NEWS_SOURCE_WITNESS,self,other,victim);
				AI_StopPointAt(self);
				Npc_SendPassivePerc(self,PERC_ASSESSWARN,victim,other);
				AI_StartState(self,zs_observeperson,0,"");
				return;
			};
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann den Dieb NICHT sehen!");
	};
};

