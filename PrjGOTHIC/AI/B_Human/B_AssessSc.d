
func void b_checkstolenequipment()
{
	var C_ITEM melee;
	var C_ITEM ranged;
	var C_ITEM armor;
	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);
	armor = Npc_GetEquippedArmor(other);
	if(Npc_OwnedByNpc(melee,self))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC trägt Nahkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(melee);
		if(!Npc_HasNews(self,NEWS_DEFEAT,other,self) && (self.aivar[AIV_PCISSTRONGER] == 0))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist nicht vom SC besiegt worden & hat noch nicht danach gefragt!");
			Npc_ClearAIQueue(self);
			c_lookatnpc(self,other);
			AI_TurnToNPC(self,other);
			AI_PointAtNpc(self,other);
			b_say(self,other,"$THATSMYWEAPON");
			AI_StartState(self,zs_getbackbelongings,1,"");
			return;
		};
	}
	else if(Npc_OwnedByNpc(ranged,self))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC trägt Fernkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(ranged);
		if(!Npc_HasNews(self,NEWS_DEFEAT,other,self) && (self.aivar[AIV_PCISSTRONGER] == 0))
		{
			Npc_ClearAIQueue(self);
			c_lookatnpc(self,other);
			AI_TurnToNPC(self,other);
			AI_PointAtNpc(self,other);
			b_say(self,other,"$THATSMYWEAPON");
			AI_StartState(self,zs_getbackbelongings,1,"");
			return;
		};
	};
};

func void b_assesssc()
{
	var C_NPC her;
	var C_NPC rock;
	printdebugnpc(PD_ZS_FRAME,"B_AssessSc");
	if(self.npctype == NPCTYPE_ROGUE)
	{
		b_setroguestohostile();
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC sichtbar und in Dialogreichweite!");
		her = Hlp_GetNpc(pc_hero);
		rock = Hlp_GetNpc(pc_rockefeller);
		if((Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero)) && (Hlp_GetInstanceID(rock) != Hlp_GetInstanceID(hero)) && Npc_IsInState(self,zs_guardpassage))
		{
			if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY && hero.guild != GIL_MEATBUG)
			{
				b_fullstop(self);
				b_say(self,other,"$NOWWAIT");
				b_intruderalert(self,other);
				b_setattackreason(self,AIV_AR_INTRUDER);
				Npc_SetTarget(self,other);
				AI_StartState(self,zs_attack,1,"");
			};
		};
		b_checkforimportantinfo(self,other);
		if(c_npcisinfightmode(other))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC im Kampfmodus!");
			b_assessfighter();
			return;
		};
		if(!c_bodystatecontains(other,BS_SNEAK))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC schleicht NICHT!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_OBSERVEINTRUDER)
			{
				printdebugnpc(PD_ZS_CHECK,"...SC in ObserveIntruder-Reichweite!");
				b_observeintruder();
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};
		b_checkstolenequipment();
	};
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) || (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC wurde von Durchgangswachen verwarnt!");
		printdebugint(PD_ZS_CHECK,"hero.aivar[AIV_GUARDPASSAGE_STATUS] = ",hero.aivar[AIV_GUARDPASSAGE_STATUS]);
		if((Npc_IsInState(self,zs_guardpassage) || Npc_IsInState(self,zs_guardpalisade)) && (Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_RESET))
		{
			printdebugnpc(PD_ZS_CHECK,"...Status für Durchgangswachen zurücksetzen!");
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
		};
	};
};

