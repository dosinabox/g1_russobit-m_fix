
instance INFO_BAALLUKOR_EXIT(C_INFO)
{
	npc = gur_1211_baallukor;
	nr = 999;
	condition = info_baallukor_exit_condition;
	information = info_baallukor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_baallukor_exit_condition()
{
	return 1;
};

func void info_baallukor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_BAALLUKOR_MEET(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_meet_condition;
	information = info_baallukor_meet_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_meet_condition()
{
	return TRUE;
};

func void info_baallukor_meet_info()
{
	AI_Output(self,other,"Info_BaalLukor_MEET_13_01");	//Благодарю за помощь. Еще немного, и ты бы опоздал.
	b_givexp(XP_SAVEBAALLUKOR);
};


instance INFO_BAALLUKOR_DEAD(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_dead_condition;
	information = info_baallukor_dead_info;
	nr = 20;
	permanent = 0;
	important = 0;
	description = "Я видел убитых Стражей, когда шел сюда. Что здесь произошло?";
};


func int info_baallukor_dead_condition()
{
	return TRUE;
};

func void info_baallukor_dead_info()
{
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01");	//Я видел убитых Стражей, когда шел сюда. Что здесь произошло?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02");	//Учитель Кор Ангар прислал нас сюда, чтобы исследовать пещеры.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03");	//Мы думали, что не найдем здесь ничего, кроме мумий и забытых гробниц.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04");	//Но тьма вокруг нас внезапно наполнилась движением, и нас окружили орки! Я не знаю, что им нужно было в этой пещере, но мы совершенно не ожидали их там увидеть!
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05");	//А где Стражи, которые пошли с тобой?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06");	//Мертвы! Я стал причиной их смерти, когда повел их в эту ловушку. Да простит меня за это Спящий.
	b_logentry(CH3_ORCGRAVEYARD,"Я спас Гуру Идола Люкора от орков на кладбище. Все Стражи, которые пошли вместе с ним, были убиты ими.");
};


instance INFO_BAALLUKOR_SUMMONING(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_summoning_condition;
	information = info_baallukor_summoning_info;
	nr = 10;
	permanent = 0;
	important = 0;
	description = "Меня прислал Кор Ангар!";
};


func int info_baallukor_summoning_condition()
{
	return TRUE;
};

func void info_baallukor_summoning_info()
{
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01");	//Меня прислал Кор Ангар! Вы уже нашли что-нибудь, что помогло бы отыскать Спящего?
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02");	//Нет, пока ничего не нашли. Но что с Юберионом? Он уже очнулся?
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03");	//Нет, он так и не пришел в себя.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04");	//Мы должны узнать тайны этой пещеры. Мы слишком дорого заплатили за то, чтобы пробраться сюда. Наши жертвы будут напрасны, если мы уйдем отсюда с пустыми руками.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05");	//Но я не слишком хорошо обращаюсь с оружием, а мои заклинания действуют на орков не так сильно, как на людей Старого лагеря.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06");	//Если ты служишь Спящему, то, может быть, ты сможешь помочь мне закончить поиски в этой пещере.
};


instance INFO_BAALLUKOR_HELP(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_help_condition;
	information = info_baallukor_help_info;
	permanent = 0;
	important = 0;
	description = "Хорошо, я помогу тебе!";
};


func int info_baallukor_help_condition()
{
	return Npc_KnowsInfo(hero,info_baallukor_summoning);
};

func void info_baallukor_help_info()
{
	AI_Output(other,self,"Info_BaalLukor_HELP_15_01");	//Хорошо, я помогу тебе!
	AI_Output(self,other,"Info_BaalLukor_HELP_13_02");	//Ты обрадовал меня. Здесь есть три туннеля. Нам нужно их осмотреть.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//Ты иди вперед, а я пойду следом!
	b_logentry(CH3_ORCGRAVEYARD,"Идол Люкор решил пойти со мной, чтобы разгадать загадку этого древнего культового сооружения.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FOUNDNONE(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_foundnone_condition;
	information = info_baallukor_foundnone_info;
	permanent = 1;
	important = 0;
	description = "Я ничего не могу найти!";
};


func int info_baallukor_foundnone_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (BAALLUKOR_BRINGPARCHMENT == 0) && !Npc_HasItems(hero,orkparchmentone) && !Npc_HasItems(hero,orkparchmenttwo))
	{
		return TRUE;
	};
};

func void info_baallukor_foundnone_info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01");	//Я ничего не могу найти!
	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02");	//Наверное, ты осмотрел не все туннели.
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FOUNDONE(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_foundone_condition;
	information = info_baallukor_foundone_info;
	permanent = 1;
	important = 0;
	description = "По-моему, мы не сможем найти вторую половину. Ее здесь нет!";
};


func int info_baallukor_foundone_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (((BAALLUKOR_BRINGPARCHMENT == 1) && !Npc_HasItems(hero,orkparchmenttwo)) || ((BAALLUKOR_BRINGPARCHMENT == 2) && !Npc_HasItems(hero,orkparchmentone))))
	{
		return TRUE;
	};
};

