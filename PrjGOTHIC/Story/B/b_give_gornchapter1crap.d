
func void b_give_gornchapter1crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(pc_fighter);
	CreateInvItems(npc,itminugget,200);
	CreateInvItems(npc,itfowine,10);
	CreateInvItems(npc,itfoloaf,20);
	CreateInvItems(npc,itfomutton,21);
	CreateInvItems(npc,itfo_mutton_01,9);
	CreateInvItems(npc,itfocheese,18);
	CreateInvItems(npc,itfobeer,16);
	CreateInvItems(npc,itfo_potion_health_01,10);
	CreateInvItems(npc,itfo_potion_mana_01,5);
	CreateInvItems(npc,itkelockpick,5);
	CreateInvItem(npc,alchemy_hp3_priced);
};

func void b_give_gornchapter2crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(pc_fighter);
	CreateInvItems(npc,itminugget,300);
	CreateInvItems(npc,itfo_potion_health_02,10);
	CreateInvItems(npc,itfo_potion_mana_02,5);
};

func void b_give_gornchapter3crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(pc_fighter);
	CreateInvItems(npc,itminugget,400);
	CreateInvItems(npc,itfo_potion_health_03,10);
	CreateInvItems(npc,itfo_potion_mana_03,5);
};

func void b_give_gornchapter4crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(pc_fighter);
	CreateInvItems(npc,itminugget,500);
	CreateInvItems(npc,itfo_potion_haste_01,5);
};

func void b_give_gornchapter5crap()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(pc_fighter);
	CreateInvItems(npc,itminugget,700);
	CreateInvItems(npc,itfo_potion_haste_02,10);
};

