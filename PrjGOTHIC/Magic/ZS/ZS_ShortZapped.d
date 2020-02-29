
func void b_stopshortzapped()
{
	printdebugnpc(PD_MAGIC,"B_StopShortZapped");
	Npc_PercDisable(self,PERC_ASSESSSTOPMAGIC);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(c_npcishuman(self) || c_npcisorc(self))
	{
		AI_StartState(self,zs_reacttodamage,0,"");
	}
	else if(c_npcismonster(self))
	{
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

func int zs_shortzapped()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ShortZapped");
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		printdebugnpc(PD_MAGIC,"bodystate not interuptable, standing up...");
		AI_Standup(self);
	};
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious) && !c_bodystatecontains(self,BS_SWIM) && !c_bodystatecontains(self,BS_DIVE))
	{
		printdebugnpc(PD_MAGIC,"...NSC ist nicht bewußtlos / tot / schwimmend / tauchend");
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
};

func int zs_shortzapped_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ShortZapped Loop");
	if(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)
	{
		b_stopshortzapped();
	};
	AI_Wait(self,1);
};

func void zs_shortzapped_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ShortZapped_End");
};

