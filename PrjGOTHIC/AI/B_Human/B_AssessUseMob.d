
func void b_assessusemob()
{
	var string detectedmob;
	printdebugnpc(PD_ZS_FRAME,"B_AssessUseMob");
	detectedmob = Npc_GetDetectedMob(other);
	printdebugnpc(PD_ZS_CHECK,detectedmob);
	var C_NPC sld1;
	var C_NPC sld2;
	sld1 = Hlp_GetNpc(sld_723_soeldner);
	sld2 = Hlp_GetNpc(sld_732_soeldner);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld2)))
	{
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
		{
			printdebugnpc(PD_ZS_CHECK,"...MOB gehört NSC oder seiner Gilde!");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (self.guild == other.guild))
			{
				printdebugnpc(PD_ZS_CHECK,"...Manipulator ist FRIENDLY oder in gleicher Gilde!");
				if((self.flags != NPC_FLAG_IMMORTAL))
				{
					b_say(self,other,"$HandsOff");
				};
			}
			else
			{
				printglobals(PD_ZS_CHECK);
				Npc_SetTempAttitude(self,ATT_HOSTILE);
				Npc_ClearAIQueue(self);
				b_whirlaround(self,other);
				//db_say(self,other,"IWillTeachYouRespectForForeignProperty");
				b_say(self,other,"$IWillTeachYouRespectForForeignProperty");
				AI_SetWalkMode(self,NPC_RUN);
				Npc_SetTarget(self,other);
				AI_StartState(self,zs_attack,0,"");
			};
		}
		else
		{
			printdebugnpc(PD_ZS_DETAIL,"not my MoB");
		};
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"kann SC nicht sehen");
	};
};

