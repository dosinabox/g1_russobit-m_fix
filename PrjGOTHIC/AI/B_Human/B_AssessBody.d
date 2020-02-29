
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

func int b_sayplunder()
{
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

func int b_checkitems_orik()
{
	if(Npc_HasItems(other,orik_key) || Npc_HasItems(other,oriks_axt))
	{
		b_say(self,other,"$YouStoleFromMe");
		if(Npc_HasItems(other,orik_key))
		{
			PrintScreen("Орик забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,orik_key);
			CreateInvItem(self,orik_key);
		};
		if(Npc_HasItems(other,oriks_axt))
		{
			PrintScreen("Орик забрал свой топор.",-1,43,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,oriks_axt);
			CreateInvItem(self,oriks_axt);
			AI_EquipBestMeleeWeapon(self);
		};
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_lord()
{
	if(Npc_HasItems(other,itkey_rb_01) || Npc_HasItems(other,heerscherstab))
	{
		b_say(self,other,"$YouStoleFromMe");
		if(Npc_HasItems(other,itkey_rb_01))
		{
			PrintScreen("Лорд забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,itkey_rb_01);
		};
		if(Npc_HasItems(other,heerscherstab))
		{
			PrintScreen("Лорд забрал свой посох.",-1,43,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,heerscherstab);
			CreateInvItem(self,heerscherstab);
			AI_EquipBestMeleeWeapon(self);
		};
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_cavalorn()
{
	if(Npc_HasItems(other,itkecavalorn01))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Кавалорн забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itkecavalorn01);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_whistler()
{
	if(Npc_HasItems(other,whistlers_schwert))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Уистлер забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,whistlers_schwert);
		CreateInvItem(self,whistlers_schwert);
		AI_EquipBestMeleeWeapon(self);
		if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (KAPITEL == 1))
		{
			WHISTLER_BUYMYSWORD = LOG_FAILED;
			b_logentry(CH1_JOINOC,"Я все испортил. Уистлер рассержен на меня.");
		};
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_aaron()
{
	if(Npc_HasItems(other,itke_om_02))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Аарон забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itke_om_02);
		CreateInvItem(self,itke_om_02);
		AARON_KEY_TAKEN = TRUE;
		b_logentry(CH2_SNIPESDEAL,"Аарон забрал у меня свой ключ...");
		Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_FAILED);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_ulbert()
{
	if(Npc_HasItems(other,itke_om_03))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Ульберт забрал ключ от склада.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itke_om_03);
		CreateInvItem(self,itke_om_03);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_bartholo()
{
	if(Npc_HasItems(other,itke_storage_01))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Бартоло забрал ключ от склада.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itke_storage_01);
		if(!Npc_HasItems(self,itke_storage_01))
		{
			CreateInvItem(self,itke_storage_01);
		};
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_grd279()
{
	if(Npc_HasItems(other,itke_weaponry))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Стражник забрал ключ от оружейной.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itke_weaponry);
		CreateInvItem(self,itke_weaponry);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_scar()
{
	if(Npc_HasItems(other,scars_schwert))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Шрам забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,scars_schwert);
		CreateInvItem(self,scars_schwert);
		AI_EquipBestMeleeWeapon(self);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_arto()
{
	if(Npc_HasItems(other,artos_schwert))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Арто забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,artos_schwert);
		CreateInvItem(self,artos_schwert);
		AI_EquipBestMeleeWeapon(self);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_stone()
{
	if(Npc_HasItems(other,itkey_ob_smith_01))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Стоун забрал железный ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itkey_ob_smith_01);
		CreateInvItem(self,itkey_ob_smith_01);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_kalom()
{
	if(Npc_HasItems(other,kalomsrecipe))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Кор Галом забрал свой рецепт.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,kalomsrecipe);
		CreateInvItem(self,kalomsrecipe);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_torlof()
{
	if(Npc_HasItems(other,torlofs_axt))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Торлоф забрал свой топор.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,torlofs_axt);
		CreateInvItem(self,torlofs_axt);
		AI_EquipBestMeleeWeapon(self);
		b_plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func int b_checkitems_cord()
{
	if(Npc_HasItems(other,cords_spalter))
	{
		b_say(self,other,"$YouStoleFromMe");
		PrintScreen("Корд забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,cords_spalter);
		CreateInvItem(self,cords_spalter);
		AI_EquipBestMeleeWeapon(self);
		b_plunder();
	}
	else
	{
		b_sayplunder();
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
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine(self);
	};
	AI_PlayAni(self,"T_PLUNDER");
	if((Hlp_GetInstanceID(vlk_505_buddler) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(vlk_506_buddler) == Hlp_GetInstanceID(self)) && LETTER_TOLD == 2)
	{
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
		GOPSTOPPED_BRIDGE = FALSE;
		b_sayplunder();
	}
	else if(Hlp_GetInstanceID(sld_701_orik) == Hlp_GetInstanceID(self))
	{
		b_checkitems_orik();
	}
	else if(Hlp_GetInstanceID(bau_900_ricelord) == Hlp_GetInstanceID(self))
	{
		b_checkitems_lord();
	}
	else if(Hlp_GetInstanceID(stt_336_cavalorn) == Hlp_GetInstanceID(self))
	{
		b_checkitems_cavalorn();
	}
	else if(Hlp_GetInstanceID(stt_309_whistler) == Hlp_GetInstanceID(self))
	{
		b_checkitems_whistler();
	}
	else if(Hlp_GetInstanceID(grd_262_aaron) == Hlp_GetInstanceID(self))
	{
		b_checkitems_aaron();
	}
	else if(Hlp_GetInstanceID(grd_271_ulbert) == Hlp_GetInstanceID(self))
	{
		b_checkitems_ulbert();
	}
	else if(Hlp_GetInstanceID(ebr_598_bartholo) == Hlp_GetInstanceID(self))
	{
		b_checkitems_bartholo();
	}
	else if(Hlp_GetInstanceID(ebr_106_bartholo) == Hlp_GetInstanceID(self))
	{
		b_checkitems_bartholo();
	}
	else if(Hlp_GetInstanceID(grd_279_gardist) == Hlp_GetInstanceID(self))
	{
		b_checkitems_grd279();
	}
	else if(Hlp_GetInstanceID(ebr_101_scar) == Hlp_GetInstanceID(self))
	{
		b_checkitems_scar();
	}
	else if(Hlp_GetInstanceID(ebr_102_arto) == Hlp_GetInstanceID(self))
	{
		b_checkitems_arto();
	}
	else if(Hlp_GetInstanceID(grd_219_stone) == Hlp_GetInstanceID(self))
	{
		b_checkitems_stone();
	}
	else if(Hlp_GetInstanceID(gur_1201_corkalom) == Hlp_GetInstanceID(self))
	{
		b_checkitems_kalom();
	}
	else if(Hlp_GetInstanceID(sld_737_torlof) == Hlp_GetInstanceID(self))
	{
		b_checkitems_torlof();
	}
	else if(Hlp_GetInstanceID(sld_709_cord) == Hlp_GetInstanceID(self))
	{
		b_checkitems_cord();
	}
	else if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npctype != NPCTYPE_FRIEND) && c_npcishuman(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...kein purer Fernkдmpfer und kein NSC-Freund!");
		b_sayplunder();
	};
	AI_StartState(self,zs_assessbody_recoverweapon,1,"");
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
				if((self.id == 1422 || self.id == 251 || self.id == 729))
				{
					if(Npc_OwnedByNpc(item,self))
					{
						AI_TakeItem(self,item);
						AI_EquipBestMeleeWeapon(self);
					};
				}
				else
				{
					AI_TakeItem(self,item);
					AI_EquipBestMeleeWeapon(self);
					AI_EquipBestRangedWeapon(self);
					b_say(self,other,"$ITakeYourWeapon");
				};
			};
		};
	};
	AI_StartState(self,zs_healself,1,"");
};

