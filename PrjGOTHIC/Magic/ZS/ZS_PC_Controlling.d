
func void zs_pc_controlling()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_PC_Controlling");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PlayAni(self,"T_CONSHOOT_2_CONACTIVE");
};

func void zs_pc_controlling_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_PC_Controlling_Loop");
};

func void zs_pc_controlling_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_PC_Controlling_End");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_ContinueRoutine(self);
};