func void info_baallukor_foundone_info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01");	//По-моему, мы не сможем найти вторую половину. Ее здесь нет!
	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02");	//Нет, она должна быть. Смотри внимательнее. Она находится где-то здесь.
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FIRSTWAIT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_firstwait_condition;
	information = info_baallukor_firstwait_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_firstwait_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (Npc_GetDistToWP(self,"GRYD_040") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && !Npc_KnowsInfo(hero,info_baallukor_firstscroll))
	{
		return TRUE;
	};
};

func void info_baallukor_firstwait_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01");	//Дальше мы не сможем пройти! Может быть, эти ниши помогут нам.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelOne");
};


instance INFO_BAALLUKOR_FIRSTSCROLL(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_firstscroll_condition;
	information = info_baallukor_firstscroll_info;
	permanent = 0;
	important = 0;
	description = "Я нашел обрывок свитка!";
};


func int info_baallukor_firstscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && Npc_HasItems(hero,orkparchmentone))
	{
		return TRUE;
	};
};

func void info_baallukor_firstscroll_info()
{
	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01");	//Я нашел обрывок свитка!
	b_giveinvitems(hero,self,orkparchmentone,1);
	if(BAALLUKOR_BRINGPARCHMENT == 2)
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02");	//Отлично! Это и есть половина свитка с заклинанием орков.
		BAALLUKOR_BRINGPARCHMENT = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03");	//Это свиток с заклинанием орков. Кто-то разорвал его на две части.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04");	//У нас есть только одна из них. Нужно найти вторую.
		AI_StopProcessInfos(self);
		BAALLUKOR_BRINGPARCHMENT = 1;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_SECONDWAIT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_secondwait_condition;
	information = info_baallukor_secondwait_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_secondwait_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (Npc_GetDistToWP(self,"GRYD_047") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && !Npc_KnowsInfo(hero,info_baallukor_secondscroll))
	{
		return TRUE;
	};
};

func void info_baallukor_secondwait_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01");	//Хм... там дальше тупик! Может быть, мы сможем найти что-то, что поможет нам в дальнейших поисках.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelTwo");
};


instance INFO_BAALLUKOR_SECONDSCROLL(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_secondscroll_condition;
	information = info_baallukor_secondscroll_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_secondscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && Npc_HasItems(hero,orkparchmenttwo) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_secondscroll_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01");	//Вот обрывок свитка!
	b_giveinvitems(hero,self,orkparchmenttwo,1);
	if(BAALLUKOR_BRINGPARCHMENT == 1)
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02");	//Отлично! Это и есть вторая половина свитка с заклинанием орков.
		BAALLUKOR_BRINGPARCHMENT = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03");	//Это свиток с заклинанием орков. Кто-то разорвал его на две части.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04");	//У нас есть только одна из них. Нужно найти вторую.
		AI_StopProcessInfos(self);
		BAALLUKOR_BRINGPARCHMENT = 2;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_BOTHSCROLLS(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_bothscrolls_condition;
	information = info_baallukor_bothscrolls_info;
	permanent = 0;
	important = 0;
	description = "Что же нам теперь делать с этим разорванным свитком?";
};


func int info_baallukor_bothscrolls_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (BAALLUKOR_BRINGPARCHMENT == 3))
	{
		return TRUE;
	};
};

func void info_baallukor_bothscrolls_info()
{
	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01");	//Что же нам теперь делать с этим разорванным свитком?
	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02");	//Если соединить эти части, мы получим целый свиток. Но я не смогу его расшифровать.
	b_logentry(CH3_ORCGRAVEYARD,"Мы нашли две половины орочьего заклинания. Но Идол Люкор не может их перевести. Пока не может.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_RUNES(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_runes_condition;
	information = info_baallukor_runes_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_runes_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_bothscrolls) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && ((Npc_GetDistToWP(hero,"GRYD_025") < 600) || (Npc_GetDistToWP(hero,"GRYD_048") < 600)))
	{
		return TRUE;
	};
};

func void info_baallukor_runes_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01");	//Подожди! Кажется, в этом что-то есть...
	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02");	//Мне это место совсем не кажется интересным.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03");	//Тише! Лучше присмотрись к этим рунам на стенах пещеры.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04");	//С их помощью я смогу перевести свиток.
	b_usefakescroll();
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06");	//Так я и думал! Это же свиток телепортации. Но, по-моему, его можно прочитать только в определенном месте.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07");	//Как странно!
	Npc_RemoveInvItems(self,orkparchmentone,1);
	Npc_RemoveInvItems(self,orkparchmenttwo,1);
	b_logentry(CH3_ORCGRAVEYARD,"С помощью настенных надписей в большой зале Идол Люкор смог прочитать свиток. Это оказался свиток телепортации, переносящий кого-либо на очень короткие дистанции.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_WHATNOW(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_whatnow_condition;
	information = info_baallukor_whatnow_info;
	permanent = 1;
	important = 0;
	description = "В каком это 'определенном месте'?";
};


