
func void b_give_silaschapter1food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(org_841_silas);
	CreateInvItems(npc,itkelockpick,3);
	CreateInvItems(npc,itminugget,18);
	CreateInvItems(npc,itforice,4);
	CreateInvItems(npc,itfobooze,8);
	CreateInvItems(npc,itfobeer,6);
	CreateInvItems(npc,itfowine,6);
	CreateInvItems(npc,itfo_potion_health_01,3);
	CreateInvItems(npc,itfocheese,3);
	CreateInvItems(npc,itmi_alchemy_alcohol_01,3);
	CreateInvItem(npc,itfomutton);
	CreateInvItems(npc,itfoloaf,3);
};

func void b_give_silaschapter2food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(org_841_silas);
	CreateInvItems(npc,itminugget,150);
	CreateInvItems(npc,itfo_potion_health_01,10);
	CreateInvItems(npc,itfo_potion_health_02,5);
	CreateInvItems(npc,itfocheese,2);
	CreateInvItems(npc,itforice,2);
	CreateInvItems(npc,itfoloaf,2);
	CreateInvItem(npc,itfobeer);
};

func void b_give_silaschapter3food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(org_841_silas);
	CreateInvItems(npc,itminugget,250);
	CreateInvItems(npc,itfo_potion_mana_01,10);
	CreateInvItems(npc,itfo_potion_health_03,5);
	CreateInvItems(npc,itfocheese,2);
	CreateInvItems(npc,itforice,2);
	CreateInvItems(npc,itfoloaf,2);
	CreateInvItem(npc,itfobeer);
};

func void b_give_silaschapter4food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(org_841_silas);
	CreateInvItems(npc,itminugget,300);
	CreateInvItems(npc,itfo_potion_mana_01,12);
	CreateInvItems(npc,itfo_potion_mana_02,6);
	CreateInvItems(npc,itfocheese,2);
	CreateInvItems(npc,itforice,2);
	CreateInvItems(npc,itfoloaf,2);
	CreateInvItem(npc,itfobeer);
};

func void b_give_silaschapter5food()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(org_841_silas);
	CreateInvItems(npc,itminugget,500);
	CreateInvItems(npc,itfo_potion_mana_02,7);
	CreateInvItems(npc,itfo_potion_mana_03,3);
	CreateInvItems(npc,itfocheese,2);
	CreateInvItems(npc,itforice,2);
	CreateInvItems(npc,itfoloaf,2);
	CreateInvItem(npc,itfobeer);
};

