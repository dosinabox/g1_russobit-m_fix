
func void zs_intruderalert()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_IntruderAlert");
	printglobals(PD_ZS_FRAME);
	b_intruderalert(self,hero);
	AI_StartState(self,zs_attack,0,"");
};

