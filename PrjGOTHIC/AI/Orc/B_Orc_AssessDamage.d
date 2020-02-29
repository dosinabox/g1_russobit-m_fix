
func void b_orc_assessdamage()
{
	printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessDamage");
	AI_TurnToNPC(self,other);
	if(Npc_GetDistToNpc(self,other) > 500)
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssessDamage: Gegner weit weg -> hinspringen");
		AI_PlayAni(self,"T_STAND_2_JUMP");
	};
	b_fullstop(self);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_orc_attack,0,"");
};

