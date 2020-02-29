
func void zs_unconscious()
{
	if(self.aivar[43] == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		AI_PlayAni(self,"S_DEADB");
        AI_StartState(self,zs_dead,0,"");
		b_deathxp();
        return;
	}
	else
	{	
	    printdebugnpc(PD_ZS_FRAME,"ZS_Unconscious");
	    c_zsinit();
	    Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	    //Mdl_ApplyRandomAni(self,"S_WOUNDED","T_WOUNDED_TRY");
	    //Mdl_ApplyRandomAniFreq(self,"S_WOUNDED",8);
		Mdl_ApplyRandomAni(self,"S_WOUNDED","T_WOUNDED_BREATH");
		Mdl_ApplyRandomAniFreq(self,"S_WOUNDED",0);
		Mdl_ApplyRandomAni(self,"S_WOUNDEDB","T_WOUNDEDB_BREATH");
		Mdl_ApplyRandomAniFreq(self,"S_WOUNDEDB",0);
	    self.aivar[AIV_PLUNDERED] = FALSE;
		if(self.id != 840)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	    if(Npc_CanSeeNpc(self,other) && (self.guild < GIL_SEPERATOR_ORC))
	    {
		    printdebugnpc(PD_ZS_CHECK,"...NSC kann T‰ter sehen!");
		    if(!Npc_IsPlayer(self))
		    {
			    b_assessandmemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,other,self);
		    };
	    };
	    c_stoplookat(self);
	    AI_StopPointAt(self);
	    if(c_bodystatecontains(self,BS_SWIM))
	    {
		    printdebugnpc(PD_ZS_CHECK,"...NSC ertrinkt!");
		    AI_StartState(self,zs_dead,0,"");
		    b_unconciousxp();
		    return;
	    };
	    if(Npc_IsPlayer(other) || (c_npcishuman(other) && other.aivar[AIV_PARTYMEMBER]) || (c_npcismonster(other) && other.aivar[AIV_MOVINGMOB]))
	    {
		    printdebugnpc(PD_ZS_CHECK,"...von SC oder Partymember besiegt!");
		    b_unconciousxp();
		    self.aivar[AIV_WASDEFEATEDBYSC] = TRUE;
	    };
	    if(Npc_IsPlayer(self))
	    {
		    printdebugnpc(PD_ZS_CHECK,"...SC besiegt!");
		    other.aivar[AIV_HASDEFEATEDSC] = TRUE;
	    };
    };
	if(self.id == 251)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			b_exchangeroutine(tpl_1422_gorhanis,"START");
			b_exchangeroutine(sld_729_kharim,"START");
		};
	};
	if(self.id == 729)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			b_exchangeroutine(tpl_1422_gorhanis,"START");
			b_exchangeroutine(grd_251_kirgo,"START");
		};
	};
	if(self.id == 1422)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			b_exchangeroutine(grd_251_kirgo,"START");
			b_exchangeroutine(sld_729_kharim,"START");
		};
	};
	if(Npc_IsPlayer(self) && PLAYERINARENA == TRUE)
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		b_exchangeroutine(tpl_1422_gorhanis,"START");
		b_exchangeroutine(grd_251_kirgo,"START");
		b_exchangeroutine(sld_729_kharim,"START");
	};
};

func int zs_unconscious_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Unconscious_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_UNCONSCIOUS)
	{
		printdebugnpc(PD_ZS_CHECK,"...Schleifen-Ende");
		return 1;
	};
	AI_Wait(self,1);
	return 0;
};

func void zs_unconscious_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Unconscious_End");
	if(c_npcisorc(self) && !Npc_IsPlayer(self))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Unconscious_End: Me, Orc -> temp-HOSTILE");
		AI_Standup(self);
		Npc_PerceiveAll(self);
		if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
		{
			printdebugnpc(PD_ZS_CHECK,"ZS_Unconscious_End: Me, Orc -> Waffe aufheben");
			if(Npc_CanSeeItem(self,item))
			{
				AI_TakeItem(self,item);
			};
		};
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
		return;
	};
	if(!Npc_IsPlayer(self))
	{
		b_resettempattitude(self);
	};
	AI_Standup(self);
	AI_StopLookAt(self);
	if(Npc_HasNews(self,NEWS_DEFEAT,other,self) && !Npc_IsInState(other,zs_unconscious) && !Npc_IsDead(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann den Attackierer noch sehen und der ist bei Bewuﬂtsein!");
		AI_QuickLook(self,other);
		if(c_amistronger(self,other))
		{
			b_say(self,other,"$YOULLBESORRYFORTHIS");
		}
		else if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
		{
			b_say(self,other,"$YESYES");
		};
	};
	b_regaindroppedweapon(self);
	AI_StartState(self,zs_healself,1,"");
};

