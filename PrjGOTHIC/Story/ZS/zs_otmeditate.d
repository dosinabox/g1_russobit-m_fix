
func void zs_otmeditate()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_interceptassessdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_otmeditate_assessmurder);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 3500;
	if(Npc_GetPermAttitude(self,hero) != ATT_HOSTILE)
	{
		npc_setpermattitude(self,ATT_ANGRY);
	};
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE"))
	{
		AI_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,zs_teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		b_smartturntonpc(self,other);
	};
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};

func void zs_otmeditate_loop()
{
	if(Npc_IsDead(gur_1212_madcorkalom))
	{
		b_fullstop(self);
		b_whirlaround(self,hero);
		npc_setpermattitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,hero);
		AI_StartState(self,zs_attack,0,"");
		//return LOOP_END;
	};
	var int praytime;
	printdebugnpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	if(praytime >= 50)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	AI_Wait(self,1);
};

func void zs_otmeditate_end()
{
	c_stoplookat(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	printdebugnpc(PD_TA_FRAME,"ZS_Meditate_End");
};

func void b_otmeditate_assessmurder()
{
	var int npcinstance;
	printdebugnpc(PD_TA_FRAME,"B_OTMeditate_AssessMurder");
	printglobals(PD_TA_DETAIL);
	npcinstance = Hlp_GetInstanceID(victim);
	if(npcinstance == gur_1212_madcorkalom)
	{
		b_fullstop(self);
		b_whirlaround(self,hero);
		npc_setpermattitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,hero);
		AI_StartState(self,zs_attack,0,"");
		SLF_FIRE = TRUE;
	};
};

