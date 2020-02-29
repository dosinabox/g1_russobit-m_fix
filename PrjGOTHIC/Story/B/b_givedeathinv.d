
func void b_givedeathinv()
{
	if(self.aivar[AIV_MISSION1])
	{
		return;
	};
	if(self.aivar[AIV_IMPORTANT] == ID_SKELETONMAGE)
	{
		Npc_RemoveInvItem(self,itarrune_3_1_thunderbolt);
		Npc_RemoveInvItems(self,itarscrollsummonskeletons,Npc_HasItems(self,itarscrollsummonskeletons));
	};
	if(KNOWS_GETTEETH == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_WOLF)
		{
			CreateInvItems(self,itat_teeth_01,2);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_BLACKWOLF)
		{
			CreateInvItems(self,itat_teeth_01,2);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SNAPPER)
		{
			CreateInvItems(self,itat_teeth_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_ORCBITER)
		{
			CreateInvItems(self,itat_teeth_01,2);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_teeth_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_BLOODHOUND)
		{
			CreateInvItems(self,itat_teeth_01,4);
		};
	};
	if(KNOWS_GETCLAWS == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_WARAN)
		{
			CreateInvItems(self,itat_claws_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_FIREWARAN)
		{
			CreateInvItems(self,itat_claws_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SNAPPER)
		{
			CreateInvItems(self,itat_claws_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_RAZOR)
		{
			CreateInvItems(self,itat_claws_01,3);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_ORCBITER)
		{
			CreateInvItems(self,itat_claws_01,2);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_LURKER && self.level == 17)
		{
			CreateInvItems(self,itat_lurker_01,2);
		};
	};
	if(KNOWS_GETFUR == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_WOLF)
		{
			CreateInvItems(self,itat_wolf_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_BLACKWOLF)
		{
			CreateInvItems(self,itat_wolf_02,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_shadow_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_TROLL)
		{
			CreateInvItems(self,itat_troll_01,1);
		};
	};
	if(KNOWS_GETHIDE == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_LURKER)
		{
			CreateInvItems(self,itat_lurker_02,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,itat_swampshark_01,1);
		};
	};
	if(KNOWS_GETMCMANDIBLES == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLER)
		{
			CreateInvItems(self,itat_crawler_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,itat_crawler_01,1);
		};
	};
	if(KNOWS_GETMCPLATES == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,itat_crawler_02,2);
		};
	};
	if(KNOWS_GETBFSTING == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_BLOODFLY)
		{
			CreateInvItems(self,itat_bloodfly_02,1);
		};
	};
	if(KNOWS_GETULUMULU == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_FIREWARAN)
		{
			CreateInvItems(self,itat_waran_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_shadow_02,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,itat_swampshark_02,3);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_TROLL)
		{
			CreateInvItems(self,itat_troll_02,2);
		};
	};
	self.aivar[AIV_MISSION1] = TRUE;
};

