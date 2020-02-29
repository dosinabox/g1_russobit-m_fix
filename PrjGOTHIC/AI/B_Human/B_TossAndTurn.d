
func void b_tossandturn()
{
	printdebugnpc(PD_ZS_FRAME,"B_TossAndTurn");
	Npc_ClearAIQueue(self);
	AI_PlayAni(self,"R_BED_RANDOM_2");
};

