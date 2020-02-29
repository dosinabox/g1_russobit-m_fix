
func void zs_ieunicorn()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IEUNICORN");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_ieunicorn_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_IEUNICORN_Loop");
	if(INEXTREMOPLAYING)
	{
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",3);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",3);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",3);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",3);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",3);
		AI_UseMob(self,"MLUTE",1);
		AI_UseMob(self,"MLUTE",2);
		AI_UseMob(self,"MLUTE",-1);
	};
	return LOOP_CONTINUE;
};

func void zs_ieunicorn_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IEUNICORN_End");
	AI_UseMob(self,"MLUTE",-1);
};

