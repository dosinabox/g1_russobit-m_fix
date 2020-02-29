
func void b_leelearn()
{
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),sld_700_lee_teach_str_5);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),sld_700_lee_teach_str_1);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),sld_700_lee_teach_dex_5);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),sld_700_lee_teach_dex_1);
	}
	else
	{
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
		Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
	};
};

instance SLD_700_LEE_EXIT(C_INFO)
{
	npc = sld_700_lee;
	nr = 999;
	condition = sld_700_lee_exit_condition;
	information = sld_700_lee_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sld_700_lee_exit_condition()
{
	return TRUE;
};

func void sld_700_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_700_LEE_GREET(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_greet_condition;
	information = sld_700_lee_greet_info;
	permanent = 0;
	description = "Ты глава наемников, да?";
};


func int sld_700_lee_greet_condition()
{
	return 1;
};

func void sld_700_lee_greet_info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//Ты глава наемников, да?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//Да, ты совершенно прав!
};


instance SLD_700_LEE_DEFINE(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_define_condition;
	information = sld_700_lee_define_info;
	permanent = 0;
	description = "Что делают наемники на службе у магов?";
};


func int sld_700_lee_define_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_greet))
	{
		return 1;
	};
};

func void sld_700_lee_define_info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//Что делают наемники на службе у магов?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//У нас не такая уж сложная работа. Мы должны охранять руду и защищать магов.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//Иногда маги дают кому-нибудь из нас особые задания.
};


instance SLD_700_LEE_MITMACHEN(C_INFO)
{
	npc = sld_700_lee;
	nr = 2;
	condition = sld_700_lee_mitmachen_condition;
	information = sld_700_lee_mitmachen_info;
	permanent = 0;
	description = "Я хочу стать одним из вас.";
};


func int sld_700_lee_mitmachen_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_greet) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (OLDHEROGUILD == 0))
	{
		return 1;
	};
};

func void sld_700_lee_mitmachen_info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//А ты храбр! Думаешь, я так просто принимаю каждого, кто ко мне приходит?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//Сначала познакомься с жизнью нашего лагеря, а я буду за тобой приглядывать!
};


var int lee_sldpossible;

instance SLD_700_LEE_NOWREADY(C_INFO)
{
	npc = sld_700_lee;
	nr = 700;
	condition = sld_700_lee_nowready_condition;
	information = sld_700_lee_nowready_info;
	permanent = 1;
	description = "Я хочу стать наемником и защищать магов. Ты примешь меня?";
};


func int sld_700_lee_nowready_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (LEE_SLDPOSSIBLE == FALSE))
	{
		return 1;
	};
};

func void sld_700_lee_nowready_info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//Я хочу стать наемником и защищать магов. Ты примешь меня?
	if(hero.level < 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//Но ты еще не готов стать одним из нас. Наберись сначала опыта, а там посмотрим.
		AI_StopProcessInfos(self);
		b_printguildcondition(10);
	}
	else if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//Ты помог Братству, а твои дела в Старой шахте говорят сами за себя.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//Я согласен принять тебя в наемники.
		LEE_SLDPOSSIBLE = TRUE;
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Я дам тебе возможность проявить себя.
		AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//Сначала познакомься с жизнью нашего лагеря, а я буду за тобой приглядывать!
	};
};


instance SLD_700_LEE_BECOMESLDNOW(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_becomesldnow_condition;
	information = sld_700_lee_becomesldnow_info;
	important = 0;
	permanent = 0;
	description = "Я хочу стать наемником.";
};


