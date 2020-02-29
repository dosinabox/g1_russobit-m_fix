
instance INFO_XARDASDEMON_EXIT(C_INFO)
{
	npc = xardasdemon;
	nr = 999;
	condition = info_xardasdemon_exit_condition;
	information = info_xardasdemon_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_xardasdemon_exit_condition()
{
	return 1;
};

func void info_xardasdemon_exit_info()
{
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_Saturas_EXIT_15_01");	//... Я?.. Смертный?.. Я уже ухожу!
	AI_StopProcessInfos(self);
};


instance INFO_XARDASDEMON_INTRO(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_intro_condition;
	information = info_xardasdemon_intro_info;
	permanent = 0;
	important = 1;
};


func int info_xardasdemon_intro_condition()
{
	if(FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_xardasdemon_intro_info()
{
	Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,self,3,0,DAM_FIRE,TRUE);
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	AI_PlayAni(self,"T_SPAWN");
	AI_TurnAway(hero,self);
	AI_PlayAni(hero,"T_SEARCH");
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01");	//Так... Кто... Кто это говорит?
	AI_WhirlAround(hero,self);
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02");	//Так это ты со мной говоришь? А как... а почему твой голос звучит только в моей голове?
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03");	//Кто ты?.. простой слуга своего хозяина?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04");	//Мне кажется, ты - одно из порождений бога Тьмы!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05");	//Мне замолчать?
};


instance INFO_XARDASDEMON_MASTERWHO(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_masterwho_condition;
	information = info_xardasdemon_masterwho_info;
	permanent = 0;
	important = 0;
	description = "А твой хозяин, случайно, не Ксардас?";
};


func int info_xardasdemon_masterwho_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_intro))
	{
		return TRUE;
	};
};

func void info_xardasdemon_masterwho_info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01");	//А твой хозяин, случайно, не Ксардас?
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02");	//Ах, так... имена не имеют значения... ладно.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03");	//Просто мне сказали, что где-то здесь должна быть башня Ксардаса. По-моему, это она и есть.
};


instance INFO_XARDASDEMON_MASTERHOW(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_masterhow_condition;
	information = info_xardasdemon_masterhow_info;
	permanent = 0;
	important = 0;
	description = "Я хочу поговорить с твоим хозяином!";
};


func int info_xardasdemon_masterhow_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterwho))
	{
		return TRUE;
	};
};

func void info_xardasdemon_masterhow_info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01");	//Я хочу поговорить с твоим хозяином!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02");	//Я?.. Недостоин?.. А что за испытание?..
	AI_Output(self,other,"DEM_AMBIENT01");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03");	//... А-а... Понимаю... если кто-то хочет поговорить с твоим хозяином, он должен доказать, что он этого достоин!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04");	//... Подожди, как ты сказал?.. Доказательство?.. Какая-то победа?.. Над стихиями?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05");	//... Камень?.. Лед?.. Огонь?
	FINDGOLEMHEARTS = 1;
	b_logentry(CH4_FINDXARDAS,"В башне Ксардаса меня встретил демон, который говорил со мной, передавая мне свои мысли. Он хочет получить три доказательства победы над стихиями огня, льда и камня, перед тем как я смогу попасть к его хозяину.");
};


instance INFO_XARDASDEMON_NOHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_noheart_condition;
	information = info_xardasdemon_noheart_info;
	permanent = 1;
	important = 0;
	description = "Я не понимаю! Загадки какие-то.";
};


func int info_xardasdemon_noheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && !Npc_HasItems(hero,itat_stonegolem_01) && !Npc_HasItems(hero,itat_icegolem_01) && !Npc_HasItems(hero,itat_firegolem_01) && (FINDGOLEMHEARTS < 4))
	{
		return TRUE;
	};
};

func void info_xardasdemon_noheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01");	//Я не понимаю! Загадки какие-то.
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02");	//... Это я уже слышал, зачем ты это повторяешь?..
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03");	//... А, так тебе нужны доказательства победы над стихиями Огня, Льда и Камня!
};

func void b_xardasdemon_giveheart()
{
	if(FINDGOLEMHEARTS == 1)
	{
		AI_Output(self,other,"DEM_AMBIENT02");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01");	//... Что? А-а!.. Убедительное доказательство!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02");	//...Отсутствуют? Двух еще нет?
		FINDGOLEMHEARTS = 2;
	}
	else if(FINDGOLEMHEARTS == 2)
	{
		AI_Output(self,other,"DEM_AMBIENT01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03");	//... Второе доказательство?.. Теперь у тебя их два?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04");	//... Не хватает еще одного?
		FINDGOLEMHEARTS = 3;
	}
	else if(FINDGOLEMHEARTS == 3)
	{
		AI_Output(self,other,"DEM_WARN01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05");	//... Совершенство?.. Я достоин?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06");	//Если это так, то я хочу поговорить с твоим хозяином!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07");	//... Опровержение?.. Опровержение чего?.. Руна?.. Ты дашь мне руну?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08");	//Тогда я возьму эту руну телепортации в знак того, что я прошел испытание!
		b_printtrademsg1("Получена руна телепортации к некроманту.");
		b_story_accesstoxardas();
	};
};


instance INFO_XARDASDEMON_STONEHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_stoneheart_condition;
	information = info_xardasdemon_stoneheart_info;
	permanent = 0;
	important = 0;
	description = "У меня есть сердце каменного голема!";
};


func int info_xardasdemon_stoneheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_stonegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_stoneheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01");	//У меня есть сердце каменного голема!
	b_printtrademsg1("Отдано сердце каменного голема.");
	b_giveinvitems(hero,self,itat_stonegolem_01,1);
	Npc_RemoveInvItem(self,itat_stonegolem_01);
	b_xardasdemon_giveheart();
};


instance INFO_XARDASDEMON_ICEHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_iceheart_condition;
	information = info_xardasdemon_iceheart_info;
	permanent = 0;
	important = 0;
	description = "Вот второе доказательство - сердце ледяного голема!";
};


func int info_xardasdemon_iceheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_icegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_iceheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01");	//Вот второе доказательство - сердце ледяного голема!
	b_printtrademsg1("Отдано сердце ледяного голема.");
	b_giveinvitems(hero,self,itat_icegolem_01,1);
	b_xardasdemon_giveheart();
};


instance INFO_XARDASDEMON_FIREHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_fireheart_condition;
	information = info_xardasdemon_fireheart_info;
	permanent = 0;
	important = 0;
	description = "Сердце огненного голема - убедительное доказательство?";
};


func int info_xardasdemon_fireheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_firegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_fireheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01");	//Сердце огненного голема - убедительное доказательство?
	b_printtrademsg1("Отдано сердце огненного голема.");
	b_giveinvitems(hero,self,itat_firegolem_01,1);
	b_xardasdemon_giveheart();
};

