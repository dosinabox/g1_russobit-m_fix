
func void b_babe_refusetalk()
{
	printdebugnpc(PD_ZS_FRAME,"B_Babe_RefuseTalk");
	b_say(self,other,"$NOTNOW");
	AI_StopLookAt(self);
};

