
instance INFO_ORCSHAMAN_EXIT(C_INFO)
{
	npc = orc_2200_shaman;
	nr = 999;
	condition = info_orcshaman_exit_condition;
	information = info_orcshaman_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_orcshaman_exit_condition()
{
	return TRUE;
};

func void info_orcshaman_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_THX(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_thx_condition;
	information = info_orcshaman_thx_info;
	important = 1;
	permanent = 0;
};


func int info_orcshaman_thx_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void info_orcshaman_thx_info()
{
	AI_Output(self,hero,"Info_OrcShaman_THX_17_01");	//Спасибо чужак!
	AI_Output(self,hero,"Info_OrcShaman_THX_17_02");	//Плохой орки хотеть убить меня.
	AI_Output(self,hero,"Info_OrcShaman_THX_17_03");	//Братья стать враги.
};


instance INFO_ORCSHAMAN_WHO(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_who_condition;
	information = info_orcshaman_who_info;
	important = 0;
	permanent = 0;
	description = "Кто ты?";
};


func int info_orcshaman_who_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_who_info()
{
	AI_Output(hero,self,"Info_OrcShaman_WHO_15_01");	//Кто ты?
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_02");	//Имя Ур-Шак.
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_03");	//Быть сын духа. Люди звать нас шаман.
};


instance INFO_ORCSHAMAN_TONGUE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_tongue_condition;
	information = info_orcshaman_tongue_info;
	important = 0;
	permanent = 0;
	description = "Откуда ты знаешь язык людей?";
};


func int info_orcshaman_tongue_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_tongue_info()
{
	AI_Output(hero,self,"Info_OrcShaman_TONGUE_15_01");	//Откуда ты знаешь язык людей?
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_02");	//Ур-Шак быть раб людей в шахта.
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_03");	//Убежать. Много зимы назад убежать.
};


instance INFO_ORCSHAMAN_MINE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_mine_condition;
	information = info_orcshaman_mine_info;
	important = 0;
	permanent = 0;
	description = "Ты был рабом в шахте? А в какой?";
};


func int info_orcshaman_mine_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_tongue))
	{
		return TRUE;
	};
};

func void info_orcshaman_mine_info()
{
	AI_Output(hero,self,"Info_OrcShaman_MINE_15_01");	//Ты был рабом в шахте? А в какой?
	AI_Output(self,hero,"Info_OrcShaman_MINE_17_02");	//Шахта возле деревня в долине.
};


instance INFO_ORCSHAMAN_WHY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_why_condition;
	information = info_orcshaman_why_info;
	important = 0;
	permanent = 0;
	description = "Почему твои братья хотели убить тебя?";
};


func int info_orcshaman_why_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_why_info()
{
	AI_Output(hero,self,"Info_OrcShaman_WHY_15_01");	//Почему твои братья хотели убить тебя?
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_02");	//Они Ур-Шак не любить.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_03");	//Ур-Шак предать их вера в КРУШАК.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_04");	//Считать КРУШАК плохой демон.
};


instance INFO_ORCSHAMAN_KRUSHAK(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_krushak_condition;
	information = info_orcshaman_krushak_info;
	important = 0;
	permanent = 0;
	description = "А кто такой КРУШАК?";
};


func int info_orcshaman_krushak_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_why))
	{
		return TRUE;
	};
};

func void info_orcshaman_krushak_info()
{
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_01");	//А кто такой КРУШАК?
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_02");	//Люди звать КРУШАК Спящ.
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_03");	//Ты хочешь сказать Спящий?
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_04");	//Да, люди говорить СПЯЩИЙ!
};


instance INFO_ORCSHAMAN_SLEEPER(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_sleeper_condition;
	information = info_orcshaman_sleeper_info;
	important = 0;
	permanent = 0;
	description = "Что ты знаешь о Спящем?";
};


func int info_orcshaman_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_krushak))
	{
		return TRUE;
	};
};

func void info_orcshaman_sleeper_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_01");	//Что ты знаешь о Спящем?
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_02");	//Много зим назад быть пять братов!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_03");	//Сыны духа как Ур-Шак.
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_04");	//Так шаманов было пять!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_05");	//Они позвать КРУШАК!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_06");	//Хотеть победить свой враги!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_07");	//Пять братов строить храм под землей для КРУШАК!
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_08");	//Подземный храм Спящего! Должно быть, Ксардас говорил как раз о нем, ведь он находится под городом орков.
};


