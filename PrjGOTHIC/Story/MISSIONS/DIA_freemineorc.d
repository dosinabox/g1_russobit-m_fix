
instance INFO_FREEMINEORC_EXIT(C_INFO)
{
	npc = freemineorc;
	nr = 999;
	condition = info_freemineorc_exit_condition;
	information = info_freemineorc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_freemineorc_exit_condition()
{
	return 1;
};

func void info_freemineorc_exit_info()
{
	if(!Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Я должен уходить!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Чужак идти еще!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. А теперь мне нужно уходить.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Хорошая дорога чужак!
	};
	if(Npc_HasItems(self,ulumulu))
	{
		Npc_RemoveInvItem(self,ulumulu);
	};
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_INTRO(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_intro_condition;
	information = info_freemineorc_intro_info;
	important = 1;
	permanent = 0;
};


func int info_freemineorc_intro_condition()
{
	return TRUE;
};

func void info_freemineorc_intro_info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Таррок нужный помочь! Таррок ранить!
};


instance INFO_FREEMINEORC_WASPASSIERT(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_waspassiert_condition;
	information = info_freemineorc_waspassiert_info;
	important = 0;
	permanent = 0;
	description = "Что случилось?";
};


func int info_freemineorc_waspassiert_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_waspassiert_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Что случилось?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Таррок закрытый здесь синий солдаты. Потом везде идти красный солдаты.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Красный солдаты всех убить.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Таррок убежать сюда. Красный солдаты не ходить сюда. Они бояться ГАХ ЛУГ.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Помощь, помочь, Таррок ранить.
};


instance INFO_FREEMINEORC_WASTUN(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_wastun_condition;
	information = info_freemineorc_wastun_info;
	important = 0;
	permanent = 0;
	description = "Чем я могу помочь тебе?";
};


func int info_freemineorc_wastun_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_waspassiert))
	{
		return TRUE;
	};
};

func void info_freemineorc_wastun_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Чем я могу помочь тебе?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Таррок нужный сильный зелье. А то Таррок умереть.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//Какое тебе нужно зелье?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//ГАХ ЛУГ травить Таррок. Таррок нужный зелье.
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//Таррок был зелье, но потом теряй. Таррок не найти!
};


instance INFO_FREEMINEORC_OFFER(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_offer_condition;
	information = info_freemineorc_offer_info;
	important = 0;
	permanent = 0;
	description = "Я постараюсь найти его тебе!";
};


func int info_freemineorc_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_wastun) && !Npc_KnowsInfo(hero,info_freemineorc_givepotion) && !Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_offer_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Я постараюсь найти его тебе!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Таррок слабый очень. Чужак быстрый, а то Таррок умереть.
	AI_StopProcessInfos(self);
	b_story_foundorcslave();
};


instance INFO_FREEMINEORC_CRAWLER(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_crawler_condition;
	information = info_freemineorc_crawler_info;
	important = 0;
	permanent = 0;
	description = "Что такое Гах Луг?";
};


func int info_freemineorc_crawler_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_waspassiert))
	{
		return TRUE;
	};
};

func void info_freemineorc_crawler_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Что такое Гах Луг?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Там много больший зверь, много ног.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//ГАХ ЛУГ опасный! Хотеть есть люди и орки.
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Так ты говоришь о ползунах, я правильно понял?
};


instance INFO_FREEMINEORC_TONGUE(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_tongue_condition;
	information = info_freemineorc_tongue_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь говорить на нашем языке?";
};


func int info_freemineorc_tongue_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_tongue_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Ты можешь говорить на нашем языке?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Таррок раб солдаты много дни. Таррок слушать люди.
};


instance INFO_FREEMINEORC_SEARCHPOTION(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_searchpotion_condition;
	information = info_freemineorc_searchpotion_info;
	important = 0;
	permanent = 1;
	description = "Я не могу найти твое зелье!";
};


func int info_freemineorc_searchpotion_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_offer) && !Npc_KnowsInfo(hero,info_freemineorc_givepotion) && !Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_searchpotion_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Я не могу найти твое зелье!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Чужак искать еще! Зелье быть здесь.
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Таррок бежать от ГАХ ЛУГ! Таррок спрятаться потом!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Чужак искать и ниша!
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_SUCHEULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_sucheulumulu_condition;
	information = info_freemineorc_sucheulumulu_info;
	important = 0;
	permanent = 0;
	description = "Ты, случайно, не друг шамана Ур-Шака?";
};