func int sld_700_lee_becomesldnow_condition()
{
	if((LEE_SLDPOSSIBLE == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void sld_700_lee_becomesldnow_info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//Я хочу стать наемником.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//Это хороший выбор. Ты о нем не пожалеешь.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//Скажи мне только, почему? Почему ты решил присоединиться к нашему лагерю, а не к Гомезу или к Братству?
	Log_CreateTopic(GE_BECOMEMERCENARY,LOG_NOTE);
	b_logentry(GE_BECOMEMERCENARY,"Ли принял меня в ряды наемников.");
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Ли может научить меня вести бой двуручным мечом. Еще он может помочь мне увеличить силу и ловкость.");
	Info_ClearChoices(sld_700_lee_becomesldnow);
	Info_AddChoice(sld_700_lee_becomesldnow,"Другие лагеря того не стоят.",sld_700_lee_becomesldnow_noother);
	Info_AddChoice(sld_700_lee_becomesldnow,"Я хотел свободы с тех пор как попал сюда.",sld_700_lee_becomesldnow_freedom);
	Info_AddChoice(sld_700_lee_becomesldnow,"Так уж вышло.",sld_700_lee_becomesldnow_justbecause);
};

func void sld_700_lee_becomesldnow_noother()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//Другие лагеря того не стоят.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//Да, единственное, что хоть чего-то стоит в этой колонии - это надежда на освобождение. Добро пожаловать, наемник!
	b_printtrademsg1("Получен легкий доспех наемника.");
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipArmor(hero,sld_armor_l);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void sld_700_lee_becomesldnow_freedom()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//Я хотел свободы с тех пор как попал сюда.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//И мы вернем ее себе. Добро пожаловать, наемник!
	b_printtrademsg1("Получен легкий доспех наемника.");
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipArmor(hero,sld_armor_l);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void sld_700_lee_becomesldnow_justbecause()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//Так уж вышло.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//Главное, чтобы мы не остались в плену этого Барьера навечно. Добро пожаловать, наемник!
	b_printtrademsg1("Получен легкий доспех наемника.");
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipArmor(hero,sld_armor_l);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};


instance SLD_700_LEE_DAMNPAST(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_damnpast_condition;
	information = sld_700_lee_damnpast_info;
	important = 1;
	permanent = 0;
};


func int sld_700_lee_damnpast_condition()
{
	if((SATURAS_BRINGFOCI == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void sld_700_lee_damnpast_info()
{
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//А ведь когда-то я вел совсем другую жизнь.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//Я был одним из лучших генералов королевства.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//Всю свою жизнь я боролся за его свободу.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//Знать не принимала меня, но король прислушивался к моим советам. Вельможи считали, что я представляю угрозу их грязным интригам.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//Я недооценивал их коварства. Они не побоялись убить королеву ради победы надо мной.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//В этом бессмысленном убийстве обвинили меня. У короля Робара не осталось иного выбора.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//Мои заслуги перед королевством спасли меня от смерти. Но у меня забрали свободу.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//Когда-нибудь я вырвусь отсюда. Вот тогда они за все поплатятся.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//Я должен им отомстить.
	Npc_ExchangeRoutine(self,"START");
	if(HOMER_DAMLURKER == LOG_SUCCESS)
	{
		b_exchangeroutine(bau_935_homer,"START");
	}
	else
	{
		b_exchangeroutine(bau_935_homer,"PRESTART");
	};
};


instance SLD_700_LEE_FMTAKEN(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_fmtaken_condition;
	information = sld_700_lee_fmtaken_info;
	permanent = 1;
	description = "Что ты думаешь о нападении на шахту?";
};


func int sld_700_lee_fmtaken_condition()
{
	if(FMTAKEN)
	{
		return TRUE;
	};
};

func void sld_700_lee_fmtaken_info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//Что ты думаешь о нападении на шахту?
	if(LEE_FREEMINEREPORT == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//Гомез зашел слишком далеко. Он еще пожалеет об этом.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//Люди Гомеза больше не опасны!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Ты много сделал для нас. Нам нужны такие люди, как ты.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. А теперь мне нужно уходить.
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Подожди!
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//Возьми эту руну в знак нашей благодарности за твою помощь.
		b_printtrademsg1("Получена руна огненного шторма.");
		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Спасибо тебе!
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//До встречи!
		b_logentry(CH4_BANNEDFROMOC,"Я рассказал Ли о том, что мы с Горном очистили Свободную шахту. Он был очень доволен.");
		b_giveinvitems(self,other,itarrune_2_3_firestorm,1);
		b_givexp(500);
		LEE_FREEMINEREPORT = 0;
	};
};


var int lee_armor_m_was_bought;
var int lee_armor_h_was_bought;

instance SLD_700_LEE_CHANGESIDE(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_changeside_condition;
	information = sld_700_lee_changeside_info;
	important = 0;
	permanent = 0;
	description = "Меня прогнали из Старого лагеря. Я могу присоединиться к вам?";
};


func int sld_700_lee_changeside_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_gotolee))
	{
		return TRUE;
	};
};

