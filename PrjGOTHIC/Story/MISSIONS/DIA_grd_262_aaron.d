
instance GRD_262_AARON_EXIT(C_INFO)
{
	npc = grd_262_aaron;
	nr = 999;
	condition = grd_262_aaron_exit_condition;
	information = grd_262_aaron_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_262_aaron_exit_condition()
{
	return 1;
};

func void grd_262_aaron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_262_AARON_CHEST(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_chest_condition;
	information = grd_262_aaron_chest_info;
	important = 0;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int grd_262_aaron_chest_condition()
{
	if((Npc_GetDistToWP(self,"OM_CAVE1_34") < 400) && !Npc_KnowsInfo(hero,grd_262_aaron_bluff))
	{
		return 1;
	};
};

func void grd_262_aaron_chest_info()
{
	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01");	//Что ты здесь делаешь?
	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02");	//Охраняю свой сундук, чтобы рудокопы типа Снайпса не лезли в него.
};


instance GRD_262_AARON_BLUFF(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_bluff_condition;
	information = grd_262_aaron_bluff_info;
	important = 0;
	permanent = 1;
	description = "(отвлечь Аарона)";
};


func int grd_262_aaron_bluff_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal) && (AARON_LOCK != LOG_RUNNING) && (AARON_LOCK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void grd_262_aaron_bluff_info()
{
	Info_ClearChoices(grd_262_aaron_bluff);
	Info_AddChoice(grd_262_aaron_bluff,DIALOG_BACK,grd_262_aaron_bluff_back);
	Info_AddChoice(grd_262_aaron_bluff,"Меня прислал Ян. Он сказал, что хочет видеть тебя!",grd_262_aaron_bluff_ian);
	Info_AddChoice(grd_262_aaron_bluff,"Я слышал, что в шахту пробрались воры. Они хотят украсть руду.",grd_262_aaron_bluff_bandit);
	Info_AddChoice(grd_262_aaron_bluff,"Рудокопы нашли огромный кусок руды!",grd_262_aaron_bluff_ore);
};

func void grd_262_aaron_bluff_ore()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");	//Рудокопы нашли огромный кусок руды!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");	//Ну и что?
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");	//Думаю, тебе интересно будет посмотреть на него.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");	//Да ну его.
};

func void grd_262_aaron_bluff_bandit()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01");	//Я слышал, что в шахту пробрались воры. Они хотят украсть руду.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02");	//Думаешь, я такой идиот, что поверю этому? Да никто не осмелится сюда и носа сунуть.
};

func void grd_262_aaron_bluff_ian()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01");	//Меня прислал Ян. Он сказал, что хочет видеть тебя!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02");	//Чего он хочет?
	Info_ClearChoices(grd_262_aaron_bluff);
	Info_AddChoice(grd_262_aaron_bluff,"А, не знаю...",grd_262_aaron_bluff_ugly);
	Info_AddChoice(grd_262_aaron_bluff,"Он хочет наказать тебя. Говорит, что ты бездельник, каких мало.",grd_262_aaron_bluff_bad);
	Info_AddChoice(grd_262_aaron_bluff,"Он хочет наградить тебя за твою работу.",grd_262_aaron_bluff_good);
};

func void grd_262_aaron_bluff_good()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01");	//Он хочет наградить тебя за твою работу.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02");	//Правда? Если так, разрешаю тебе забрать эту награду.
	Npc_SetTempAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};

func void grd_262_aaron_bluff_bad()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01");	//Он хочет наказать тебя. Говорит, что ты бездельник, каких мало.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02");	//Первый раз что ли? Лучше убирайся отсюда.
	AI_StopProcessInfos(self);
};

func void grd_262_aaron_bluff_ugly()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01");	//А, не знаю, чего он там хочет. Сходи к нему и сам узнай. Думаешь, он рассказал бы мне об этом?
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02");	//Хорошо, уже иду!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"trick");
	AARON_LOCK = LOG_RUNNING;
	SNIPES_DEAL = LOG_SUCCESS;
	grd_262_aaron_bluff.permanent = 0;
	b_logentry(CH2_SNIPESDEAL,"Я сказал Аарону, что Ян хочет его видеть. Он ушел вниз. Надеюсь, у него есть чувство юмора...");
};

func void grd_262_aaron_bluff_back()
{
	Info_ClearChoices(grd_262_aaron_bluff);
};


instance GRD_262_AARON_PISSED(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_pissed_condition;
	information = grd_262_aaron_pissed_info;
	important = 1;
	permanent = 0;
};


func int grd_262_aaron_pissed_condition()
{
	if((AARON_LOCK == LOG_RUNNING) && (Npc_GetDistToWP(hero,"OM_CAVE1_47") < 1000))
	{
		return TRUE;
	};
};

func void grd_262_aaron_pissed_info()
{
	AI_DrawWeapon(self);
	AI_Output(self,other,"Info_Aaron_PISSED_09_01");	//Эй, парень! Следующая такая шутка будет для тебя последней, понял?
	AI_RemoveWeapon(self);
	Npc_ExchangeRoutine(self,"start");
	AARON_LOCK = LOG_SUCCESS;
	b_logentry(CH2_SNIPESDEAL,"Я снова встретил Аарона. Теперь я знаю, что чувства юмора у него нет.");
};


instance GRD_262_AARON_SELL(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_sell_condition;
	information = grd_262_aaron_sell_info;
	important = 0;
	permanent = 0;
	description = "Эй, ты не терял ключ от своего сундука?";
};


func int grd_262_aaron_sell_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal_run))
	{
		return 1;
	};
};

func void grd_262_aaron_sell_info()
{
	AI_Output(other,self,"Info_Aaron_SELL_15_01");	//Эй, ты не терял ключ от своего сундука?
	AI_Output(self,other,"Info_Aaron_SELL_09_02");	//Верно. Даже не хочу предполагать, откуда ты узнал об этом ключе.
	AI_Output(self,other,"Info_Aaron_SELL_09_03");	//Двадцать кусков, если ты вернешь мне ключ.
	b_logentry(CH2_SNIPESDEAL,"Аарон даст мне 20 кусков руды, если я найду ключ от его сундука!");
};


instance GRD_262_AARON_SELLNOW(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_sellnow_condition;
	information = grd_262_aaron_sellnow_info;
	important = 0;
	permanent = 0;
	description = "(продать ключ)";
};


func int grd_262_aaron_sellnow_condition()
{
	if(Npc_KnowsInfo(hero,grd_262_aaron_sell) && Npc_HasItems(hero,itke_om_02))
	{
		return 1;
	};
};

func void grd_262_aaron_sellnow_info()
{
	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01");	//Вот твой ключ.
	b_printtrademsg1("Отдан ключ.");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02");	//Мой ключ, точно. Вот, как мы и договаривались, твои двадцать кусков руды.
	b_printtrademsg2("Получено руды: 20");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03");	//Но, в будущем я с тебя глаз уже не спущу!
	CreateInvItems(self,itminugget,20);
	b_giveinvitems(self,other,itminugget,20);
	b_giveinvitems(hero,self,itke_om_02,1);
	b_givexp(XP_SELLKEYTOAARON);
	b_logentry(CH2_SNIPESDEAL,"Я продал Аарону ключ от его сундука. В этом деле и для меня нашлась выгода!");
	Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_SUCCESS);
};

