
instance INFO_GORHANIS_EXIT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 999;
	condition = info_gorhanis_exit_condition;
	information = info_gorhanis_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorhanis_exit_condition()
{
	return 1;
};

func void info_gorhanis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GORHANIS_WHAT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_what_condition;
	information = info_gorhanis_what_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int info_gorhanis_what_condition()
{
	return 1;
};

func void info_gorhanis_what_info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Я? Я сражаюсь во славу Спящего!
};


instance INFO_GORHANIS_ARENA(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_arena_condition;
	information = info_gorhanis_arena_info;
	permanent = 0;
	description = "Ты сражаешься на арене?";
};


func int info_gorhanis_arena_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_arena_info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Ты сражаешься на арене?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Мои учителя из Братства прислали меня сюда сражаться во славу Спящего.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Я удостоился этой чести, чтобы показать неверным, какой силой меня наделил Спящий!
};


instance INFO_GORHANIS_SLEEPER(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_sleeper_condition;
	information = info_gorhanis_sleeper_info;
	permanent = 0;
	description = "Кто он, этот Спящий?";
};


func int info_gorhanis_sleeper_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_sleeper_info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Кто он, этот Спящий?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//В нашем лагере ты найдешь жрецов, которые смогут рассказать тебе больше, чем я.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Могу сказать тебе только, что Спящий станет нашим спасителем. Он привел нас сюда и он же выведет нас отсюда.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Ты хочешь сказать, что этот бог освободит вас отсюда?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Да! И скоро наше ожидание закончится. Уже идут приготовления к великой Церемонии.
};


instance INFO_GORHANIS_SUMMONING(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_summoning_condition;
	information = info_gorhanis_summoning_info;
	permanent = 0;
	description = "Ты можешь рассказать о Церемонии?";
};


func int info_gorhanis_summoning_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_sleeper))
	{
		return 1;
	};
};

func void info_gorhanis_summoning_info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Ты можешь рассказать о Церемонии?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Наши пророки говорят, что на великой Церемонии мы сможем разбудить Спящего, и он нам даст ключ к свободе!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Если ты хочешь узнать больше, иди в наш лагерь.
};


instance INFO_GORHANIS_WAYTOST(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 0;
	condition = info_gorhanis_waytost_condition;
	information = info_gorhanis_waytost_info;
	permanent = 0;
	description = "Как я найду дорогу к вашему лагерю?";
};


func int info_gorhanis_waytost_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_sleeper) || Npc_KnowsInfo(hero,info_gorhanis_summoning))
	{
		return 1;
	};
};

func void info_gorhanis_waytost_info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Как я найду дорогу к вашему лагерю?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//В Старом лагере всегда можно найти несколько наших послушников, которые провожают новообращенных в наш лагерь. Найди кого-нибудь из них!
};


instance INFO_GORHANIS_CHARGE(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_charge_condition;
	information = info_gorhanis_charge_info;
	permanent = 0;
	description = "Я хочу сразиться с тобой на арене!";
};


func int info_gorhanis_charge_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_arena))
	{
		return 1;
	};
};

func void info_gorhanis_charge_info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Я хочу сразиться с тобой на арене!
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Убийство таких новичков перед толпой зрителей не прибавит славы Спящего.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Я смогу сразиться с тобой только тогда, когда ты будешь достойным противником.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Но я уверен, что бойцы из Старого или Нового лагерей не откажутся от твоего предложения. Они не отличаются высокими моральными принципами.
	}
	else
	{
		if(Wld_IsTime(18,30,23,10))
		{
			AI_Output(self,other,"SVM_8_NotNow");	//Сейчас не время.
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//Теперь ты готов!
			AI_StopProcessInfos(self);
			HANIS_CHARGED = TRUE;
			self.attribute[ATR_HITPOINTS] = 280;
			self.attribute[ATR_HITPOINTS_MAX] = 280;
			Npc_ExchangeRoutine(self,"GUIDE");
			b_fullstop(grd_251_kirgo);
			b_fullstop(sld_729_kharim);
			b_exchangeroutine(grd_251_kirgo,"nopractice");
			b_exchangeroutine(sld_729_kharim,"nopractice");
		};
	};
};


instance INFO_GORHANIS_CHARGEGOOD(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_chargegood_condition;
	information = info_gorhanis_chargegood_info;
	permanent = 1;
	description = "А теперь моей силы достаточно, чтобы сразиться с тобой?";
};


func int info_gorhanis_chargegood_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_charge) && (!Npc_IsDead(sld_729_kharim) && !Npc_IsDead(grd_251_kirgo)) && (HANIS_CHARGED != TRUE))
	{
		return 1;
	};
};

func void info_gorhanis_chargegood_info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//А теперь моей силы достаточно, чтобы сразиться с тобой?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_8_NotNow");	//Сейчас не время.
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Нет! Ты еще недостаточно силен. Ты не можешь быть моим противником!
	}
	else
	{
		AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//Теперь ты готов!
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			CreateInvItem(self,itfo_potion_health_03);
			AI_UseItem(self,itfo_potion_health_03);
		};
		AI_StopProcessInfos(self);
		HANIS_CHARGED = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		b_fullstop(grd_251_kirgo);
		b_fullstop(sld_729_kharim);
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(sld_729_kharim,"nopractice");
	};
};


instance INFO_GORHANIS_INARENA(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_inarena_condition;
	information = info_gorhanis_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_inarena_condition()
{
	if((HANIS_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void info_gorhanis_inarena_info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,itfo_potion_health_03);
		AI_UseItem(self,itfo_potion_health_03);
	};
	if(!Npc_HasItems(self,itmw_gorhanis) && !Npc_HasItems(self,itmw_1h_sword_01))
	{
		CreateInvItem(self,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05");	//Приготовься к встрече с Создателем!
	b_clearimmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_exchangeroutine(grd_251_kirgo,"START");
	b_exchangeroutine(sld_729_kharim,"START");
	b_exchangeroutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	HANIS_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

