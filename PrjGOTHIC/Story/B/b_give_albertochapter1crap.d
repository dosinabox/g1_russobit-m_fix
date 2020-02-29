
func void b_give_albertochapter1crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(stt_300_alberto);
	CreateInvItems(npc,itfoapple,9);
	CreateInvItems(npc,itfobeer,5);
	CreateInvItems(npc,itfo_potion_health_01,5);
	CreateInvItems(npc,itfo_potion_health_02,5);
	CreateInvItems(npc,itminugget,193);
	CreateInvItems(npc,itamarrow,180);
	CreateInvItem(npc,alchemy_hp2_priced);
};

