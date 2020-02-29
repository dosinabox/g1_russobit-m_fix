
func void zs_ielutter()
{
	printdebugnpc(PD_TA_FRAME,"ZS_IELUTTER");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_ielutter_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_IELUTTER_Loop");
	if(INEXTREMOPLAYING)
	{
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",1);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",2);
		AI_UseMob(self,"MDRUMSCHEIT",3);
		AI_UseMob(self,"MDRUMSCHEIT",-1);
	};
	return LOOP_CONTINUE;
};

func void zs_ielutter_end()
{
	AI_UseMob(self,"MDRUMSCHEIT",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_IELUTTER_End");
};

