
func void zs_firespit()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Firespit");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_RemoveWeapon(self);
};

func void zs_firespit_loop()
{
	var int spitreaktion;
	printdebugnpc(PD_ZS_LOOP,"ZS_Firespit_Loop");
	if(Npc_HasItems(self,itlstorchfirespit) <= 1)
	{
		CreateInvItem(self,itlstorchfirespit);
	};
	spitreaktion = Hlp_Random(100);
	if(spitreaktion >= 50)
	{
		AI_UseItemToState(self,itlstorchfirespit,5);
		AI_UseItemToState(self,itlstorchfirespit,-1);
	};
	AI_Wait(self,1);
};

func void zs_firespit_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Firespit_End");
	AI_UseItemToState(self,itlstorchfirespit,-1);
	AI_ContinueRoutine(self);
};

