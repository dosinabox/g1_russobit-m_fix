
func void b_give_skipchapter1weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(grd_211_skip);
	CreateInvItems(npc,itkelockpick,10);
	CreateInvItem(npc,itmw_1h_sword_01);
	CreateInvItem(npc,itmw_1h_sword_02);
	CreateInvItem(npc,itmw_1h_sledgehammer_01);
	CreateInvItems(npc,itminugget,200);
	CreateInvItems(npc,itamarrow,100);
	CreateInvItems(npc,itambolt,100);
	CreateInvItems(npc,heiltrank,5);
};

func void b_give_skipchapter2weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(grd_211_skip);
	CreateInvItems(npc,itkelockpick,10);
	CreateInvItem(npc,itmw_1h_sword_03);
	CreateInvItem(npc,itmw_1h_sword_04);
	CreateInvItems(npc,heiltrank,10);
	CreateInvItems(npc,itfo_potion_health_02,5);
	CreateInvItems(npc,itminugget,200);
	CreateInvItems(npc,itamarrow,100);
	CreateInvItems(npc,itambolt,100);
};

func void b_give_skipchapter3weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(grd_211_skip);
	CreateInvItems(npc,itkelockpick,20);
	CreateInvItem(npc,itmw_1h_sword_long_01);
	CreateInvItem(npc,itmw_1h_sword_long_02);
	CreateInvItem(npc,itmw_1h_sword_long_03);
	//CreateInvItem(npc,itmw_1h_sword_long_04);
	CreateInvItems(npc,itamarrow,100);
	CreateInvItems(npc,itambolt,100);
	CreateInvItems(npc,itminugget,600);
};

