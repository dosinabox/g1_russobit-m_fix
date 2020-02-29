
func void b_stoppyro()
{
	printdebugnpc(PD_ZS_FRAME,"B_StopPyro");
	Npc_PercDisable(self,PERC_ASSESSSTOPMAGIC);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
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

func int zs_pyro()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Pyro");
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stoppyro);
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

func int zs_pyro_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Pyro_Loop");
	b_magichurtnpc(other,SPL_PYRO_DAMAGE_PER_SEC);
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void zs_pyro_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Pyro_End");
};

