
func void zs_iethomas()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IETHOMAS");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_iethomas_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_IETHOMAS_Loop");
	if(INEXTREMOPLAYING)
	{
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",1);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",3);
		AI_UseMob(self,"MCELLO",2);
		AI_UseMob(self,"MCELLO",-1);
	};
	return LOOP_CONTINUE;
};

func void zs_iethomas_end()
{
	AI_UseMob(self,"MCELLO",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_IETHOMAS_End");
};

