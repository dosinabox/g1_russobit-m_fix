
func void b_orc_itemhorn()
{
	printdebugnpc(PD_TA_FRAME,"B_Orc_ItemHorn");
	if(Npc_HasItems(self,itmialarmhorn))
	{
		if(Npc_HasReadiedWeapon(self))
		{
			AI_RemoveWeapon(self);
		};
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itmialarmhorn,1);
		};
		AI_UseItemToState(self,itmialarmhorn,-1);
	};
};

func void b_orc_itemeat()
{
	printdebugnpc(PD_TA_FRAME,"B_Orc_ItemEat");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	if(Hlp_Random(10) < 5)
	{
		if(!Npc_HasItems(self,itfocheese))
		{
			CreateInvItem(self,itfocheese);
		};
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itfocheese,1);
		};
		AI_UseItemToState(self,itfocheese,-1);
	}
	else
	{
		if(!Npc_HasItems(self,itfoloaf))
		{
			CreateInvItem(self,itfoloaf);
		};
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itfoloaf,1);
		};
		AI_UseItemToState(self,itfoloaf,-1);
	};
};

func void b_orc_itempotion()
{
	printdebugnpc(PD_TA_FRAME,"B_Orc_ItemPotion");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	if(!Npc_HasItems(self,itfowine))
	{
		CreateInvItem(self,itfowine);
	};
	if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
	{
		//EquipItem(self,itfobeer);
		AI_UseItemToState(self,itfowine,1);
	};
	AI_UseItemToState(self,itfowine,-1);
};

