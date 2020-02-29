
func void b_assessbody()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessBody");
	printglobals(PD_ZS_CHECK);
	if(Npc_GetDistToNpc(self,other) < 1000)
	{
		printdebugnpc(PD_ZS_CHECK,"...Körper näher als 10m!");
		b_fullstop(self);
		AI_StartState(self,zs_assessbody,0,"");
	};
};

func void zs_assessbody()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		printdebugnpc(PD_ZS_CHECK,"...Körper bereits geplündert!");
		AI_ContinueRoutine(self);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		printdebugnpc(PD_ZS_CHECK,"...Körper zu weit weg!");
		AI_ContinueRoutine(self);
	};
};

func int zs_assessbody_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessBody_Loop");
	b_fullstop(self);
	AI_GotoNpc(self,other);
	return LOOP_END;
};

func void zs_assessbody_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody_End");
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine(self);
	};
	if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npctype != NPCTYPE_FRIEND) && c_npcishuman(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...kein purer Fernkämpfer und kein NSC-Freund!");
		AI_PlayAni(self,"T_PLUNDER");
		if(b_plunder())
		{
			b_say(self,other,"$ITookYourOre");
		}
		else
		{
			b_say(self,other,"$ShitNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	};
	AI_StartState(self,zs_assessbody_recoverweapon,1,"");
};

func void zs_assessbody_recoverweapon()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody_RecoverWeapon");
	b_setperception(self);
	Npc_PerceiveAll(self);
	if((Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF)) && (Npc_GetDistToItem(self,item) < 300))
	{
		printdebugnpc(PD_ZS_CHECK,"...Nah- oder Fernkampfwaffe gefunden!");
		b_sayoverlay(self,NULL,"$ITakeYourWeapon");
		AI_TakeItem(self,item);
		AI_EquipBestMeleeWeapon(self);
		AI_EquipBestRangedWeapon(self);
	};
	AI_StartState(self,zs_healself,1,"");
};

