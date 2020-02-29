
var int heroisafighter;

func void zs_arenaspectator()
{
	occupiedperception();
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_as_assessdefeat);
	Npc_PercDisable(self,PERC_ASSESSFIGHTSOUND);
	AI_RemoveWeapon(self);
	if(Npc_IsOnFP(self,"STAND") && (Npc_GetDistToWP(self,self.wp) < 500))
	{
		AI_AlignToFP(self);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func void zs_arenaspectator_loop()
{
	var int randomtime;
	var int shout;
	var int anim;
	if(!Npc_IsOnFP(self,"STAND") && Wld_IsFPAvailable(self,"STAND"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"STAND");
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,-1,zs_attack,-1))
	{
		AI_TurnToNPC(self,other);
		shout = Hlp_Random(100);
		if(shout < 2)
		{
			AI_OutputSVM(self,NULL,"$HEYHEYHEY");
		}
		else if(shout < 4)
		{
			if(self.voice == 3)
			{
				AI_OutputSVM(self,NULL,"$BEHINDYOU");
			}
			else
			{
				AI_OutputSVM(self,NULL,"$CHEERFIGHT");
			};
		}
		else if(shout < 6)
		{
			AI_OutputSVM(self,NULL,"$CHEERFRIEND");
		}
		else if(shout < 8)
		{
			AI_OutputSVM(self,NULL,"$OOH");
		}
			else if(shout < 10)
		{
			AI_OutputSVM(self,NULL,"$THERESAFIGHT");
		}
		else if(shout == 50)
		{
			if((self.voice == 10))
			{
				AI_OutputSVM(self,NULL,"$HELP");
			}
			else
			{
				AI_OutputSVM(self,NULL,"$YEAHWELLDONE");
			};
		};
		anim = Hlp_Random(100);
		if(anim < 5)
		{
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM1");
		}
		else if(anim < 10)
		{
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM2");
		}
		else if(anim < 15)
		{
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM3");
		}
		else if(anim < 20)
		{
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM4");
		};
		AI_Wait(self,0.5);
	};
};

func void zs_arenaspectator_end()
{
};

func void b_as_assessdefeat()
{
	var int defeatshout;
	var int delay;
	defeatshout = Hlp_Random(6);
	delay = Hlp_Random(1000);
	AI_Waitms(self,delay);
	if((defeatshout == 1) && ((self.voice == 4) || (self.voice == 12)))
	{
		b_say(self,NULL,"$HEDEFEATEDHIM");
	}
	else if((defeatshout == 2) && ((self.voice == 2) || (self.voice == 12)))
	{
		b_say(self,other,"$ITWASAGOODFIGHT");
	}
	else if((defeatshout == 3) && (self.voice == 2))
	{
		b_say(self,NULL,"$HEDEFEATEDHIM");
	}
	else if((defeatshout == 4) && (self.voice == 1))
	{
		b_say(self,other,"$ITWASAGOODFIGHT");
	};
};
