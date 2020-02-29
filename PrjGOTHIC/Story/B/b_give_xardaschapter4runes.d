
func void b_give_xardaschapter4runes()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(kdf_404_xardas);
	CreateInvItem(npc,itarrunedestroyundead);
	CreateInvItem(npc,itarrunefireball);
	CreateInvItem(npc,itarrunefirestorm);
	CreateInvItems(npc,itarscrollsummonskeletons,3);
	CreateInvItems(npc,itarscrollarmyofdarkness,2);
	CreateInvItems(npc,itarscrolldestroyundead,4);
	CreateInvItem(npc,itwr_book_circle_06);
	CreateInvItem(npc,alchemy_master);
};

func void b_give_xardaschapter5runes()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(kdf_404_xardas);
	CreateInvItem(npc,amulett_der_macht);
	CreateInvItem(npc,amulett_der_erleuchtung);
	CreateInvItem(npc,itarrunefirerain);
	CreateInvItems(npc,itarscrollsummongolem,2);
	CreateInvItems(npc,itarscrollsummondemon,2);
};