instance INFO_ORCSHAMAN_CURSE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_curse_condition;
	information = info_orcshaman_curse_info;
	important = 0;
	permanent = 0;
	description = "Что случилось в подземном храме?";
};


func int info_orcshaman_curse_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_sleeper))
	{
		return TRUE;
	};
};

func void info_orcshaman_curse_info()
{
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_01");	//Что случилось в подземном храме?
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_02");	//Браты отдать сердце КРУШАКУ.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_03");	//Но КРУШАК плохой. КРУШАК проклинать все, кто строить храм.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_04");	//Браты нет сердца. Не быть ни живой ни мертвый. Стать все вместе.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_05");	//КРУШАК взять сердце браты. В них сила КРУШАК.
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_06");	//А что случилось с теми, кто строил храм?
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_07");	//КРУШАК всех проклинать. И строители. Все стали живой и мертвый, то и другое.
};


instance INFO_ORCSHAMAN_OUTSIDE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_outside_condition;
	information = info_orcshaman_outside_info;
	important = 0;
	permanent = 0;
	description = "А орки, оставшиеся на поверхности, что-нибудь сделали?";
};


func int info_orcshaman_outside_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_curse))
	{
		return TRUE;
	};
};

func void info_orcshaman_outside_info()
{
	AI_Output(hero,self,"Info_OrcShaman_OUTSIDE_15_01");	//А орки, оставшиеся на поверхности, что-нибудь сделали?
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_02");	//Они закрыть храм. Браты сейчас служить КРУШАК.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_03");	//КРУШАК получать жертва и не злиться.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_04");	//Ур-Шак думать жертва плохо. Говорить браты КРУШАК плохой.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_05");	//Они не слушать. Они сказать Ур-Шак уходить. Они побить Ур-Шак.
};


instance INFO_ORCSHAMAN_INTEMPLE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_intemple_condition;
	information = info_orcshaman_intemple_info;
	important = 0;
	permanent = 0;
	description = "Я должен попасть в подземный храм.";
};


func int info_orcshaman_intemple_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_outside))
	{
		return TRUE;
	};
};

func void info_orcshaman_intemple_info()
{
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_01");	//Я должен попасть в подземный храм. Ты можешь отвести меня туда?
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_02");	//Ур-Шак говорить спасибо чужак. Чужак спасти Ур-Шак.
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_03");	//Только вход в храм в дом Ур-Шак. Ур-Шак не идти в дом.
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_04");	//Так они не пропустят тебя обратно в город, да?
};


instance INFO_ORCSHAMAN_MAP(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_map_condition;
	information = info_orcshaman_map_info;
	important = 0;
	permanent = 0;
	description = "А ты можешь показать мне на карте, где этот город находится?";
};


func int info_orcshaman_map_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_intemple) && Npc_HasItems(hero,itwrworldmap))
	{
		return TRUE;
	};
};

func void info_orcshaman_map_info()
{
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_01");	//А ты можешь показать мне на карте, где этот город находится?
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_02");	//Дом Ур-Шак там, на пустой белый карта.
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_03");	//Чужать давать карта, Ур-Шак рисовать дом.
	b_printtrademsg1("Отдана карта колонии.");
	AI_TurnAway(self,hero);
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_04");	//(рисует на карте)
	AI_WhirlAround(self,hero);
	b_printtrademsg2("Получена дополненная карта колонии.");
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_05");	//О! А ты неплохо рисуешь! Спасибо!
	Npc_RemoveInvItem(hero,itwrworldmap);
	CreateInvItem(hero,itwrworldmap_orc);
};


instance INFO_ORCSHAMAN_FIGHT(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_fight_condition;
	information = info_orcshaman_fight_info;
	important = 0;
	permanent = 0;
	description = "Да, похоже, мне там придется пробивать дорогу мечом!";
};


func int info_orcshaman_fight_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_intemple))
	{
		return TRUE;
	};
};

func void info_orcshaman_fight_info()
{
	AI_Output(hero,self,"Info_OrcShaman_FIGHT_15_01");	//Да, похоже, мне там придется пробивать дорогу мечом!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_02");	//Дома браты очень сильный! Они очень много быть!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_03");	//Чужак не ходить! Много солдаты! Чужак умереть.
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_04");	//Дома быть другие сыны духа. Сделать чужак гореть и умереть.
};


instance INFO_ORCSHAMAN_OTHERWAY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_otherway_condition;
	information = info_orcshaman_otherway_info;
	important = 0;
	permanent = 0;
	description = "Да, это понятно, но мне все равно придется туда попасть!";
};


