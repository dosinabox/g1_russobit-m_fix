
func void zs_healself()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	AI_StopLookAt(self);
	AI_RemoveWeapon(self);
	self.aivar[AIV_ITEMSTATUS] = 0;
};

func int zs_healself_loop()
{
	if((self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX]) || (self.flags == NPC_FLAG_IMMORTAL))
	{
		return LOOP_END;
	}
	else if(!c_bodystatecontains(self,BS_ITEMINTERACT))
	{
		if(!self.aivar[AIV_ITEMSTATUS])
		{
			if(Npc_HasItems(self,itfo_potion_health_03))
			{
				AI_UseItemToState(self,itfo_potion_health_03,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 1;
			}
			else if(Npc_HasItems(self,itfo_potion_health_02))
			{
				AI_UseItemToState(self,itfo_potion_health_02,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 2;
			}
			else if(Npc_HasItems(self,itfo_potion_health_01))
			{
				AI_UseItemToState(self,itfo_potion_health_01,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 3;
			}
			else if(Npc_HasItems(self,itfo_mutton_01))
			{
				AI_UseItemToState(self,itfo_mutton_01,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 4;
			}
			else if(Npc_HasItems(self,itfomutton))
			{
				AI_UseItemToState(self,itfomutton,0);
				AI_PlayAni(self,"T_MEAT_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 5;
			}
			else if(Npc_HasItems(self,itforice))
			{
				AI_UseItemToState(self,itforice,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 6;
			}
			else if(Npc_HasItems(self,itfosoup))
			{
				AI_UseItemToState(self,itfosoup,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 7;
			}
			else if(Npc_HasItems(self,itfomeatbugragout))
			{
				AI_UseItemToState(self,itfomeatbugragout,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 8;
			}
			else if(Npc_HasItems(self,itfocrawlersoup))
			{
				AI_UseItemToState(self,itfocrawlersoup,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 9;
			}
			else if(Npc_HasItems(self,itfocheese))
			{
				AI_UseItemToState(self,itfocheese,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 10;
			}
			else if(Npc_HasItems(self,itfoloaf))
			{
				AI_UseItemToState(self,itfoloaf,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 11;
			}
			else if(Npc_HasItems(self,itfoapple))
			{
				AI_UseItemToState(self,itfoapple,0);
				AI_PlayAni(self,"T_FOOD_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 12;
			}
			else
			{
				return LOOP_END;
			};
			AI_StandupQuick(self);
		}
		else
		{
			if(self.aivar[AIV_ITEMSTATUS] == 1)
			{
				Npc_RemoveInvItem(self,itfo_potion_health_03);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ELIXIER);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 2)
			{
				Npc_RemoveInvItem(self,itfo_potion_health_02);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_EXTRAKT);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 3)
			{
				Npc_RemoveInvItem(self,itfo_potion_health_01);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 4)
			{
				Npc_RemoveInvItem(self,itfo_mutton_01);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SCHINKEN);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 5)
			{
				Npc_RemoveInvItem(self,itfomutton);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FLEISCH);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 6)
			{
				Npc_RemoveInvItem(self,itforice);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_REIS);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 7)
			{
				Npc_RemoveInvItem(self,itfosoup);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WURZELSUPPE);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 8)
			{
				Npc_RemoveInvItem(self,itfomeatbugragout);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RAGOUT);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 9)
			{
				Npc_RemoveInvItem(self,itfocrawlersoup);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CRAWLERSUPPE);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 10)
			{
				Npc_RemoveInvItem(self,itfocheese);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_KÂSE);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 11)
			{
				Npc_RemoveInvItem(self,itfoloaf);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BROT);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 12)
			{
				Npc_RemoveInvItem(self,itfoapple);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_APFEL);
			};
			self.aivar[AIV_ITEMSTATUS] = 0;
			AI_Wait(self,0.3);
		};
	}
	else
	{
		AI_Wait(self,0.5);
	};
	return LOOP_CONTINUE;
};

func void zs_healself_end()
{
	self.aivar[AIV_ITEMSTATUS] = 0;
	AI_StartState(self,zs_healselfmana,1,"");
};

func void zs_healselfmana()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	AI_StopLookAt(self);
	AI_RemoveWeapon(self);
	self.aivar[AIV_ITEMSTATUS] = 0;
};

func int zs_healselfmana_loop()
{
	if(self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX])
	{
		return LOOP_END;
	}
	else if(!c_bodystatecontains(self,BS_ITEMINTERACT))
	{
		if(!self.aivar[AIV_ITEMSTATUS])
		{
			if(Npc_HasItems(self,itfo_potion_mana_03))
			{
				AI_UseItemToState(self,itfo_potion_mana_03,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 1;
			}
			else if(Npc_HasItems(self,itfo_potion_mana_02))
			{
				AI_UseItemToState(self,itfo_potion_mana_02,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 2;
			}
			else if(Npc_HasItems(self,itfo_potion_mana_01))
			{
				AI_UseItemToState(self,itfo_potion_mana_01,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 3;
			}
			else
			{
				return LOOP_END;
			};
			AI_StandupQuick(self);
		}
		else
		{
			if(self.aivar[AIV_ITEMSTATUS] == 1)
			{
				Npc_RemoveInvItem(self,itfo_potion_mana_03);
				Npc_ChangeAttribute(self,ATR_MANA,MANA_ELIXIER);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 2)
			{
				Npc_RemoveInvItem(self,itfo_potion_mana_02);
				Npc_ChangeAttribute(self,ATR_MANA,MANA_EXTRAKT);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 3)
			{
				Npc_RemoveInvItem(self,itfo_potion_mana_01);
				Npc_ChangeAttribute(self,ATR_MANA,MANA_ESSENZ);
			};
			self.aivar[AIV_ITEMSTATUS] = 0;
			AI_Wait(self,0.3);
		};
	}
	else
	{
		AI_Wait(self,0.5);
	};
	return LOOP_CONTINUE;
};

func void zs_healselfmana_end()
{
	self.aivar[AIV_ITEMSTATUS] = 0;
};

