
func void b_lookaround()
{
	printdebugnpc(PD_ZS_FRAME,"B_LookAround");
	Npc_SetPercTime(self,1);
	AI_Standup(self);
	AI_PlayAni(self,"T_SEARCH");
};

