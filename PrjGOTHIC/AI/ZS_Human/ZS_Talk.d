
func void b_refusetalk()
{
	printdebugnpc(PD_ZS_FRAME,"B_RefuseTalk");
	b_smartturntonpc(self,other);
	b_say(self,other,"$NOTNOW");
	c_stoplookat(self);
};

func void zs_talk()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Talk");
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC spricht schon!");
		AI_ContinueRoutine(self);
		return;
	};
	c_zsinit();
	b_setfaceexpression(self,other);
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	if(Npc_GetDistToNpc(other,self) < 80)
	{
		AI_Dodge(other);
	};
	if((npc_gettempattitude(self,other) == ATT_HOSTILE) && (self.aivar[AIV_TALKBEFOREATTACK] == FALSE))
	{
		Npc_SetTarget(self,other);
		b_assessenemy();
	};
	if(c_bodystatecontains(self,BS_WALK) || c_bodystatecontains(self,BS_RUN))
	{
		b_say(hero,self,"$SC_HEYWAITASECOND");
	}
	else if(!Npc_CanSeeNpc(self,hero))
	{
		b_say(hero,self,"$SC_HEYTURNAROUND");
	}
	else
	{
	};
	if(!c_bodystatecontains(self,BS_SIT) || !Npc_CanSeeNpc(self,hero))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	b_fullstop(hero);
	AI_TurnToNPC(hero,self);
	if(!hero.aivar[AIV_IMPORTANT])
	{
		b_guildgreetings();
	};
	b_checkstolenequipment();
	if((self.npctype == NPCTYPE_MAIN) || (self.npctype == NPCTYPE_FRIEND))
	{
		Npc_SetKnowsPlayer(self,other);
	};
	if(!hero.aivar[AIV_IMPORTANT])
	{
		b_reacttomemory();
	};
	b_assignambientinfos(self);
	self.aivar[AIV_FINDABLE] = TRUE;
	other.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(self);
	AI_ProcessInfos(self);
};

func int zs_talk_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Talk_Loop");
	if(c_bodystatecontains(self,BS_SIT))
	{
		if(self.aivar[AIV_HANGAROUNDSTATUS] <= 1)
		{
			AI_LookAtNpc(self,other);
		};
		AI_LookAtNpc(self,other);
	};
	if(InfoManager_HasFinished())
	{
		printdebugnpc(PD_ZS_CHECK,"...InfoManager beendet!");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		b_resetfaceexpression(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_talk_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Talk_End");
	c_stoplookat(self);
	if(!InfoManager_HasFinished())
	{
		//PrintScreen("<<< Ошибка при завершении диалога! >>>",-1,78,"FONT_OLD_10_WHITE.TGA",5);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_INVINCIBLE] = FALSE;
		b_resetfaceexpression(self);
		AI_StopProcessInfos(self);
	};
};

