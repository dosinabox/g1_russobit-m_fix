
instance GRD_238_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 15;
	voice = 8;
	id = 238;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",14,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,itmw_1h_sword_02);
	CreateInvItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_238;
	fight_tactic = FAI_HUMAN_STRONG;
};


func void rtn_start_238()
{
	ta_guard(0,0,6,0,"SPAWN_PATH_GUARD1");
	ta_guard(6,0,24,0,"SPAWN_PATH_GUARD1");
};

instance INFO_GRD238_DIE(C_INFO)
{
	npc = grd_238_gardist;
	condition = info_grd238_die_condition;
	information = info_grd238_die_info;
	permanent = 0;
	important = 1;
};

func int info_grd238_die_condition()
{
	if(KAPITEL >= 4 && OC_BANNED == FALSE)
	{
		return TRUE;
	};
};

func void info_grd238_die_info()
{
	AI_GotoNpc(self,hero);
	if((OLDHEROGUILD == GIL_STT) || (OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF))
	{
		if(OLDHEROGUILD == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//Среди нас появился предатель! И мы еще называли тебя стражником!
		}
		else if(OLDHEROGUILD == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//Похоже, одного их мятежных магов Огня мы пропустили!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//Один из Призраков оказался предателем!
		};
		AI_Output(hero,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//О чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//Ты ведешь какие-то дела с Новым лагерем, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//Постой, но я все еще...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//А ты думал, что так будет продолжаться вечно?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//Прекрати нести весь этот вздор...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//Предателей обычно убивают.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//Так умри, предатель!
		if(Npc_KnowsInfo(hero,info_fletcher_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"Стражники у земель орков повели себя точно так же, как и Флетчер. Они что-то знают о том, что я ищу юниторы для Нового лагеря.");
		}
		else if(!Npc_KnowsInfo(hero,info_jackal_payday) && !Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_fletcher_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"Стражник у земель орков назвал меня предателем и перебежчиком. Без дальнейших разговоров он и его напарник напали на меня!");
			b_logentry(CH4_BANNEDFROMOC,"Кажется, меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if(c_npcbelongstonewcamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//И как это ты осмелился выйти из Нового лагеря? Неразумный поступок!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//И ты решился выйти из своего Болотного лагеря? Как глупо с твоей стороны!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//Что такое? О чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//Так ты ничего не слышал о нападении на Новую шахту, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//О чем ты...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//Прости, но мы не можем позволить тебе разгуливать здесь. Ты знаешь слишком много!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//Эй, я не хочу драться с тобой...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//Об этом раньше нужно было думать!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//Все, с меня хватит...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//И правда, хватит! Убить его!
	};
	if(GETNEWGUY_STARTED == TRUE)
	{
	    b_logentry(CH1_RECRUITDUSTY,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
	    Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_fletcher_die) && !Npc_KnowsInfo(hero,info_cutter_die))
	{
		b_logentry(CH4_FIREMAGES,"Стражники Старого лагеря нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
	b_exchangeroutine(grd_208_cutter,"FMTaken2");
	b_exchangeroutine(grd_232_gardist,"FMTaken2");
	b_exchangeroutine(grd_229_gardist,"FMTaken2");
	b_exchangeroutine(grd_216_torwache,"FMTaken2");
	b_exchangeroutine(grd_217_torwache,"FMTaken2");
	b_setpermattitude(grd_208_cutter,ATT_HOSTILE);
	b_setpermattitude(grd_232_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_229_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_216_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_217_torwache,ATT_HOSTILE);
};

instance INFO_GRD238_EXIT(C_INFO)
{
	npc = grd_238_gardist;
	nr = 999;
	condition = info_grd238_exit_condition;
	information = info_grd238_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int info_grd238_exit_condition()
{
	return 1;
};

func void info_grd238_exit_info()
{
	AI_StopProcessInfos(self);
};

