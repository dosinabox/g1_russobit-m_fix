
func void b_setbabedefaultperceptions()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,b_babe_refusetalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_babe_flee);
	Npc_PercEnable(self,PERC_DRAWWEAPON,zs_babe_flee);
};

