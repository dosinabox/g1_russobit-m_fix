
func void b_give_skipchapter2weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(grd_211_skip);
	CreateInvItems(npc,itkelockpick,20);
	CreateInvItem(npc,itmw_1h_sword_01);
	CreateInvItem(npc,itmw_1h_sword_02);
	CreateInvItem(npc,itmw_1h_sword_03);
	CreateInvItem(npc,itmw_1h_sword_04);
	CreateInvItem(npc,itmw_1h_sword_04);
	CreateInvItems(npc,itminugget,400);
	CreateInvItems(npc,itamarrow,200);
	CreateInvItems(npc,itambolt,200);
};

func void b_give_skipchapter3weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(grd_211_skip);
	CreateInvItems(npc,itkelockpick,30);
	CreateInvItem(npc,itmw_1h_sword_long_01);
	CreateInvItem(npc,itmw_1h_sword_long_02);
	CreateInvItem(npc,itmw_1h_sword_long_03);
	CreateInvItem(npc,itmw_1h_sword_long_04);
	CreateInvItem(npc,itmw_1h_sword_long_04);
	CreateInvItems(npc,itamarrow,400);
	CreateInvItems(npc,itambolt,400);
	CreateInvItems(npc,itminugget,600);
};

