
func void zs_reacttodamage()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ReactToDamage");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_combatassessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_combatassessdefeat);
	b_whirlaround(self,other);
	if(self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		b_specialcombatdamagereaction();
	};
	if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};
	if(!c_npcismonster(other))
	{
		if(Npc_IsPlayer(other))
		{
			self.aivar[AIV_BEENATTACKED] = 1;
			if((npc_gettempattitude(self,other) == ATT_FRIENDLY) || (self.npctype == NPCTYPE_FRIEND))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC FRIENDLY zum Angreifer");
				c_lookatnpc(self,other);
				b_say(self,other,"WHATAREYOUDOING");
				Npc_SetTempAttitude(self,ATT_ANGRY);
				AI_ContinueRoutine(self);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC nicht FRIENDLY zum Angreifer!");
				if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					npc_setpermattitude(self,ATT_ANGRY);
				};
				Npc_SetTempAttitude(self,ATT_HOSTILE);
			};
		};
		AI_StartState(self,zs_assessenemy,0,"");
	}
	else
	{
		AI_StartState(self,zs_assessmonster,0,"");
	};
};

