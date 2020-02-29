
func void b_stopzapped()
{
	printdebugnpc(PD_MAGIC,"B_StopZapped");
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

func void zs_zapped()
{
	printdebugnpc(PD_MAGIC,"ZS_Zapped");
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stopzapped);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		printdebugnpc(PD_MAGIC,"bodystate not interuptable, standing up...");
		AI_Standup(self);
	};
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious) && !c_bodystatecontains(self,BS_SWIM) && !c_bodystatecontains(self,BS_DIVE))
	{
		printdebugnpc(PD_MAGIC,"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
};

func int zs_zapped_loop()
{
	printdebugnpc(PD_MAGIC,"ZS_Zapped_Loop");
	b_magichurtnpc(other,SPL_ZAPPED_DAMAGE_PER_SEC);
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_zapped_end()
{
	printdebugnpc(PD_MAGIC,"ZS_Zapped_End");
};

