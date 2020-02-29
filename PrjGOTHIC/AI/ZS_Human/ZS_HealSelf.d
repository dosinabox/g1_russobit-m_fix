
func void zs_healself()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_HealSelf");
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
	printglobals(PD_ZS_CHECK);
};

func int zs_healself_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_HealSelf_Loop");
	if((self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX]) || (self.flags == NPC_FLAG_IMMORTAL))
	{
		printdebugnpc(PD_ZS_CHECK,"...vollständig geheilt!");
		return LOOP_END;
	}
	else if(Npc_HasItems(self,itfo_potion_health_03) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_health_03.description);
		AI_UseItem(self,itfo_potion_health_03);
	}
	else if(Npc_HasItems(self,itfo_potion_health_02) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_health_02.description);
		AI_UseItem(self,itfo_potion_health_02);
	}
	else if(Npc_HasItems(self,itfo_potion_health_01) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_health_01.description);
		AI_UseItem(self,itfo_potion_health_01);
	}
	else if(Npc_GetInvItemBySlot(self,INV_FOOD,1) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",item.description);
		AI_UseItem(self,item);
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...keine weiteren Heilmittel vorhanden!");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_healself_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_HealSelf_End");
	AI_StartState(self,zs_healselfmana,1,"");
};

func void zs_healselfmana()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_HealSelfMana");
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
};

func int zs_healselfmana_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_HealSelfMana_Loop");
	if(self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX])
	{
		printdebugnpc(PD_ZS_CHECK,"...Mana voll regeneriert!");
		return LOOP_END;
	}
	else if(Npc_HasItems(self,itfo_potion_mana_03) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_mana_03.description);
		AI_UseItem(self,itfo_potion_mana_03);
	}
	else if(Npc_HasItems(self,itfo_potion_mana_02) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_mana_02.description);
		AI_UseItem(self,itfo_potion_mana_02);
	}
	else if(Npc_HasItems(self,itfo_potion_mana_01) > 0)
	{
		printdebugstring(PD_ZS_CHECK,"...",itfo_potion_mana_01.description);
		AI_UseItem(self,itfo_potion_mana_01);
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...keine 'Mana-Regenerierungs-Mittel' mehr vorhanden!");
		return LOOP_END;
	};
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void zs_healselfmana_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_HealSelfMana_End");
};