func int info_orcshaman_otherway_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_fight))
	{
		return TRUE;
	};
};

func void info_orcshaman_otherway_info()
{
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_01");	//Да, это понятно, но мне все равно придется туда попасть!
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_02");	//Ур-Шак знать один способ! Чужак надеть Улу-Мулу.
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_03");	//Улу-Мулу? А что это такое?
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_04");	//Быть знак дружбы. Браты уважать Улу-Мулу.
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_05");	//Чужак одеть Улу-Мулу и не умереть!
};


instance INFO_ORCSHAMAN_ULUMULU(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_ulumulu_condition;
	information = info_orcshaman_ulumulu_info;
	important = 0;
	permanent = 0;
	description = "А где мне достать эту самую Улу-Мулу?";
};


func int info_orcshaman_ulumulu_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_otherway))
	{
		return TRUE;
	};
};

func void info_orcshaman_ulumulu_info()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_01");	//А где мне достать эту самую Улу-Мулу?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_02");	//Чужак ходить к друг Ур-Шак!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_03");	//Друг Ур-Шак давать чужак Улу-Мулу. Чужак одеть Улу-Мулу и не умереть!
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_04");	//Да, да, то что с этой штукой я 'не умереть', я уже понял. Но где я найду твоего друга?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_05");	//Друг Ур-Шак в шахта жить, у людей. Друг не убежать с Ур-Шак. Друг сильно болеть.
	b_story_foundurshak();
	Info_ClearChoices(info_orcshaman_ulumulu);
	Info_AddChoice(info_orcshaman_ulumulu,"Ты работал в Свободной шахте?",info_orcshaman_ulumulu_fm);
	Info_AddChoice(info_orcshaman_ulumulu,"Ты работал в Заброшенной шахте?",info_orcshaman_ulumulu_vm);
	Info_AddChoice(info_orcshaman_ulumulu,"Ты работал в Старой шахте?",info_orcshaman_ulumulu_am);
};

func void info_orcshaman_ulumulu_vm()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_08");	//Ты работал в Заброшенной шахте?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_09");	//Ур-Шак не понимать.
};

func void info_orcshaman_ulumulu_am()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_10");	//Ты работал в Старой шахте?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_11");	//Ур-Шак не понимать.
};

func void info_orcshaman_ulumulu_fm()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_12");	//Ты работал в Свободной шахте?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_13");	//Ур-Шак быть раб в шахте под деревня.
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_14");	//Ур-Шак думать люди называть шахта так.
	Info_ClearChoices(info_orcshaman_ulumulu);
};


instance INFO_ORCSHAMAN_BYEBYE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_byebye_condition;
	information = info_orcshaman_byebye_info;
	important = 0;
	permanent = 0;
	description = "Спасибо за помощь.";
};


func int info_orcshaman_byebye_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_ulumulu))
	{
		return TRUE;
	};
};

func void info_orcshaman_byebye_info()
{
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_01");	//Спасибо за помощь.
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_02");	//Ур-Шак говорить чужак спасибо. Чужак спасать Ур-Шак. Теперь чужак друг!
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_03");	//Друг получать подарок. Знак Ур-Шак. Знак зищищать от огонь ящерица огня.
	b_printtrademsg1("Получен талисман орков.");
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_04");	//Ур-Шак не может домой. Ур-Шак теперь жить здесь. Друг приходить когда нужен помощь.
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_05");	//Возможно, я этим когда-нибудь воспользуюсь.
	b_story_friendofurshak();
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_FRIENDLYHELLO(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_friendlyhello_condition;
	information = info_orcshaman_friendlyhello_info;
	important = 0;
	permanent = 0;
	description = "Как у тебя дела?";
};


func int info_orcshaman_friendlyhello_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_byebye) && FRIENDOFURSHAK)
	{
		return TRUE;
	};
};

func void info_orcshaman_friendlyhello_info()
{
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_01");	//Как у тебя дела?
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_02");	//Ур-Шак быть здоровый!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_03");	//Ур-Шак теперь искать свой Улу-Мулу!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_04");	//Может Ур-Шак вернуться домой с Улу-Мулу.
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_05");	//Друг приходить, когда нужен помощь!
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_06");	//Береги себя!
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_ORCCITY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_orccity_condition;
	information = info_orcshaman_orccity_info;
	important = 1;
	permanent = 0;
};


