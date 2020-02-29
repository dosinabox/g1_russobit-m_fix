
func void b_give_xardaschapter4runes()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(kdf_404_xardas);
	CreateInvItem(npc,itarrunedestroyundead);
	CreateInvItems(npc,itarscrollsummonskeletons,8);
	CreateInvItems(npc,itarscrollsummongolem,4);
	CreateInvItems(npc,itarscrollshrink,2);
};

func void b_give_xardaschapter5runes()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(kdf_404_xardas);
	CreateInvItem(npc,itarrunefirerain);
	CreateInvItems(npc,itarscrollsummondemon,4);
	CreateInvItems(npc,itarscrollsummonskeletons,8);
	CreateInvItems(npc,itarscrollsummongolem,4);
};

func void b_give_xardaschapter6runes()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(kdf_404_xardas);
	CreateInvItems(npc,itarscrollsummondemon,4);
	CreateInvItems(npc,itarscrollsummonskeletons,8);
	CreateInvItems(npc,itarscrollsummongolem,4);
	CreateInvItems(npc,itarscrollarmyofdarkness,8);
	CreateInvItem(npc,amulett_der_macht);
	CreateInvItem(npc,amulett_der_erleuchtung);
};

