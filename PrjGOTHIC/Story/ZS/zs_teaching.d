
func void zs_teaching()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Teaching");
	//b_setperception(self);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	//Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_movenpc);
	Npc_SetPercTime(self,1);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP(self,self.wp);
	}
	else
	{
		AI_AlignToFP(self);
	};
};

func void zs_teaching_loop()
{
	var int guardreaktion;
	printdebugnpc(PD_TA_LOOP,"ZS_Teaching_Loop");
	b_gotofp(self,"TEACHING");
	AI_AlignToFP(self);
	guardreaktion = Hlp_Random(1000);
	if(self.voice == 11)
	{
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(guardreaktion >= 900)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_11");
		AI_OutputSVM(self,NULL,"$TEACH01");
	}
	else if(guardreaktion >= 800)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_15");
		AI_OutputSVM(self,NULL,"$TEACH02");
	}
	else if(guardreaktion >= 700)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_16");
		AI_OutputSVM(self,NULL,"$TEACH03");
	}
	else if(guardreaktion >= 600)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_18");
		AI_OutputSVM(self,NULL,"$TEACH04");
	}
	else if(guardreaktion >= 500)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_21");
		AI_OutputSVM(self,NULL,"$TEACH05");
	}
	else if(guardreaktion >= 400)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_20");
		AI_OutputSVM(self,NULL,"$TEACH06");
	}
	else if(guardreaktion >= 300)
	{
		//AI_PlayAni(self,"T_DIALOGGESTURE_20");
		AI_OutputSVM(self,NULL,"$TEACH07");
	};
	AI_Wait(self,1);
};

func void zs_teaching_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Teaching_End");
	if(self.voice == 11)
	{
		b_resetfaceexpression(self);
	};
};