func int info_orcshaman_orccity_condition()
{
	if(Npc_GetDistToWP(hero,"SPAWN_OW_WARAN_ORC_01") < 1000)
	{
		return TRUE;
	};
};

func void info_orcshaman_orccity_info()
{
	b_fullstop(hero);
	AI_GotoNpc(hero,self);
	AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_01");	//Ур-Шак говорить друг привет!
	if(Npc_HasItems(hero,ulumulu))
	{
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_02");	//Друг найти Улу-Мулу! Какой хороший!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_03");	//Друг не забыть нести Улу-Мулу в руке, когда идти на мост!
	}
	else
	{
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_04");	//Друг не найти Улу-Мулу! Плохо!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_05");	//Друг не идти на мост, а то умереть!
	};
};


instance INFO_ORCSHAMAN_YOUHERE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_youhere_condition;
	information = info_orcshaman_youhere_info;
	important = 0;
	permanent = 0;
	description = "Что ты делаешь так близко к городу орков?";
};


func int info_orcshaman_youhere_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_orccity))
	{
		return TRUE;
	};
};

func void info_orcshaman_youhere_info()
{
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_01");	//Что ты делаешь так близко к городу орков?
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_02");	//Ур-Шак смотреть на братья из дома!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_03");	//Ур-Шак думать КРУШАК хотеть просыпаться скоро!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_04");	//Ур-Шак здесь ждать и драться против КРУШАК, когда он проснуться!
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_05");	//Так Спящий действительно может проснуться? А ты не ошибаешься?
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_06");	//Я кое-что слышал об этом демоне. Судя по всему, всем будет лучше, если он так и останется спать.
};


instance INFO_ORCSHAMAN_SEAL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_seal_condition;
	information = info_orcshaman_seal_info;
	important = 0;
	permanent = 0;
	description = "В прошлый раз ты рассказывал, что твои братья запечатали храм.";
};


func int info_orcshaman_seal_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_orccity))
	{
		return TRUE;
	};
};

func void info_orcshaman_seal_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SEAL_15_01");	//В прошлый раз ты рассказывал, что твои братья запечатали храм.
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_02");	//Братья Ур-Шак закрыть храм в земле очень хорошо!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_03");	//Друг нельзя идти в храм!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_04");	//Друг использовать магия братья, сыны духа как Ур-Шак!
};


instance INFO_ORCSHAMAN_SCROLL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_scroll_condition;
	information = info_orcshaman_scroll_info;
	important = 0;
	permanent = 0;
	description = "Где я найду это заклинание?";
};


func int info_orcshaman_scroll_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_seal))
	{
		return TRUE;
	};
};

func void info_orcshaman_scroll_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SCROLL_15_01");	//Где я найду это заклинание?
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_02");	//Друг идти в пещера где братья сыны духа как Ур-Шак!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_03");	//Но друг надо делать магия осторожно!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_04");	//Братья Ур-Шак не любить! Улу-Мулу не помочь, если друг использовать магия!
	b_logentry(CH4_ENTERTEMPLE,"Я снова встретил шамана Ур-Шака перед городом орков. Он сказал мне, что в подземный храм можно попасть только тогда, когда я прочту специальное орочье заклинание. Другие орки-шаманы хранят такие заклинания в своих норах.");
};


instance INFO_ORCSHAMAN_IDOL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_idol_condition;
	information = info_orcshaman_idol_info;
	important = 0;
	permanent = 0;
	description = "Есть ли другой путь в храм Спящего?";
};


func int info_orcshaman_idol_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_scroll) && !ORCCITY_SANCTUM_OUTERGATEOPEN)
	{
		return TRUE;
	};
};

func void info_orcshaman_idol_info()
{
	AI_Output(hero,self,"Info_OrcShaman_IDOL_15_01");	//Есть ли другой путь в храм Спящего?
	if(Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_03");	//Друг найти знак, что лежать на колонне!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_04");	//Друг теперь открыть ворота в храм!
		b_logentry(CH4_ENTERTEMPLE,"Есть и другой путь в храм Спящего. Нужно поставить статую Спящего на пъедистал перед большими воротами у входа.");
	}
	else
	{
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_05");	//Друг надо взять знак, что лежать на колонне!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_06");	//Теперь знак открыть врата в храм!
		b_logentry(CH4_ENTERTEMPLE,"В храм Спящего можно попасть и другим путем. На священной колонне стоит статуя Спящего, которая открывает ворота в храм. Но если шаманы заметят меня у своей святыни, они не обрадуются.");
	};
};