func void sld_700_lee_changeside_info()
{
	var C_ITEM eqarmor;
	eqarmor = Npc_GetEquippedArmor(hero);
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//Меня прогнали из Старого лагеря. Я могу присоединиться к вам?
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Ты много сделал для нас. Нам нужны такие люди, как ты.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//Что ж, добро пожаловать в Новый лагерь, наемник!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//Возьми эти доспехи. Я рад, что ты пришел к нам.
	if(Hlp_IsItem(eqarmor,grd_armor_h))
	{
		b_printtrademsg1("Получен тяжелый доспех наемника.");
		CreateInvItem(hero,sld_armor_h);
		AI_EquipArmor(hero,sld_armor_h);
		LEE_ARMOR_H_WAS_BOUGHT = 1;
	}
	else
	{
		b_printtrademsg1("Получен доспех наемника.");
		CreateInvItem(self,sld_armor_m);
		b_giveinvitems(self,hero,sld_armor_m,1);
		AI_EquipArmor(hero,sld_armor_m);
		LEE_ARMOR_M_WAS_BOUGHT = 1;
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	b_logentry(CH4_BANNEDFROMOC,"Я перешел в другой лагерь. После того как меня изгнали из Старого лагеря, Ли принял меня в наемники. Мне нужно попасть к Сатурасу!");
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Ли может научить меня вести бой двуручным мечом. Еще он может помочь мне увеличить силу и ловкость.");
	if(DIFF_HARD == FALSE)
	{
		FREELEARN_NC = TRUE;
	};
};


instance SLD_700_LEE_ARMOR(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_armor_condition;
	information = sld_700_lee_armor_info;
	important = 0;
	permanent = 1;
	description = "У тебя есть хорошие доспехи?";
};


func int sld_700_lee_armor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD && ((LEE_ARMOR_M_WAS_BOUGHT != 1) || (LEE_ARMOR_H_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void sld_700_lee_armor_info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//У тебя есть хорошие доспехи?
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//Доспехи нужно заслужить. К тому же, хорошие доспехи ценятся очень высоко.
	Info_ClearChoices(sld_700_lee_armor);
	Info_AddChoice(sld_700_lee_armor,DIALOG_BACK,sld_700_lee_armor_back);
	if(LEE_ARMOR_H_WAS_BOUGHT != 1)
	{
		Info_AddChoice(sld_700_lee_armor,b_buildbuyarmorstring("Тяжелый доспех наемника, защита: 70/10/35/0",VALUE_SLD_ARMOR_H),sld_700_lee_armor_h);
	};
	if(LEE_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(sld_700_lee_armor,b_buildbuyarmorstring("Средний доспех наемника, защита: 55/10/25/0",VALUE_SLD_ARMOR_M),sld_700_lee_armor_m);
	};
};

func void sld_700_lee_armor_back()
{
	Info_ClearChoices(sld_700_lee_armor);
};

func void sld_700_lee_armor_m()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01");	//Дай мне средний доспех.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//Ты еще не можешь носить такие доспехи. Приходи, когда у тебя будет больше опыта.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//Я не раздаю доспехи бесплатно.
	}
	else
	{
		b_printtrademsg1("Отдано руды: 1650");
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//Это добротно сделанные доспехи. Они надежно защитят тебя.
		b_giveinvitems(hero,self,itminugget,VALUE_SLD_ARMOR_M);
		b_printtrademsg2("Получен доспех наемника.");
		CreateInvItem(self,sld_armor_m);
		b_giveinvitems(self,hero,sld_armor_m,1);
		AI_EquipArmor(hero,sld_armor_m);
		LEE_ARMOR_M_WAS_BOUGHT = 1;
	};
};

