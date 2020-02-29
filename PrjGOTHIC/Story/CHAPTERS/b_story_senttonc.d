
func void b_story_senttonc()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(pc_fighter);
	printdebugnpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	CreateInvItem(self,itarruneteleport5);
	b_giveinvitems(self,hero,itarruneteleport5,1);
};