func int info_baallukor_whatnow_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_runes) && Npc_KnowsInfo(hero,info_baallukor_hallwithout) && !Npc_KnowsInfo(hero,info_baallukor_hallwith))
	{
		return TRUE;
	};
};

func void info_baallukor_whatnow_info()
{
	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01");	//В каком это 'определенном месте'?
	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02");	//Мне показалось, что... тот большой зал, в котором мы уже были... что-то с ним не так. Вернемся туда!
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_HALLWITHOUT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_hallwithout_condition;
	information = info_baallukor_hallwithout_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_hallwithout_condition()
{
	if(!Npc_KnowsInfo(hero,info_baallukor_runes) && (Npc_GetDistToWP(hero,"GRYD_055") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_hallwithout_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01");	//В этом месте... Я не могу этого объяснить, но что-то в этом месте...
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02");	//О, забудь об этом. Наверное, на меня подействовала мрачная атмосфера этой пещеры.
	b_logentry(CH3_ORCGRAVEYARD,"Когда мы вошли в большую прямоугольную залу, Гуру что-то почувствовал. Но он не мог сказать, что именно.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_HALLWITH(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_hallwith_condition;
	information = info_baallukor_hallwith_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_hallwith_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_runes) && (Npc_GetDistToWP(hero,"GRYD_055") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_hallwith_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01");	//В этом месте особая аура... аура чего-то необъяснимого.
	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02");	//Это место... Оно же из нашего видения! Мы видели его во время Церемонии.
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03");	//Видения... Мы очень близки к нашей цели...
	b_logentry(CH3_ORCGRAVEYARD,"Некое необъяснимое чувство привело Идола Люкора к одной из стен залы с колоннами.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DOOR");
};


instance INFO_BAALLUKOR_DOOR(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_door_condition;
	information = info_baallukor_door_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_door_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_hallwith) && (Npc_GetDistToWP(hero,"GRYD_060") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_door_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01");	//За этой стеной... должно быть, это здесь!
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02");	//Мне не хватит силы прочитать заклинание.
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03");	//Прочти его сам. Встань перед этой стеной.
	CreateInvItem(self,itarscrollteleport4);
	b_giveinvitems(self,hero,itarscrollteleport4,1);
	AI_StopProcessInfos(self);
};


instance INFO_BAALLUKOR_TELEPORT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_teleport_condition;
	information = info_baallukor_teleport_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_teleport_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_door) && Npc_GetDistToWP(hero,"GRYD_072") < 550 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_baallukor_teleport_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01");	//Это место было сокрыто. Ты нашел его. Моя интуиция меня не подвела.
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02");	//И что, здесь действительно можно найти то, что поможет призвать Спящего?
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03");	//Это место больше похоже на какую-то гробницу.
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04");	//Пойдем дальше.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//Ты иди вперед, а я пойду следом!
	b_logentry(CH3_ORCGRAVEYARD,"С помощью свитка телепортации я попал в тайную пещеру, выходящую из большой залы с колоннами.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TELEPORT");
};


instance INFO_BAALLUKOR_ALTAR(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_altar_condition;
	information = info_baallukor_altar_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_altar_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_teleport) && (Npc_GetDistToWP(hero,"GRYD_082") < 400) && Npc_CanSeeNpcFreeLOS(self,hero))
	{
		return TRUE;
	};
};

func void info_baallukor_altar_info()
{
	b_fullstop(hero);
	AI_GotoWP(hero,"GRYD_081");
	AI_AlignToWP(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01");	//Нет! Этого не может быть! Здесь же только какие-то кости... кругом столько пыли.
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"GRYD_082");
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02");	//Нет!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03");	//Господин мой, я взываю к тебе!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04");	//Пробудись, яви свою силу! Нет!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05");	//Нет!
	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06");	//Ну, вот. Теперь он окончательно сошел с ума!
	AI_Standup(self);
	b_whirlaround(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07");	//Это ты во всем виноват. Ты осквернил это место. Ты вызвал гнев Спящего, нашего господина!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08");	//Теперь я должен расплатиться за это святотатство!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09");	//Я принесу жертву нашему богу. Человеческую жертву!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10");	//Тогда он просветит меня. Я буду одним из его пророков.
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11");	//Умри, неверный!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12");	//
	self.flags = 0;
	self.aivar[43] = TRUE;
	self.npctype = NPCTYPE_MAIN;
	BAALLUKOR_BRINGPARCHMENT = 4;
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	npc_setpermattitude(self,ATT_HOSTILE);
	b_logentry(CH3_ORCGRAVEYARD,"Идол Люкор потерял разум, когда стало ясно, что мы совершенно ничего не нашли. Он напал на меня. Кор Ангару не понравится та новость, которую я сообщу.");
	AI_StopProcessInfos(self);
	AI_StartState(self,zs_attack,1,"");
};

