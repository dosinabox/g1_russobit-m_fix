
instance FOCUS_NORMAL(C_FOCUS)
{
	npc_longrange = 500;
	npc_range1 = 0;
	npc_range2 = 300;
	npc_azi = 45;
	npc_elevup = 45;
	npc_elevdo = -45;
	npc_prio = 0;
	item_range1 = 0;
	item_range2 = 400;
	item_azi = 40;
	item_elevup = 10;
	item_elevdo = -90;
	item_prio = 1;
	mob_range1 = 0;
	mob_range2 = 350;
	mob_azi = 45;
	mob_elevup = 60;
	mob_elevdo = -90;
	mob_prio = 0;
};

instance FOCUS_MELEE(C_FOCUS)
{
	npc_range1 = 0;
	npc_range2 = 500;
	npc_azi = 45;
	npc_elevup = 45;
	npc_elevdo = -60;
	npc_prio = 1;
	item_prio = -1;
	mob_range1 = 0;
	mob_range2 = 150;
	mob_azi = 30;
	mob_elevup = 45;
	mob_elevdo = -45;
	mob_prio = -1;
};

instance FOCUS_RANGED(C_FOCUS)
{
	npc_range1 = 0;
	npc_range2 = 3000;
	npc_azi = 45;
	npc_elevup = 45;
	npc_elevdo = -45;
	npc_prio = 1;
	item_range1 = 0;
	item_range2 = 3000;
	item_azi = 45;
	item_elevup = 45;
	item_elevdo = -45;
	item_prio = -1;
	mob_range1 = 0;
	mob_range2 = 3000;
	mob_azi = 45;
	mob_elevup = 45;
	mob_elevdo = -45;
	mob_prio = -1;
};

instance FOCUS_THROW_ITEM(C_FOCUS)
{
	npc_range1 = 300;
	npc_range2 = 1500;
	npc_azi = 20;
	npc_elevup = 45;
	npc_elevdo = -45;
	item_range1 = 300;
	item_range2 = 1500;
	item_azi = 20;
	item_elevup = 45;
	item_elevdo = -45;
	mob_range1 = 300;
	mob_range2 = 1500;
	mob_azi = 20;
	mob_elevup = 45;
	mob_elevdo = -45;
};

instance FOCUS_THROW_MOB(C_FOCUS)
{
	npc_range1 = 50;
	npc_range2 = 200;
	npc_azi = 20;
	npc_elevup = 45;
	npc_elevdo = -45;
	item_range1 = 50;
	item_range2 = 200;
	item_azi = 20;
	item_elevup = 45;
	item_elevdo = -45;
	mob_range1 = 50;
	mob_range2 = 200;
	mob_azi = 20;
	mob_elevup = 45;
	mob_elevdo = -45;
};

instance FOCUS_MAGIC(C_FOCUS)
{
	npc_range1 = 0;
	npc_range2 = 3000;
	npc_azi = 45;
	npc_elevup = 45;
	npc_elevdo = -45;
	npc_prio = 1;
	item_range1 = 0;
	item_range2 = 3000;
	item_azi = 45;
	item_elevup = 45;
	item_elevdo = -45;
	item_prio = 0;
	mob_range1 = 0;
	mob_range2 = 3000;
	mob_azi = 45;
	mob_elevup = 45;
	mob_elevdo = -45;
	mob_prio = 0;
};

