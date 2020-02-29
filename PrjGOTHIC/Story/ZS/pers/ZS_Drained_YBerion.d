
func void zs_drained_yberion()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Drained_YBerion");
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
};

func void zs_drained_yberion_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Drained_YBerion_Loop");
	AI_Wait(self,1);
};

func void zs_drained_yberion_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Drained_YBerion_End");
};

