
instance INFO_KIRGO_EXIT(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 999;
	condition = info_kirgo_exit_condition;
	information = info_kirgo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_kirgo_exit_condition()
{
	return 1;
};

func void info_kirgo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_KIRGO_WHAT(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_what_condition;
	information = info_kirgo_what_info;
	permanent = 0;
	description = "Привет! Я новенький.";
};


func int info_kirgo_what_condition()
{
	if(KAPITEL <= 2)
	{
		return 1;
	};
};

func void info_kirgo_what_info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//Привет! Я новенький.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//Новичок! Расскажи мне что-нибудь о внешнем мире. Я уже целый месяц не получал оттуда никаких новостей.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//Я Кирго. Я участвую в боях на арене.
};


instance INFO_KIRGO_GOOD(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_good_condition;
	information = info_kirgo_good_info;
	permanent = 0;
	description = "И как проходят твои бои?";
};


func int info_kirgo_good_condition()
{
	if(Npc_KnowsInfo(hero,info_kirgo_what))
	{
		return 1;
	};
};

func void info_kirgo_good_info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//И как проходят твои бои?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//Бои на арене? Я совсем недавно начал этим заниматься, но за мной уже есть одна победа!
};


instance INFO_KIRGO_CHARGE(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_charge_condition;
	information = info_kirgo_charge_info;
	permanent = 0;
	description = "Я вызываю тебя на бой! Пойдем, сразимся на арене!";
};


func int info_kirgo_charge_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_joinoc) && Npc_KnowsInfo(hero,info_kirgo_what) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_kirgo_charge_info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//Я вызываю тебя на бой! Сразимся на арене!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//Что? Но сейчас мне не хочется драться. Пойдем лучше выпьем пива, а ты расскажешь мне, что делается в Миртане.
	Info_ClearChoices(info_kirgo_charge);
	Info_AddChoice(info_kirgo_charge,"Нет! Я хочу драться. Сейчас!",info_kirgo_charge_now);
	Info_AddChoice(info_kirgo_charge,"Ладно, давай выпьем пиво! ",info_kirgo_charge_beer);
};

func void info_kirgo_charge_now()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//Нет! Я хочу драться. Сейчас!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//Как пожелаешь... я готов, скажи, когда начинать.
	Info_ClearChoices(info_kirgo_charge);
};

func void info_kirgo_charge_beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//Ладно, давай выпьем пиво!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//Это тебе!
	b_printtrademsg1("Получено пиво.");
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//Спасибо! Боюсь, я не слишком много смогу рассказать о внешнем мире. Меня два месяца держали в яме, перед тем как забросить сюда.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//Жаль... Ну, что ж... для человека, который два месяца отсидел в яме, ты выглядишь очень неплохо.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//Постараюсь остаться таким и в дальнейшем.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//Зачем тебе драться с одним из нас?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//Я хочу, чтобы обо мне узнали в лагере.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//От Скатти, наверное? Хм, он один из самых влиятельных людей Внешнего Кольца...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//Но если ты действительно хочешь заручиться его поддержкой, ты должен победить Карима. Боюсь только, тебе с ним не справиться!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//Если ты все еще хочешь сразиться со мной, скажи мне. Но мне не очень хочется избивать тебя.
	CreateInvItem(self,itfobeer);
	b_giveinvitems(self,other,itfobeer,1);
	self.npctype = NPCTYPE_FRIEND;
	Info_ClearChoices(info_kirgo_charge);
};


var C_NPC ARENA_FIGHTER_1;
instance INFO_KIRGO_CHARGEREAL(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_chargereal_condition;
	information = info_kirgo_chargereal_info;
	permanent = 1;
	description = "Мы будем сражаться, ты готов?";
};


func int info_kirgo_chargereal_condition()
{
	if(KIRGO_CHARGED == FALSE && Npc_KnowsInfo(hero,info_kirgo_charge) && (!Npc_IsDead(sld_729_kharim) && !Npc_IsDead(tpl_1422_gorhanis)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && ((KHARIM_CHARGED != TRUE) || (KHARIM_CHARGED_END == TRUE)))
	{
		return 1;
	};
};

func void info_kirgo_chargereal_info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//Мы будем сражаться, ты готов?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//Следуй за мной!
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			CreateInvItem(self,itfo_potion_health_03);
			AI_UseItem(self,itfo_potion_health_03);
		};
		AI_StopProcessInfos(self);
		KIRGO_CHARGED = TRUE;
		self.attribute[ATR_HITPOINTS] = 160;
		self.attribute[ATR_HITPOINTS_MAX] = 160;
		Npc_ExchangeRoutine(self,"GUIDE");
		b_fullstop(tpl_1422_gorhanis);
		b_fullstop(sld_729_kharim);
		b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
		b_exchangeroutine(sld_729_kharim,"nopractice");
	};
};


instance INFO_KIRGO_INARENA(C_INFO)
{
	npc = grd_251_kirgo;
	nr = 1;
	condition = info_kirgo_inarena_condition;
	information = info_kirgo_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_kirgo_inarena_condition()
{
	if((KIRGO_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void info_kirgo_inarena_info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,itfo_potion_health_03);
		AI_UseItem(self,itfo_potion_health_03);
	};
	if(!Npc_HasItems(self,itmw_kirgo) && !Npc_HasItems(self,itmw_1h_sword_01))
	{
		CreateInvItem(self,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//Итак, начнем. Пусть победит сильнейший!
	b_clearimmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_exchangeroutine(tpl_1422_gorhanis,"START");
	b_exchangeroutine(sld_729_kharim,"START");
	b_exchangeroutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	KIRGO_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

