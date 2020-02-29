
func void zs_preach_yberion()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Preach_YBerion");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PREACH"))
	{
		AI_GotoFP(self,"PREACH");
	};
	AI_AlignToFP(self);
};

func void zs_preach_yberion_loop()
{
	var int preachtime;
	printdebugnpc(PD_TA_LOOP,"ZS_Preach_YBerion_Loop");
	preachtime = Hlp_Random(100);
	if(preachtime <= 3)
	{
		AI_Output(self,NULL,"ZS_Preach_YBerion01");	//Спящий говорил со мной!
	}
	else if(preachtime >= 98)
	{
		AI_Output(self,NULL,"ZS_Preach_YBerion02");	//Спящий освободит нас.
	}
	else if(preachtime >= 95)
	{
		AI_Output(self,NULL,"ZS_Preach_YBerion03");	//Пробудись, о Спящий!
	};
	AI_Wait(self,1);
};

func void zs_preach_yberion_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Preach_YBerion_End");
};

