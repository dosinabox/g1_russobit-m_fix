
func void zs_standaround()
{
	printdebugnpc(PD_TA_FRAME,"ZS_StandAround");
	b_setperception(self);
	if(Npc_WasInState(self,zs_smalltalk))
	{
		Npc_PercEnable(self,PERC_NPCCOMMAND,b_smalltalk);
	};
	AI_SetWalkMode(self,NPC_WALK);
	AI_RemoveWeapon(self);
	b_clearitem(self);
	if(!Npc_IsOnFP(self,"CAMPFIRE"))
	{
		printdebugnpc(PD_TA_CHECK,"...nicht auf FP!");
		AI_GotoWP(self,self.wp);
	};
};

func int zs_standaround_loop()
{
	var int choice;
	printdebugnpc(PD_TA_LOOP,"ZS_StandAround_Loop");
	if(Npc_WasInState(self,zs_smalltalk))
	{
		b_gotofp(self,"SMALLTALK");
		AI_AlignToFP(self);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE"))
	{
		b_gotofp(self,"CAMPFIRE");
		AI_AlignToFP(self);
	}
	else
	{
		Npc_PerceiveAll(self);
		if(Wld_DetectNpcEx(self,-1,NOFUNC,-1,0))
		{
			AI_TurnToNPC(self,other);
		};
	};
	if(Npc_WasInState(self,zs_smalltalk))
	{
		Npc_SendPassivePerc(self,PERC_NPCCOMMAND,self,self);
	};
	choice = Hlp_Random(100);
	printdebugint(PD_TA_DETAIL,"...Zufallsani-Wurf:",choice);
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_NONE)
	{
		if(c_npcbelongstooldcamp(self))
		{
			if(choice < 10)
			{
				b_chooseapple(self);
			}
			else if(choice < 20)
			{
				b_chooseloaf(self);
			}
			else if(choice < 30)
			{
				b_choosecheese(self);
			}
			else if(choice < 40)
			{
				b_choosebeer(self);
			}
			else if(choice < 60)
			{
				b_choosemeat(self);
			}
			else if(choice < 80)
			{
				b_pee(self);
			}
			else if(choice < 100)
			{
				b_bored(self);
			};
		}
		else if(c_npcbelongstonewcamp(self))
		{
			if(choice < 10)
			{
				b_chooserice(self);
			}
			else if(choice < 30)
			{
				b_choosewine(self);
			}
			else if(choice < 50)
			{
				b_choosebooze(self);
			}
			else if(choice < 60)
			{
				b_choosejoint(self);
			}
			else if(choice < 80)
			{
				b_pee(self);
			}
			else if(choice < 100)
			{
				b_bored(self);
			};
		}
		else if(c_npcbelongstopsicamp(self))
		{
			if(choice < 20)
			{
				b_choosesoup(self);
			}
			else if(choice < 80)
			{
				b_choosejoint(self);
			}
			else if(choice < 90)
			{
				b_pee(self);
			}
			else if(choice < 100)
			{
				b_bored(self);
			};
		}
		else
		{
			if(choice < 50)
			{
				b_bored(self);
			};
		};
	}
	else if(choice < 20)
	{
		b_clearitem(self);
	};
	b_playitemrandoms(self);
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_standaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_StandAround_End");
	c_stoplookat(self);
	b_clearitem(self);
};

func void b_smalltalk()
{
	printdebugnpc(PD_TA_FRAME,"B_SmallTalk");
	if(Npc_IsInState(other,zs_standaround) && Npc_IsOnFP(other,"SMALLTALK") && (Npc_GetDistToNpc(self,other) < HAI_DIST_SMALLTALK))
	{
		printdebugnpc(PD_TA_CHECK,"...'other' geeigneter SmallTalk-Partner!");
		Npc_PercDisable(other,PERC_ASSESSPLAYER);
		Npc_PercDisable(other,PERC_OBSERVEINTRUDER);
		b_fullstop(other);
		Npc_SetTarget(other,self);
		Npc_GetTarget(self);
		AI_StartState(other,zs_smalltalk,1,"");
		Npc_PercDisable(self,PERC_ASSESSPLAYER);
		Npc_PercDisable(self,PERC_OBSERVEINTRUDER);
		b_fullstop(self);
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_StartState(self,zs_smalltalk,1,"");
	};
};