func int info_freemineorc_sucheulumulu_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_sucheulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Ты, случайно, не друг шамана Ур-Шака?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ур-Шак раб как Таррок. Ур-Шак бежать! Бежать много зима назад!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Твой друг сказал мне, что ты можешь сделать для меня Улу-Мулу.
	if(FREEMINEORC_SUCHEPOTION == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Чужак помогать Таррок, Таррок помогать чужак!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Таррок очень слабый. Нет зелье... Таррок умереть.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Чужак принести зелье, а Таррок помогать.
	};
};


instance INFO_FREEMINEORC_GIVEPOTION(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_givepotion_condition;
	information = info_freemineorc_givepotion_info;
	important = 0;
	permanent = 0;
	description = "Вот, я нашел тебе зелье!";
};


func int info_freemineorc_givepotion_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_wastun) && Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_givepotion_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Вот, я нашел тебе зелье!
	b_printtrademsg1("Отдано зелье орка.");
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Чужак не плохой, как другой солдат! Чужак хороший!
	b_giveinvitems(hero,self,orcmedicine,1);
	EquipItem(self,orcmedicine);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
		//AI_Standup(self);
		//AI_TurnToNPC(self,hero);
	};
	//AI_UseItemToState(self,orcmedicine,1);
	//AI_UseItemToState(self,orcmedicine,-1);
	AI_PlayAniBS(self,"T_POTIONFAST_S0_2_STAND",BS_ITEMINTERACT);
	AI_UseItem(self,orcmedicine);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Таррок сказать спасибо!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//А ты можешь дать мне Улу-Мулу?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Чужак помогать Таррок, Таррок помогать чужак!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Чужак надо КРОТАК, ХАЗ-ТАК, ДВАХКАРР и ОРФ-АНТАК.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Чужак принести это и Таррок делать Улу-Мулу.
	if(!Npc_KnowsInfo(hero,info_freemineorc_offer))
	{
		b_story_foundorcslave();
	};
	b_story_curedorc();
};


instance INFO_FREEMINEORC_FIREWARAN(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_firewaran_condition;
	information = info_freemineorc_firewaran_info;
	important = 0;
	permanent = 0;
	description = "Что такое Кротак?";
};


func int info_freemineorc_firewaran_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_firewaran_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Что такое Кротак?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//Язык огня! Быть язык ящерица огня!
};


instance INFO_FREEMINEORC_FIREWARAN2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_firewaran2_condition;
	information = info_freemineorc_firewaran2_info;
	important = 0;
	permanent = 0;
	description = "А где живут эти ящерицы огня?";
};


func int info_freemineorc_firewaran2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_firewaran) && !Npc_HasItems(hero,itat_waran_01) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_firewaran2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//А где живут эти ящерицы огня?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Ящерица огня жить дома. Дома Таррок. Чужак хорошо искать!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Еще есть ящерица огня возле большая вода.
	b_logentry(CH4_ULUMULU,"Чтобы сделать Улу-Мулу, Тарроку нужен язык огненной ящерицы. Такие ящерицы живут в землях орков и на песчаных берегах водоемов. Быть может, я даже видел одно такое место...");
};


instance INFO_FREEMINEORC_SHADOWBEAST(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_shadowbeast_condition;
	information = info_freemineorc_shadowbeast_info;
	important = 0;
	permanent = 0;
	description = "Что значит Хаз-Так?";
};


func int info_freemineorc_shadowbeast_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_shadowbeast_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Что значит Хаз-Так?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//Рог мракорис. Острый как нож, твердый как камень.
};


instance INFO_FREEMINEORC_SHADOWBEAST2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_shadowbeast2_condition;
	information = info_freemineorc_shadowbeast2_info;
	important = 0;
	permanent = 0;
	description = "Где я смогу найти мракорисов?";
};


func int info_freemineorc_shadowbeast2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_shadowbeast) && !Npc_HasItems(hero,itat_shadow_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_shadowbeast2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Где я смогу найти мракорисов?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//Жить в лес или пещера. Не любить свет.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Очень опасный. Чужак быть осторожный!
	b_logentry(CH4_ULUMULU,"Я должен принести Тарроку рог мракориса. Они живут в темных пещерах и лесах. Насколько я знаю, между Старым и Болотным лагерями есть очень темный густой лес.");
};


instance INFO_FREEMINEORC_SWAMPSHARK(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_swampshark_condition;
	information = info_freemineorc_swampshark_info;
	important = 0;
	permanent = 0;
	description = "Двахкарр? А что это такое?";
};


