
func void b_give_bartholochapter1food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ebr_106_bartholo);
	CreateInvItems(npc,itfo_potion_health_01,5);
	CreateInvItems(npc,itfoapple,5);
	CreateInvItems(npc,itfo_wineberrys_01,7);
	CreateInvItems(npc,itfoloaf,8);
	CreateInvItems(npc,itfomutton,10);
	CreateInvItems(npc,itfo_mutton_01,6);
	CreateInvItems(npc,itfocheese,8);
	CreateInvItems(npc,itfobeer,6);
	CreateInvItems(npc,itfowine,9);
	CreateInvItems(npc,itmijoint_2,4);
	CreateInvItems(npc,itmijoint_3,5);
};

func void b_give_bartholochapter2food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ebr_106_bartholo);
	CreateInvItems(npc,itfo_potion_health_02,5);
};

func void b_give_bartholochapter3food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ebr_106_bartholo);
	CreateInvItems(npc,itfo_potion_health_03,5);
};

