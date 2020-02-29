
func void b_assessusemob()
{
	var string detectedmob;
	printdebugnpc(PD_ZS_FRAME,"B_AssessUseMob");
	detectedmob = Npc_GetDetectedMob(other);
	printdebugnpc(PD_ZS_CHECK,detectedmob);
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
		{
			printdebugnpc(PD_ZS_CHECK,"...MOB gehört NSC oder seiner Gilde!");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (self.guild == other.guild))
			{
				printdebugnpc(PD_ZS_CHECK,"...Manipulator ist FRIENDLY oder in gleicher Gilde!");
				b_say(self,other,"$HandsOff");
			}
			else
			{
				printglobals(PD_ZS_CHECK);
				Npc_SetTempAttitude(self,ATT_HOSTILE);
				Npc_ClearAIQueue(self);
				b_whirlaround(self,other);
				b_sayoverlay(self,other,"$IWillTeachYouRespectForForeignProperty");
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

