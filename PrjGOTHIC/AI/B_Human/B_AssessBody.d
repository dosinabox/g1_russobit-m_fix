
func void b_assessbody()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessBody");
	printglobals(PD_ZS_CHECK);
	if(Npc_GetDistToNpc(self,other) < 1000)
	{
		printdebugnpc(PD_ZS_CHECK,"...Kцrper nдher als 10m!");
		b_fullstop(self);
		AI_StartState(self,zs_assessbody,0,"");
	};
};

func void zs_assessbody()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		printdebugnpc(PD_ZS_CHECK,"...Kцrper bereits geplьndert!");
		AI_ContinueRoutine(self);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		printdebugnpc(PD_ZS_CHECK,"...Kцrper zu weit weg!");
		AI_ContinueRoutine(self);
	};
};

func int zs_assessbody_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessBody_Loop");
	b_fullstop(self);
	AI_GotoNpc(self,other);
	return LOOP_END;
};

func void zs_assessbody_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody_End");
	if(self.id == 251 && (ARENA_BET_KIRGO == TRUE || ARENA_BET_KHARIM == TRUE || ARENA_BET_GORHANIS == TRUE))
	{
		ARENA_BET_KIRGO_WON = TRUE;
		//PrintScreen("Победил Кирго!",-1,-1,"font_old_20_white.tga",3);
		b_removeweapon(self);
		b_exchangeroutine(tpl_1422_gorhanis,"wait");
		b_exchangeroutine(sld_729_kharim,"wait");
		b_exchangeroutine(grd_251_kirgo,"wait");
	};
	if(self.id == 729 && (ARENA_BET_KIRGO == TRUE || ARENA_BET_KHARIM == TRUE || ARENA_BET_GORHANIS == TRUE))
	{
		ARENA_BET_KHARIM_WON = TRUE;
		//PrintScreen("Победил Карим!",-1,-1,"font_old_20_white.tga",3);
		b_removeweapon(self);
		b_exchangeroutine(tpl_1422_gorhanis,"wait");
		b_exchangeroutine(sld_729_kharim,"wait");
		b_exchangeroutine(grd_251_kirgo,"wait");
	};
	if(self.id == 1422 && (ARENA_BET_KIRGO == TRUE || ARENA_BET_KHARIM == TRUE || ARENA_BET_GORHANIS == TRUE))
	{
		ARENA_BET_GORHANIS_WON = TRUE;
		//PrintScreen("Победил Гор Ханис!",-1,-1,"font_old_20_white.tga",3);
		b_removeweapon(self);
		b_exchangeroutine(tpl_1422_gorhanis,"wait");
		b_exchangeroutine(sld_729_kharim,"wait");
		b_exchangeroutine(grd_251_kirgo,"wait");
	};
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine(self);
	};
	if((Hlp_GetInstanceID(vlk_505_buddler) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(vlk_506_buddler) == Hlp_GetInstanceID(self)) && LETTER_TOLD == 2)
	{
		AI_PlayAni(self,"T_PLUNDER");
		if(Npc_HasItems(hero,itwr_fire_letter_01))
		{
			PrintScreen("Отобрано запечатанное письмо.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(hero,itwr_fire_letter_01);
			if(b_plunder())
			{
				b_say(self,other,"$GotLetterGotOre");
			}
			else
			{
				b_say(self,other,"$GotLetterNoOre");
			};
			AI_SetWalkMode(self,NPC_RUN);
			self.guild = GIL_VLK;
			Npc_SetTrueGuild(self,GIL_VLK);
			AI_GotoWP(self,"OCC_CENTER_2");
			LETTER_TOLD = 3;
			CreateInvItems(self,itminugget,120);
			if(PYROCAR_MESSENGER == LOG_RUNNING)
			{
				b_logentry(KDFLETTER,"У меня украли письмо! Не стоило болтать о нем кому попало...");
				Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
				PYROCAR_MESSENGER = LOG_FAILED;
			};
			CreateInvItem(kdf_402_corristo,itwr_fire_letter_02);
		}
		else if(Npc_HasItems(hero,itwr_fire_letter_02))
		{
			PrintScreen("Отобрано письмо.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(hero,itwr_fire_letter_02);
			if(b_plunder())
			{
				b_say(self,other,"$GotLetterGotOre");
			}
			else
			{
				b_say(self,other,"$GotLetterNoOre");
			};
			AI_SetWalkMode(self,NPC_RUN);
			self.guild = GIL_VLK;
			Npc_SetTrueGuild(self,GIL_VLK);
			AI_GotoWP(self,"OCC_CENTER_2");
			LETTER_TOLD = 3;
			CreateInvItems(self,itminugget,30);
			if(PYROCAR_MESSENGER == LOG_RUNNING)
			{
				b_logentry(KDFLETTER,"У меня украли письмо! Не стоило болтать о нем кому попало...");
				Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
				PYROCAR_MESSENGER = LOG_FAILED;
			};
			CreateInvItem(kdf_402_corristo,itwr_fire_letter_02);
		}
		else if(b_plunder())
		{
			b_say(self,other,"$NoLetterGotOre");
		}
		else
		{
			b_say(self,other,"$NoLetterNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	}
	else if(Hlp_GetInstanceID(org_888_erpresser) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_889_coerpresser) == Hlp_GetInstanceID(self))
	{
		AI_PlayAni(self,"T_PLUNDER");
		if(Npc_HasItems(hero,itmi_amulet_psi_01))
		{
			CreateInvItem(self,itmi_amulet_psi_01);
			Npc_RemoveInvItem(other,itmi_amulet_psi_01);
			PrintScreen("Отобран амулет Братства.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			if(Npc_KnowsInfo(other,quentin_dia2) && !Npc_KnowsInfo(other,quentin_dia3) && QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING && !Npc_IsDead(other))
			{
				b_logentry(QUENTIN_GANG,"Отморозки около Нового лагеря отобрали у меня амулет Братства! Мне нужно вернуть его, если я хочу завершить задание Квентина.");
			};
		};
		if(b_plunder())
		{
			b_say(self,other,"$ITookYourOre");
		}
		else
		{
			b_say(self,other,"$ShitNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	}
	else if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npctype != NPCTYPE_FRIEND) && c_npcishuman(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...kein purer Fernkдmpfer und kein NSC-Freund!");
		AI_PlayAni(self,"T_PLUNDER");
		if(b_plunder())
		{
			b_say(self,other,"$ITookYourOre");
		}
		else
		{
			b_say(self,other,"$ShitNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	};
	if(self.id != 251 && self.id != 729 && self.id != 1422)
	{
		AI_StartState(self,zs_assessbody_recoverweapon,1,"");
	};
};

func void zs_assessbody_recoverweapon()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessBody_RecoverWeapon");
	b_setperception(self);
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) < 300)
			{
				printdebugnpc(PD_ZS_CHECK,"...Nah- oder Fernkampfwaffe gefunden!");
				AI_TakeItem(self,item);
				AI_EquipBestMeleeWeapon(self);
				AI_EquipBestRangedWeapon(self);
				b_say(self,other,"$ITakeYourWeapon");
			};
		};
	};
	AI_StartState(self,zs_healself,1,"");
};