func int info_freemineorc_swampshark_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_swampshark_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//Двахкарр? А что это такое?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Зуб от болотожор. Когда он кусать, никто больше не убегать.
};


instance INFO_FREEMINEORC_SWAMPSHARK2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_swampshark2_condition;
	information = info_freemineorc_swampshark2_info;
	important = 0;
	permanent = 0;
	description = "Где живут болотожоры?";
};


func int info_freemineorc_swampshark2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_swampshark) && !Npc_HasItems(hero,itat_swampshark_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_swampshark2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Где живут болотожоры?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Много звери где лагерь людей. Лагерь на болоте!
	b_logentry(CH4_ULUMULU,"Я должен добыть для Таррока клыки болотожора. Эти чудовища в огромных количествах водятся в болотах возле Лагеря Братства.");
};


instance INFO_FREEMINEORC_TROLL(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_troll_condition;
	information = info_freemineorc_troll_info;
	important = 0;
	permanent = 0;
	description = "Что такое Орф-Антак?";
};


func int info_freemineorc_troll_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_troll_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Что такое Орф-Антак?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//Зуб большой тролль! Далать дырка насквозь!
};


instance INFO_FREEMINEORC_TROLL2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_troll2_condition;
	information = info_freemineorc_troll2_info;
	important = 0;
	permanent = 0;
	description = "А где можно найти тролля?";
};


func int info_freemineorc_troll2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_troll) && !Npc_HasItems(hero,itat_troll_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_troll2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//А где можно найти тролля?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Тролль жить где горы! Любить много места!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Чужак искать в горы на север! Только бояться кулак тролль!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Кулак бить, чужак падать вниз!
	b_logentry(CH4_ULUMULU,"Для Улу-Мулу Тарроку нужно принести клык тролля. Эти огромные твари живут в горах колонии. Мне стоит поискать их именно там.");
};


instance INFO_FREEMINEORC_LOOKINGULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_lookingulumulu_condition;
	information = info_freemineorc_lookingulumulu_info;
	important = 0;
	permanent = 1;
	description = "Я еще не все собрал.";
};


func int info_freemineorc_lookingulumulu_condition()
{
	if((FREEMINEORC_LOOKINGULUMULU == LOG_RUNNING) && (!Npc_HasItems(hero,itat_waran_01) || !Npc_HasItems(hero,itat_shadow_02) || !Npc_HasItems(hero,itat_swampshark_02) || !Npc_HasItems(hero,itat_troll_02)) && Npc_KnowsInfo(hero,info_freemineorc_firewaran2) && Npc_KnowsInfo(hero,info_freemineorc_shadowbeast2) && Npc_KnowsInfo(hero,info_freemineorc_swampshark2) && Npc_KnowsInfo(hero,info_freemineorc_troll2))
	{
		return TRUE;
	};
};

func void info_freemineorc_lookingulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Я еще не все собрал.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Чужак искать. Таррок ждать здесь!
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_EVERYULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_everyulumulu_condition;
	information = info_freemineorc_everyulumulu_info;
	important = 0;
	permanent = 0;
	description = "Теперь у меня есть все, что нужно для Улу-Мулу!";
};


func int info_freemineorc_everyulumulu_condition()
{
	if((FREEMINEORC_LOOKINGULUMULU == LOG_RUNNING) && Npc_HasItems(hero,itat_waran_01) && Npc_HasItems(hero,itat_shadow_02) && Npc_HasItems(hero,itat_swampshark_02) && Npc_HasItems(hero,itat_troll_02))
	{
		return TRUE;
	};
};

func void info_freemineorc_everyulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Теперь у меня есть все, что нужно для Улу-Мулу!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Чужак сильный солдат! Дать мне вещи! Таррок делать Улу-Мулу!
	b_printtrademsg1("Отдано 4 трофея.");
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
	};
	AI_TurnAway(self,hero);
	AI_PlayAni(self,"T_DIALOGGESTURE_05");
	CreateInvItem(self,ulumulu);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_DIALOGGESTURE_07");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Вот! Чужак нести Улу-Мулу и быть гордый! Таррок теперь спать!
	b_printtrademsg2("Получено Улу-Мулу.");
	Npc_RemoveInvItem(hero,itat_shadow_02);
	Npc_RemoveInvItem(hero,itat_swampshark_02);
	Npc_RemoveInvItem(hero,itat_troll_02);
	Npc_RemoveInvItem(hero,itat_waran_01);
	b_story_gotulumulu();
	AI_StopProcessInfos(self);
};

