
func void zs_controlled()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Controlled");
};

func void zs_controlled_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Controlled_Loop");
};

func void zs_controlled_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Controlled_End");
	b_fullstop(self);
	AI_PlayAni(self,"T_PSI_VICTIM");
	AI_Wait(self,3.5);
	b_regaindroppedweapon(self);
	b_regaindroppedarmor(self);
	Npc_SetTarget(self,hero);
	Npc_GetTarget(self);
	AI_StartState(self,zs_assessenemy,1,"");
};

