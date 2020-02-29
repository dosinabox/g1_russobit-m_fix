
func void b_give_fiskchapter1weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(stt_311_fisk);
	CreateInvItems(npc,itkelockpick,10);
	CreateInvItem(npc,itmw_1h_sword_old_01);
	CreateInvItem(npc,itmw_1h_sword_short_01);
	CreateInvItem(npc,itmw_1h_sword_short_02);
	CreateInvItem(npc,itmw_1h_sword_short_03);
	CreateInvItem(npc,itmw_1h_sword_short_04);
	CreateInvItem(npc,itmw_1h_sword_short_05);
	CreateInvItems(npc,itminugget,200);
};

func void b_give_fiskchapter2weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(stt_311_fisk);
	CreateInvItems(npc,itkelockpick,20);
	CreateInvItem(npc,itmw_1h_sword_01);
	CreateInvItem(npc,itmw_1h_sword_02);
	CreateInvItem(npc,itmw_1h_sword_03);
	CreateInvItem(npc,itmw_1h_sword_04);
	CreateInvItems(npc,itminugget,400);
};

func void b_give_fiskchapter3weapons()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(stt_311_fisk);
	CreateInvItems(npc,itkelockpick,30);
	CreateInvItem(npc,itmw_1h_sword_long_01);
	CreateInvItem(npc,itmw_1h_sword_long_02);
	CreateInvItem(npc,itmw_1h_sword_long_03);
	//CreateInvItem(npc,itmw_1h_sword_long_04);
	CreateInvItem(npc,itmw_1h_sword_broad_01);
	CreateInvItems(npc,itminugget,500);
};

