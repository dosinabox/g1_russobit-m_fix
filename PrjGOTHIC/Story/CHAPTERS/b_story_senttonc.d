
func void b_story_senttonc()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(pc_fighter);
	printdebugnpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	CreateInvItem(self,itarrune_1_5_teleport5);
	b_giveinvitems(self,hero,itarrune_1_5_teleport5,1);
};

