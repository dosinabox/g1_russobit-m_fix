
instance NOV_1300_TALAS_EXIT(C_INFO)
{
	npc = nov_1300_talas;
	nr = 999;
	condition = nov_1300_talas_exit_condition;
	information = nov_1300_talas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int nov_1300_talas_exit_condition()
{
	return TRUE;
};

func void nov_1300_talas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_UR(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ur_condition;
	information = nov_1300_talas_ur_info;
	important = 0;
	permanent = 0;
	description = "Ты Талас? Это тебя ограбили, да?";
};


func int nov_1300_talas_ur_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringbook) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void nov_1300_talas_ur_info()
{
	AI_Output(other,self,"Nov_1300_Talas_UR_Info_15_01");	//Ты Талас? Это тебя ограбили, да?
	AI_Output(self,other,"Nov_1300_Talas_UR_Info_02_02");	//Оставь меня в покое, я не хочу об этом говорить!
};


instance NOV_1300_TALAS_HELP(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_help_condition;
	information = nov_1300_talas_help_info;
	important = 0;
	permanent = 0;
	description = "Я могу помочь тебе вернуть альманах.";
};


func int nov_1300_talas_help_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_ur) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void nov_1300_talas_help_info()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_Info_15_01");	//Я могу помочь тебе вернуть альманах.
	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_02");	//Правда? Знаешь, на меня напали гоблины... и теперь я должен вернуться туда и добыть книгу.
	AI_Output(self,other,"Nov_1300_Talas_HELP_Info_02_03");	//Послушай, у меня есть идея: давай я покажу тебе, где это находится, а ты заберешь альманах.
	Info_ClearChoices(nov_1300_talas_help);
	Info_AddChoice(nov_1300_talas_help,"Хорошо.",nov_1300_talas_help_ok);
	Info_AddChoice(nov_1300_talas_help,"Это обойдется тебе в тридцать кусков руды.",nov_1300_talas_help_bring);
	Info_AddChoice(nov_1300_talas_help,"Я сделаю это, но только за пятьдесят кусков.",nov_1300_talas_help_more);
};

func void nov_1300_talas_help_ok()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_OK_15_01");	//Хорошо.
	AI_Output(self,other,"Nov_1300_Talas_HELP_OK_02_02");	//Тогда мы можем отправиться прямо сейчас.
	Info_ClearChoices(nov_1300_talas_help);
};

func void nov_1300_talas_help_bring()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_BRING_15_01");	//Это обойдется тебе в тридцать кусков руды.
	AI_Output(self,other,"Nov_1300_Talas_HELP_BRING_02_02");	//Ладно. Мы можем отправиться прямо сейчас.
	b_printtrademsg1("Получено руды: 30");
	CreateInvItems(self,itminugget,30);
	b_giveinvitems(self,hero,itminugget,30);
	Info_ClearChoices(nov_1300_talas_help);
};

func void nov_1300_talas_help_more()
{
	AI_Output(other,self,"Nov_1300_Talas_HELP_MORE_15_01");	//Я сделаю это, но только за пятьдесят кусков.
	AI_Output(self,other,"Nov_1300_Talas_HELP_MORE_02_02");	//Что? Да это же грабеж! Ну хорошо... дай мне знать, когда будешь готов.
	b_printtrademsg1("Получено руды: 50");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,hero,itminugget,50);
	Info_ClearChoices(nov_1300_talas_help);
};


instance NOV_1300_TALAS_READY(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ready_condition;
	information = nov_1300_talas_ready_info;
	important = 0;
	permanent = 0;
	description = "Я готов, мы можем идти.";
};


func int nov_1300_talas_ready_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_help) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void nov_1300_talas_ready_info()
{
	AI_Output(other,self,"Nov_1300_Talas_READY_Info_15_01");	//Я готов, мы можем идти.
	AI_Output(self,other,"Nov_1300_Talas_READY_Info_02_02");	//Иди за мной.
	b_logentry(CH2_BOOK,"Я предложил Таласу вместе вернуть альманах. Он отведет меня к тому месту, где находится книга.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GOBBOCAVE");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_BRIDGE(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_bridge_condition;
	information = nov_1300_talas_bridge_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_bridge_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_ready) && (Npc_GetDistToWP(self,"LOCATION_29_02") < 1000))
	{
		return 1;
	};
};