func void sld_700_lee_armor_h()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01");	//Дай мне тяжелый доспех.
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//Ты еще не можешь носить такие доспехи. Приходи, когда у тебя будет больше опыта.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//Я не раздаю доспехи бесплатно.
	}
	else
	{
		b_printtrademsg1("Отдано руды: 2600");
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//Это лучшие доспехи, которые можно достать в колонии, поверь мне. Они стоят той руды, которую я за них беру.
		b_printtrademsg2("Получен тяжелый доспех наемника.");
		b_giveinvitems(hero,self,itminugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		AI_EquipArmor(hero,sld_armor_h);
		LEE_ARMOR_H_WAS_BOUGHT = 1;
	};
};


instance SLD_700_LEE_TEACH_PRE(C_INFO)
{
	npc = sld_700_lee;
	nr = 10;
	condition = sld_700_lee_teach_pre_condition;
	information = sld_700_lee_teach_pre_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int sld_700_lee_teach_pre_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD || (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void sld_700_lee_teach_pre_info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//Я могу помочь тебе стать более ловким и сильным.
};

instance SLD_700_LEE_TEACH(C_INFO)
{
	npc = sld_700_lee;
	nr = 10;
	condition = sld_700_lee_teach_condition;
	information = sld_700_lee_teach_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int sld_700_lee_teach_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_teach_pre))
	{
		return TRUE;
	};
};

func void sld_700_lee_teach_info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Я хочу улучшить свои навыки.
	b_leelearn();
};

func void sld_700_lee_teach_back()
{
	Info_ClearChoices(sld_700_lee_teach);
};

func void sld_700_lee_teach_str_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_STRENGTH] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_leelearn();
};

func void sld_700_lee_teach_str_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_STRENGTH] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_leelearn();
};

func void sld_700_lee_teach_dex_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_leelearn();
};

func void sld_700_lee_teach_dex_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_leelearn();
};


instance SLD_700_LEE_ZWEIHAND1(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_zweihand1_condition;
	information = sld_700_lee_zweihand1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0);
};


func int sld_700_lee_zweihand1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW || Npc_GetTrueGuild(hero) == GIL_DMB))))
	{
		return TRUE;
	};
};

func void sld_700_lee_zweihand1_info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//Научи меня владеть двуручным мечом.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_8_NoLearnYouAlreadyKnow");	//Сначала ты должен изучить основы и только потом переходить к более сложным вещам.
		PrintScreen("Требуется мастерство одноручного оружия!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//Хорошо, начнем с самых азов.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//Держи клинок горизонтально. Чтобы нанести удар таким тяжелым оружием, необходимо хорошо размахнуться.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//Подними меч и нанеси удар сверху. Обычно такой удар может повергнуть противника.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//Используй инерцию движения, чтобы нанести удар снизу.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//Двуручным мечом можно наносить очень сильные боковые удары. При этом противник не сможет к тебе приблизиться.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//Что ж, для первого урока достаточно. Иди, тренируйся.
		sld_700_lee_zweihand1.permanent = 0;
	};
};


instance SLD_700_LEE_ZWEIHAND2(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_zweihand2_condition;
	information = sld_700_lee_zweihand2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0);
};


func int sld_700_lee_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW || Npc_GetTrueGuild(hero) == GIL_DMB))))
	{
		return TRUE;
	};
};

func void sld_700_lee_zweihand2_info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//Я хочу узнать больше о владении двуручным мечом.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//Для начала тебе нужно изменить стойку. Держи клинок вертикально, возьмись за рукоять обеими руками и отведи меч немного в сторону.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//Нанеси быстрый удар сверху, направляя клинок над плечом. У тебя появится возможность перейти к быстрому удару слева.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//При этом у противника не будет никаких шансов приблизиться к тебе.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//Ты можешь еще нанести удар слева сверху, чтобы оттолкнуть противника.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//Сделай быстрый разворот, и ты сможешь ударить противника с силой, достаточной для того, чтобы повергнуть врага.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//Если противник смог избежать этого удара, используй инерцию меча, чтобы нанести следующий удар.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//После атаки прими оборонительную стойку и жди подходящего момента для следующего удара.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//Смена ударов и правильный выбор позиции являются основой успешного ведения боя.
		sld_700_lee_zweihand2.permanent = 0;
	};
};

