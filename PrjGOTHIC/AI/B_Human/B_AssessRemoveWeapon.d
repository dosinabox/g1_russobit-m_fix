
func void b_assessremoveweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessRemoveWeapon");
	c_stoplookat(self);
	b_removeweapon(self);
	if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
	{
		b_say(self,other,"$WISEMOVE");
	};
	AI_ContinueRoutine(self);
};

