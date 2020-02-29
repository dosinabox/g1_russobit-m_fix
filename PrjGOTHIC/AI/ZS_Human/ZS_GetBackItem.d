
func void zs_getbackitem()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalkangry);
	Npc_PercEnable(self,PERC_ASSESSITEM,b_getbackitem_seen);
	Npc_PercEnable(self,PERC_DRAWWEAPON,zs_getbackitem_drawweapon);
	Npc_SetPercTime(self,1);
	b_say(self,other,"$GIVEITTOME");
	Npc_SendPassivePerc(self,PERC_NPCCOMMAND,self,other);
	if(Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_CHECK,"other");
	};
};

func int zs_getbackitem_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_GetBackItem_Loop");
	if((Npc_GetStateTime(self) > 7) && Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ZS_LOOP,"ZS_GetBackItem_Loop // after 3 sec Attack");
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
		return 1;
	}
	else if(Npc_GetStateTime(self) > 7)
	{
		return 1;
	};
};

func void zs_getbackitem_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_End");
};

func void b_getbackitem_seen()
{
	printdebugnpc(PD_ZS_FRAME,"B_GetBackItem_Seen");
	Npc_PercDisable(self,PERC_ASSESSITEM);
	if(self.aivar[AIV_WANTEDITEM] == Hlp_GetInstanceID(item))
	{
		printdebugnpc(PD_ZS_FRAME,"B_GetBackItem_Seen want it");
		Npc_ClearAIQueue(self);
		AI_TakeItem(self,item);
		b_say(self,other,"$WISEMOVE");
		AI_ContinueRoutine(self);
	};
};

func void b_getbackitem_given()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_Given");
	if(self.aivar[AIV_WANTEDITEM] == Hlp_GetInstanceID(item))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_Given // want this item cause it_s mine");
		Npc_ClearAIQueue(self);
		Npc_GiveItem(other,item,self);
		b_say(self,other,"$WISEMOVE");
		AI_ContinueRoutine(self);
	}
	else
	{
		if(c_wantitem())
		{
			printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_Given // want this cause it_s worthy");
			Npc_ClearAIQueue(self);
			Npc_GiveItem(other,item,self);
			b_say(self,other,"$OKAYTOO");
		}
		else
		{
			printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_Given don_t want this crap");
			b_say(self,other,"$YOUWANNAFOOLME");
			if(c_amistronger(self,other))
			{
				printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_Given don_t want this crap // stronger");
				Npc_ClearAIQueue(self);
				Npc_SetTarget(self,other);
				AI_StartState(self,zs_attack,0,"");
			};
		};
		AI_ContinueRoutine(self);
	};
};

func void zs_getbackitem_drawweapon()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GetBackItem_DrawWeapon");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	b_say(self,other,"$YOUASKEDFORIT");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,0,"");
};

