
func void zs_psidefense()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_PsiDefense");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stoppsidefense);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		printdebugnpc(PD_MAGIC,"bodystate not interuptable, standing up...");
		AI_Standup(self);
	};
};

func void zs_psidefense_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_PsiDefense Loop");
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious) && !c_bodystatecontains(self,BS_SWIM) && !c_bodystatecontains(self,BS_DIVE))
	{
		printdebugnpc(PD_MAGIC,"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni(other,"S_CON_VICTIM");
	};
};

func void zs_psidefense_end()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_PsiDefense End");
};

func void b_stoppsidefense()
{
	printdebugnpc(PD_ZS_FRAME,"B_StopPsiDefense");
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious))
	{
		b_fullstop(self);
		AI_StartState(self,zs_assessenemy,1,"");
	};
};

