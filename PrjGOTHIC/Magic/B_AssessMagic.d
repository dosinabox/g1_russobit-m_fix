
func void b_assessmagic_firebolt()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Firebolt");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_fireball()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_FireBall");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_firestorm()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Firestorm");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_firerain()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Firerain");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_chainlightning()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic ...ChainLightning");
	Npc_PercDisable(self,PERC_ASSESSCASTER);
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	Npc_ClearAIQueue(self);
	if(!Npc_IsDead(self))
	{
		b_fullstop(self);
		AI_StartState(self,zs_zapped,0,"");
	};
};

func void b_assessmagic_thunderbolt()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Thunderbolt");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_thunderball()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic ...Thunderball");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	Npc_ClearAIQueue(self);
	if(!Npc_IsDead(self))
	{
		AI_StartState(self,zs_shortzapped,0,"");
	};
};

func void b_assessmagic_icecube()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic ...IceCube oder IceWave");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	if(!((self.guild == GIL_SLF) || (self.guild == GIL_DEMON) || (self.guild == GIL_GOLEM) || (self.guild == GIL_SWAMPSHARK) || (self.guild == GIL_TROLL)) && (!c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE)))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_magicfreeze,0,"");
	};
};

func void b_assessmagic_fear()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Fear");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	if((self.guild == GIL_SLF) || (self.guild == GIL_TROLL) || (self.guild == GIL_SWAMPSHARK) || (self.guild == GIL_DEMON) || (self.guild == GIL_GOLEM) || (self.guild == GIL_SKELETON) || (self.guild == GIL_ZOMBIE))
	{
		printdebugnpc(PD_MAGIC,"...Ziel immun!");
	}
	else
	{
		printdebugnpc(PD_MAGIC,"...Ziel NICHT immun!");
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		if(c_npcishuman(self))
		{
			AI_StartState(self,zs_flee,0,"");
		}
		else if(c_npcismonster(self))
		{
			AI_StartState(self,zs_mm_flee,0,"");
		};
	};
};

func void b_assessmagic_massdeath()
{
	printdebugnpc(PD_MAGIC,"B_Assessmagic_Massdeath");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_destroyundead()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Destroyundead");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_windfist()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Windfist");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_stormfist()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Stormfist");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_charm()
{
	printdebugnpc(PD_ZS_CHECK,"B_AssessMagic Charm");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	Npc_ClearAIQueue(self);
	if(!Npc_IsInState(self,zs_unconscious))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist ein Mensch bei bewuﬂtsein!");
		Npc_SetTempAttitude(self,ATT_FRIENDLY);
		b_fullstop(self);
		if(Npc_IsInState(self,zs_attack))
		{
			b_sayoverlay(self,other,"$LetsForgetOurLittleFight");
		}
		else
		{
			b_say(self,other,"$FriendlyGreetings");
		};
		AI_ContinueRoutine(self);
	};
};

func void b_assessmagic_pyrokinesis()
{
	printdebugnpc(PD_MAGIC,"...Pyrokinesis");
	Npc_ClearAIQueue(self);
	Npc_PercDisable(self,PERC_ASSESSCASTER);
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious))
	{
		printdebugnpc(PD_MAGIC,"...weder bewuﬂtlos noch tot!");
		AI_StartState(self,zs_pyro,0,"");
	};
};

func void b_assessmagic_berzerk()
{
	printdebugnpc(PD_MAGIC,"...Berzerk");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	Npc_ClearAIQueue(self);
	if(!Npc_IsDead(self) && !Npc_IsInState(self,zs_unconscious))
	{
		AI_StartState(self,zs_berzerk,0,"");
	};
};

func void b_assessmagic_breathofdeath()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_Breathofdeath");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_new1()
{
	printdebugnpc(PD_MAGIC,"B_AssessMagic_New1");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic_shrink()
{
	printdebugnpc(PD_MAGIC,"...Shrink");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	Npc_ClearAIQueue(self);
	AI_StartState(self,zs_magicshrink,0,"");
};

func void b_assessmagic_control()
{
	printdebugnpc(PD_MAGIC,"...Control");
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
};

func void b_assessmagic()
{
	printglobals(PD_MAGIC);
	printdebugnpc(PD_MAGIC,"B_AssessMagic");
	if(Npc_GetActiveSpell(other) == SPL_FIREBOLT)
	{
		b_assessmagic_firebolt();
	}
	else if(Npc_GetActiveSpell(other) == SPL_FIREBALL)
	{
		b_assessmagic_fireball();
	}
	else if(Npc_GetActiveSpell(other) == SPL_FIRESTORM)
	{
		b_assessmagic_firestorm();
	}
	else if(Npc_GetActiveSpell(other) == SPL_FIRERAIN)
	{
		b_assessmagic_firerain();
	}
	else if(Npc_GetActiveSpell(other) == SPL_CHAINLIGHTNING)
	{
		b_assessmagic_chainlightning();
	}
	else if(Npc_GetActiveSpell(other) == SPL_THUNDERBOLT)
	{
		b_assessmagic_thunderbolt();
	}
	else if(Npc_GetActiveSpell(other) == SPL_THUNDERBALL)
	{
		b_assessmagic_thunderball();
	}
	else if(Npc_GetActiveSpell(other) == SPL_ICECUBE)
	{
		b_assessmagic_icecube();
	}
	else if(Npc_GetActiveSpell(other) == SPL_ICEWAVE)
	{
		b_assessmagic_icecube();
	}
	else if(Npc_GetActiveSpell(other) == SPL_MASSDEATH)
	{
		b_assessmagic_massdeath();
	}
	else if(Npc_GetActiveSpell(other) == SPL_DESTROYUNDEAD)
	{
		b_assessmagic_destroyundead();
	}
	else if(Npc_GetActiveSpell(other) == SPL_WINDFIST)
	{
		b_assessmagic_windfist();
	}
	else if(Npc_GetActiveSpell(other) == SPL_STORMFIST)
	{
		b_assessmagic_stormfist();
	}
	else if(Npc_GetActiveSpell(other) == SPL_CHARM)
	{
		b_assessmagic_charm();
	}
	else if(Npc_GetActiveSpell(other) == SPL_FEAR)
	{
		b_assessmagic_fear();
	}
	else if(Npc_GetActiveSpell(other) == SPL_PYROKINESIS)
	{
		b_assessmagic_pyrokinesis();
	}
	else if(Npc_GetActiveSpell(other) == SPL_BERZERK)
	{
		b_assessmagic_berzerk();
	}
	else if(Npc_GetActiveSpell(other) == SPL_BREATHOFDEATH)
	{
		b_assessmagic_breathofdeath();
	}
	else if(Npc_GetActiveSpell(other) == SPL_NEW1)
	{
		b_assessmagic_new1();
	}
	else if(Npc_GetActiveSpell(other) == SPL_CONTROL)
	{
		b_assessmagic_control();
	}
	else if(Npc_GetActiveSpell(other) == SPL_SHRINK)
	{
		b_assessmagic_shrink();
	};
};


const func PLAYER_PERC_ASSESSMAGIC = B_ASSESSMAGIC;
