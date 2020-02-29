
func void b_stopmagicfreeze()
{
	printdebugnpc(PD_MAGIC,"B_StopMagicFreeze");
	printglobals(PD_MAGIC);
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

func void zs_magicfreeze()
{
	printdebugnpc(PD_MAGIC,"ZS_MagicFreeze");
	printglobals(PD_MAGIC);
	//Npc_PercEnable(self,PERC_ASSESSMAGIC,zs_magicfreeze);
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
	};
	if(self.attribute[ATR_HITPOINTS] > ((SPL_FREEZE_DAMAGE + 1) - self.protection[PROT_MAGIC]))
	{
		b_magichurtnpc(other,SPL_FREEZE_DAMAGE);
	};
};

func int zs_magicfreeze_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_MagicFreeze_Loop");
	if(Npc_GetStateTime(self) > SPL_TIME_FREEZE)
	{
		b_stopmagicfreeze();
		return LOOP_END;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_magicfreeze_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MagicFreeze_End");
};

