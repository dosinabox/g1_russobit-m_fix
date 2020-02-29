
func void zs_smalltalk()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smalltalk");
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
	if(!Npc_IsOnFP(self,"SMALLTALK"))
	{
		printdebugnpc(PD_TA_CHECK,"...nicht auf FP!");
		AI_GotoWP(self,self.wp);
	};
	AI_RemoveWeapon(self);
	AI_GotoFP(self,"SMALLTALK");
	AI_AlignToFP(self);
};

func void zs_smalltalk_loop()
{
	var int talktime;
	printdebugnpc(PD_TA_LOOP,"ZS_Smalltalk_Loop");
	Npc_PerceiveAll(self);
	Wld_DetectNpc(self,-1,zs_smalltalk,-1);
	printglobals(PD_TA_CHECK);
	if(Wld_DetectNpc(self,-1,zs_smalltalk,-1) && (Npc_GetDistToNpc(self,other) < 250))
	{
		AI_TurnToNPC(self,other);
		talktime = Hlp_Random(200);
		if(talktime < 5)
		{
			b_say(self,NULL,"$SMALLTALK01");
		}
		else if(talktime < 10)
		{
			b_say(self,NULL,"$SMALLTALK02");
		}
		else if(talktime < 15)
		{
			b_say(self,NULL,"$SMALLTALK03");
		}
		else if(talktime < 20)
		{
			b_say(self,NULL,"$SMALLTALK04");
		}
		else if(talktime < 25)
		{
			b_say(self,NULL,"$SMALLTALK05");
		}
		else if(talktime < 30)
		{
			b_say(self,NULL,"$SMALLTALK06");
		}
		else if(talktime < 35)
		{
			b_say(self,NULL,"$SMALLTALK07");
		}
		else if(talktime < 40)
		{
			b_say(self,NULL,"$SMALLTALK08");
		}
		else if(talktime < 45)
		{
			b_say(self,NULL,"$SMALLTALK09");
		}
		else if(talktime < 50)
		{
			b_say(self,NULL,"$SMALLTALK10");
		}
		else if(talktime < 55)
		{
			b_say(self,NULL,"$SMALLTALK11");
		}
		else if(talktime < 60)
		{
			b_say(self,NULL,"$SMALLTALK12");
		}
		else if(talktime < 65)
		{
			b_say(self,NULL,"$SMALLTALK13");
		}
		else if(talktime < 70)
		{
			b_say(self,NULL,"$SMALLTALK14");
		}
		else if(talktime < 75)
		{
			b_say(self,NULL,"$SMALLTALK15");
		}
		else if(talktime < 80)
		{
			b_say(self,NULL,"$SMALLTALK16");
		}
		else if(talktime < 85)
		{
			b_say(self,NULL,"$SMALLTALK17");
		}
		else if(talktime < 90)
		{
			b_say(self,NULL,"$SMALLTALK18");
		}
		else if(talktime < 95)
		{
			b_say(self,NULL,"$SMALLTALK19");
		}
		else if(talktime < 100)
		{
			b_say(self,NULL,"$SMALLTALK20");
		}
		else if(talktime < 105)
		{
			b_say(self,NULL,"$SMALLTALK21");
		}
		else if(talktime < 110)
		{
			b_say(self,NULL,"$SMALLTALK22");
		}
		else if(talktime < 115)
		{
			b_say(self,NULL,"$SMALLTALK23");
		}
		else if(talktime < 120)
		{
			b_say(self,NULL,"$SMALLTALK24");
		};
		AI_Wait(self,3);
		Npc_SetStateTime(self,0);
	}
	else if(Npc_GetStateTime(self) >= 5)
	{
		printdebugnpc(PD_TA_CHECK,"... kein Gesprächspartner gefunden!");
		//AI_StartState(self,zs_stand,1,"");
	};
	AI_Wait(self,1);
};

func void zs_smalltalk_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smalltalk_End");
};

