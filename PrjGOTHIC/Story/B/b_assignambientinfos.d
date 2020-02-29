
func void b_assignambientinfos(var C_NPC amb_self)
{
	if((amb_self.npctype == NPCTYPE_AMBIENT) || (amb_self.npctype == NPCTYPE_GUARD))
	{
		if(amb_self.guild == GIL_VLK)
		{
			if(amb_self.voice == 1)
			{
				b_assignambientinfos_vlk_1(amb_self);
			}
			else if(amb_self.voice == 2)
			{
				b_assignambientinfos_vlk_2(amb_self);
			}
			else if(amb_self.voice == 3)
			{
				b_assignambientinfos_vlk_3(amb_self);
			}
			else if(amb_self.voice == 4)
			{
				b_assignambientinfos_vlk_4(amb_self);
			};
		}
		else if(amb_self.guild == GIL_GRD)
		{
			if(amb_self.voice == 6)
			{
				b_assignambientinfos_grd_6(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_grd_7(amb_self);
			}
			else if(amb_self.voice == 13)
			{
				b_assignambientinfos_grd_13(amb_self);
			};
		}
		else if(amb_self.guild == GIL_STT)
		{
			if(amb_self.voice == 10)
			{
				b_assignambientinfos_stt_10(amb_self);
			}
			else if(amb_self.voice == 12)
			{
				b_assignambientinfos_stt_12(amb_self);
			};
		}
		else if(amb_self.guild == GIL_SFB)
		{
			if(amb_self.voice == 1)
			{
				b_assignambientinfos_sfb_1(amb_self);
			}
			else if(amb_self.voice == 2)
			{
				b_assignambientinfos_sfb_2(amb_self);
			}
			else if(amb_self.voice == 5)
			{
				b_assignambientinfos_sfb_5(amb_self);
			};
		}
		else if(amb_self.guild == GIL_NOV)
		{
			if(amb_self.voice == 2)
			{
				b_assignambientinfos_nov_2(amb_self);
			}
			else if(amb_self.voice == 3)
			{
				b_assignambientinfos_nov_3(amb_self);
			}
			else if(amb_self.voice == 5)
			{
				b_assignambientinfos_nov_5(amb_self);
			};
		}
		else if(amb_self.guild == GIL_TPL)
		{
			if(amb_self.voice == 8)
			{
				b_assignambientinfos_tpl_8(amb_self);
			}
			else if(amb_self.voice == 13)
			{
				b_assignambientinfos_tpl_13(amb_self);
			};
		}
		else if(amb_self.guild == GIL_BAU)
		{
			if(amb_self.voice == 2)
			{
				b_assignambientinfos_bau_2(amb_self);
			}
			else if(amb_self.voice == 4)
			{
				b_assignambientinfos_bau_4(amb_self);
			}
			else if(amb_self.voice == 9)
			{
				b_assignambientinfos_bau_9(amb_self);
			};
		}
		else if(amb_self.guild == GIL_ORG)
		{
			if(amb_self.voice == 6)
			{
				b_assignambientinfos_org_6(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_org_7(amb_self);
			}
			else if(amb_self.voice == 13)
			{
				b_assignambientinfos_org_13(amb_self);
			};
		}
		else if(amb_self.guild == GIL_SLD)
		{
			if(amb_self.voice == 8)
			{
				b_assignambientinfos_sld_8(amb_self);
			}
			else if(amb_self.voice == 11)
			{
				b_assignambientinfos_sld_11(amb_self);
			};
		};
	};
	if((amb_self.npctype == NPCTYPE_MINE_AMBIENT) || (amb_self.npctype == NPCTYPE_MINE_GUARD))
	{
		if(amb_self.guild == GIL_VLK)
		{
			if(amb_self.voice == 1)
			{
				b_assignambientinfos_mine_vlk_1(amb_self);
			}
			else if(amb_self.voice == 2)
			{
				b_assignambientinfos_mine_vlk_2(amb_self);
			}
			else if(amb_self.voice == 3)
			{
				b_assignambientinfos_mine_vlk_3(amb_self);
			}
			else if(amb_self.voice == 4)
			{
				b_assignambientinfos_mine_vlk_4(amb_self);
			};
		}
		else if(amb_self.guild == GIL_GRD)
		{
			if(amb_self.voice == 6)
			{
				b_assignambientinfos_mine_grd_6(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_mine_grd_7(amb_self);
			}
			else if(amb_self.voice == 13)
			{
				b_assignambientinfos_mine_grd_13(amb_self);
			};
		}
		else if(amb_self.guild == GIL_SLD)
		{
			if(amb_self.voice == 8)
			{
				b_assignambientinfos_mine_sld_8(amb_self);
			}
			else if(amb_self.voice == 11)
			{
				b_assignambientinfos_mine_sld_11(amb_self);
			};
		}
		else if(amb_self.guild == GIL_ORG)
		{
			if(amb_self.voice == 6)
			{
				b_assignambientinfos_mine_org_6(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_mine_org_7(amb_self);
			}
			else if(amb_self.voice == 13)
			{
				b_assignambientinfos_mine_org_13(amb_self);
			};
		};
	};
};

