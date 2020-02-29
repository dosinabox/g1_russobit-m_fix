
func void b_movemob()
{
	var string door;
	door = Npc_GetDetectedMob(self);
	if(Hlp_StrCmp(door,"DOOR"))
	{
		if(Wld_GetMobState(self,door) == 0)
		{
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
			AI_UseMob(self,door,-1);
		};
	}
	else
	{
		return;
	};
	if(Npc_IsInState(self,zs_babe_flee) || Npc_IsInState(self,zs_flee) || Npc_IsInState(self,zs_attack) || Npc_IsInState(self,zs_clearroom) || Npc_IsInState(self,zs_clearroomwait))
	{
	}
	else
	{
		AI_ContinueRoutine(self);
	};
	//PrintDebugNpc(PD_ZS_FRAME,"B_MoveMob");
	//b_removeweapon(self);
	//Npc_ClearAIQueue(self);
	//AI_StartState(self,ZS_WaitForPassage,0,"");
	//var string door;
	//door = Npc_GetDetectedMob(self);
	//printdebugnpc(PD_ZS_CHECK,ConcatStrings("...mob: ",door));
	//if(Hlp_StrCmp(door,"DOOR"))
	//{
		//printdebugnpc(PD_ZS_CHECK,"...mob is a door!");
		//if(self.aivar[AIV_MOVINGMOB] == 0)
		//{
			//printdebugnpc(PD_ZS_CHECK,"...Türe wurde noch NICHT versucht zu öffnen!");
			//self.aivar[AIV_MOVINGMOB] = 1;
			//Npc_ClearAIQueue(self);
			//AI_UseMob(self,door,1);
		//}
		//else
		//{
			//printdebugnpc(PD_ZS_CHECK,"...Türe wird schon versucht zu öffnen -> geht wohl nicht!");
			//Npc_PercDisable(self,PERC_MOVEMOB);
			//self.aivar[AIV_MOVINGMOB] = 0;
			//AI_StartState(self,zs_waitforpassage,0,"");
		//};
	//};
};

