
func void b_babe_refusetalk()
{
	printdebugnpc(PD_ZS_FRAME,"B_Babe_RefuseTalk");
	if((Hlp_GetInstanceID(gur_1205_chani) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(gur_1207_natalia) == Hlp_GetInstanceID(self)) && KAPITEL == 3)
	{
		b_say(self,other,"$CRY");
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
	AI_StopLookAt(self);
};

