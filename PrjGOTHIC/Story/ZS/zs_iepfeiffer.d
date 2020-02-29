
func void zs_iepfeiffer()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IEPFEIFFER");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_iepfeiffer_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_IEPFEIFFER_Loop");
	if(INEXTREMOPLAYING)
	{
		AI_UseMob(self,"MPIPE",1);
		AI_UseMob(self,"MPIPE",1);
		AI_UseMob(self,"MPIPE",2);
		AI_UseMob(self,"MPIPE",1);
		AI_UseMob(self,"MPIPE",2);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",5);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",5);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",4);
		AI_UseMob(self,"MPIPE",6);
		AI_UseMob(self,"MPIPE",5);
		AI_UseMob(self,"MPIPE",6);
		AI_UseMob(self,"MPIPE",7);
		AI_UseMob(self,"MPIPE",6);
		AI_UseMob(self,"MPIPE",7);
		AI_UseMob(self,"MPIPE",2);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",2);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",2);
		AI_UseMob(self,"MPIPE",3);
		AI_UseMob(self,"MPIPE",-1);
	};
	return LOOP_CONTINUE;
};

func void zs_iepfeiffer_end()
{
	AI_UseMob(self,"MPIPE",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_IEPFEIFFER_End");
};

