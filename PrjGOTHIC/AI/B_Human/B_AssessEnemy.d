
func void b_assessenemy()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessEnemy");
	printglobals(PD_ZS_CHECK);
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(c_npcishuman(other))
		{
			printdebugnpc(PD_ZS_FRAME,"...Feind ist Mensch!");
			if(self.aivar[AIV_TALKBEFOREATTACK])
			{
				printdebugnpc(PD_ZS_CHECK,"...'letzte Nachricht' für den Feind!");
				if(b_checkforimportantinfo(self,other))
				{
					return;
				};
			};
			if(c_npctypeisfriend(self,other) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!");
				return;
			};
			if(c_otheristoleratedenemy(self,other))
			{
				printdebugnpc(PD_ZS_CHECK,"...Feind wird toleriert!");
				b_tolerateenemy(self,other);
				return;
			};
			if(other.aivar[AIV_INVINCIBLE])
			{
				printdebugnpc(PD_ZS_CHECK,"...Feind spricht gerade!");
				AI_ContinueRoutine(self);
				return;
			};
			if(Npc_IsInCutscene(other))
			{
				printdebugnpc(PD_ZS_CHECK,"...Feind ist in Cutscene!");
				return;
			};
			b_fullstop(self);
			AI_StartState(self,zs_assessenemy,0,"");
		}
		else if(c_npcisorc(other) && (other.guild != gil_orcslave) && (other.npctype != NPCTYPE_MAIN) && (other.npctype != NPCTYPE_FRIEND))
		{
			b_fullstop(self);
			AI_StartState(self,zs_assessmonster,0,"");
			return;
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"... 'enemy' ist Monster/Orc!");
			if((Npc_GetDistToNpc(self,other) < HAI_DIST_ASSESS_MONSTER) && c_npcisdangerousmonster(self,other))
			{
				b_fullstop(self);
				AI_StartState(self,zs_assessmonster,0,"");
				return;
			};
		};
	};
};