func void nov_1300_talas_bridge_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_01");	//За мостом в пещере обитают эти чертовы твари. Будь осторожен.
	AI_Output(other,self,"Nov_1300_Talas_BRIDGE_Info_15_02");	//Ты со мной не пойдешь?
	AI_Output(self,other,"Nov_1300_Talas_BRIDGE_Info_02_03");	//Я подожду здесь... гм... буду прикрывать отход.
	b_logentry(CH2_BOOK,"Мы стоим у входа в пещеру гоблинов. Талас не будет сопровождать меня дальше. Мне придется все делать самому.");
};


instance NOV_1300_TALAS_BACK(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_back_condition;
	information = nov_1300_talas_back_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_back_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_bridge) && Npc_HasItems(hero,itwrfokusbuch))
	{
		return 1;
	};
};

func void nov_1300_talas_back_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BACK_Info_02_01");	//Альманах у тебя! Здорово! Теперь мы можем вернуться в лагерь.
	b_logentry(CH2_BOOK,"Я нашел альманах. Вместе с Таласом мы отнесем его в Болотный лагерь.");
	Npc_ExchangeRoutine(self,"RETURNTOCAMP");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_RETURNED(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_returned_condition;
	information = nov_1300_talas_returned_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_returned_condition()
{
	if(Npc_KnowsInfo(hero,nov_1300_talas_back) && Npc_HasItems(hero,itwrfokusbuch) && (Npc_GetDistToWP(self,"PSI_START") < 1000) && (CORKALOM_BRINGBOOK != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void nov_1300_talas_returned_info()
{
	AI_Output(self,other,"Info_Talas_RETURNED_02_01");	//Вот мы и дома. Тебе лучше поскорее отдать альманах Кор Галому.
	AI_Output(other,self,"Info_Talas_RETURNED_15_02");	//Будь осторожен и не переживай за меня!
	AI_Output(self,other,"Info_Talas_RETURNED_02_03");	//Уж точно не буду! Не стоит даже и волноваться.
	b_logentry(CH2_BOOK,"Мы пришли в Болотный лагерь. Талас оказался тем еще трусом. Я сам отнесу альманах Кор Галому.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BackInCamp");
	AI_StopProcessInfos(self);
};


instance NOV_1300_TALAS_OGY(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_ogy_condition;
	information = nov_1300_talas_ogy_info;
	important = 0;
	permanent = 0;
	description = "Меня прислал Кор Ангар.";
};


func int nov_1300_talas_ogy_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_where))
	{
		return 1;
	};
};

func void nov_1300_talas_ogy_info()
{
	AI_Output(other,self,"Nov_1300_Talas_OGY_15_01");	//Меня прислал Кор Ангар. Он сказал, что ты сможешь отвести меня к кладбищу орков. Мне нужно найти Идола Люкора и Стражей, которые ушли с ним.
	AI_Output(self,other,"Nov_1300_Talas_OGY_02_02");	//Так, я снова посыльный. Черт! Если бы я не потерял этот альманах...
	AI_Output(self,other,"Nov_1300_Talas_OGY_02_03");	//Ну хорошо, иди за мной.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OGY");
};


instance NOV_1300_TALAS_BACKAGAIN(C_INFO)
{
	npc = nov_1300_talas;
	condition = nov_1300_talas_backagain_condition;
	information = nov_1300_talas_backagain_info;
	important = 1;
	permanent = 0;
};


func int nov_1300_talas_backagain_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_011") < 1000)
	{
		return 1;
	};
};

func void nov_1300_talas_backagain_info()
{
	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_01");	//Через мост я с тобой не пойду, жизнь еще мне дорога.
	AI_Output(self,other,"Nov_1300_Talas_BACKAGAIN_Info_02_02");	//Нужно быть ненормальным, чтобы соваться туда. Даже Люкор со своими Стражами - и тот не вернулся.
	AI_Output(other,self,"Nov_1300_Talas_BACKAGAIN_Info_15_03");	//Что ж, посмотрим, что там такое. Возвращайся в лагерь, а я приду туда позже.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ReturnToCampAgain");
};

