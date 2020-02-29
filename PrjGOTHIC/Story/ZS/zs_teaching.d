
func void zs_teaching()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Teaching");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_teaching_loop()
{
	var int guardreaktion;
	printdebugnpc(PD_TA_LOOP,"ZS_Teaching_Loop");
	b_gotofp(self,"TEACHING");
	guardreaktion = Hlp_Random(1000);
	if(guardreaktion >= 900)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_11");
	}
	else if(guardreaktion >= 800)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_15");
	}
	else if(guardreaktion >= 700)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_16");
	}
	else if(guardreaktion >= 600)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_18");
	}
	else if(guardreaktion >= 500)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_21");
	}
	else if(guardreaktion >= 400)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_20");
	};
	AI_Wait(self,1);
};

func void zs_teaching_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Teaching_End");
};

