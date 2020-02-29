
instance DIA_BALOR_EXIT(C_INFO)
{
	npc = nov_1304_balor;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_balor_exit_condition()
{
	return 1;
};

func void dia_balor_exit_info()
{
	AI_StopProcessInfos(self);
};


var int balor_botenday;

instance DIA_BALOR_FETCHWEED(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_fetchweed_condition;
	information = dia_balor_fetchweed_info;
	permanent = 0;
	description = "Меня прислал Идол Оран за урожаем болотника.";
};


func int dia_balor_fetchweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_balor_fetchweed_info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//Меня прислал Идол Оран за урожаем болотника.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//Хорошо. Мне не придется относить его самому. Вот, возьми его.
	b_printtrademsg1("Получен болотник (50).");
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//Не забудь заглянуть к Вайрану, на другую сторону болота, если ты у него еще не был.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//Иначе наш дневной урожай кое-кому покажется слишком маленьким. Могут подумать, что ты половину присвоил, хехе.
	b_giveinvitems(self,other,itmi_plants_swampherb_01,50);
	b_logentry(CH1_DELIVERWEED,"Бэлор передал мне дневной урожай болотника для Кор Галома.");
	b_givexp(XP_WEEDFROMBALOR);
	if(!Npc_KnowsInfo(hero,dia_viran_what) && !Npc_KnowsInfo(hero,dia_viran_fetchweed))
	{
		b_logentry(CH1_DELIVERWEED,"По словам Бэлора, на другой стороне болота есть еще одна группа сборщиков болотника. Я не расспросил как следует Идола Орана. Теперь мне придется разыскивать эту группу и постараться не попасться на глаза болотожорам.");
	};
	BALOR_BOTENDAY = Wld_GetDay();
};


var int balor_playercheating;

instance DIA_BALOR_SELLUNDER(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_sellunder_condition;
	information = dia_balor_sellunder_info;
	permanent = 0;
	description = "Да как я могу? И потом... куда мне его девать? Продать кому-то?";
};


func int dia_balor_sellunder_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		return 1;
	};
};

func void dia_balor_sellunder_info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//Да как я могу? И потом... куда мне его девать? Продать кому-то?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//А, я подсказал тебе хорошую идею, да?
	Info_ClearChoices(dia_balor_sellunder);
	Info_AddChoice(dia_balor_sellunder,"Забудь, это была просто шутка.",dia_balor_sellunder_forgetit);
	Info_AddChoice(dia_balor_sellunder,"Если бы ты знал того, кто мог его купить, мы поделили бы прибыль.",dia_balor_sellunder_halfhalf);
	Info_AddChoice(dia_balor_sellunder,"Нет, просто скажи, кто он.",dia_balor_sellunder_comeon);
};

func void dia_balor_sellunder_forgetit()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//Забудь, это была просто шутка.
	Info_ClearChoices(dia_balor_sellunder);
};

func void dia_balor_sellunder_halfhalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//Если бы ты знал того, кто мог бы его купить, мы могли бы поделить прибыль пополам.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//Ну, есть в Новом лагере человек, которого мог бы заинтересовать груз болотника...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//Но если Гуру узнают об этом, они скормят тебя болотожорам! Так что я ничего не знаю, ясно?!
	BALOR_PLAYERCHEATING = TRUE;
	Info_ClearChoices(dia_balor_sellunder);
};

func void dia_balor_sellunder_comeon()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//Нет, просто скажи, кто он.
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//Ишь, чего захотел! Ну, вот что я тебе скажу: если Кор Галом не получит траву, достанется нам обоим! С ним лучше не шутить.
};




instance DIA_BALOR_TELLDEALER(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_telldealer_condition;
	information = dia_balor_telldealer_info;
	permanent = 1;
	description = "Я учту. Так кому в Новом лагере можно продать болотник?";
};


func int dia_balor_telldealer_condition()
{
	if((BALOR_PLAYERCHEATING == TRUE) && (BALOR_TELLSNCDEALER == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_balor_telldealer_info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//Я учту. Так кому в Новом лагере можно продать болотник?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//Конечно, я назову тебе этого человека, а ты сбежишь с нашей травой. Даже не надейся!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//Мне нужен задаток, пятьдесят кусков руды. Тогда и поговорим.
	Info_ClearChoices(dia_balor_telldealer);
	Info_AddChoice(dia_balor_telldealer,"Забудь об этом.",dia_balor_telldealer_forgetit);
	Info_AddChoice(dia_balor_telldealer,"Пятьдесят кусков? Хорошо, держи.",dia_balor_telldealer_pay);
};

func void dia_balor_telldealer_pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//Пятьдесят кусков? Хорошо, держи.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		b_printtrademsg1("Отдано руды: 50");
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//Что ж... Слушай. Его зовут Сайфер. Он почти все время сидит в баре на озере.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//Но будь с ним осторожен. Смотри, чтобы он тебя не обманул.
		b_printtrademsg2("Получен пакет с травой.");
		Info_ClearChoices(dia_balor_telldealer);
		Npc_RemoveInvItems(other,itminugget,50);
		CreateInvItems(other,weedpack,1);
		BALOR_TELLSNCDEALER = TRUE;
		b_logentry(CH1_DELIVERWEED,"Бэлор назвал мне человека из Нового лагеря. Его зовут Сайфер. Я смогу найти его в баре на озере. Гуру будут очень недовольны, если я продам болотник на сторону.");
		b_givexp(XP_BALORNAMEDCIPHER);
		Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
		b_logentry(GE_TRADERNC,"Сайфер продает и покупает разные товары. Он интересуется крупными партиями болотника. Его можно найти в баре на озере около Нового лагеря.");
		b_logentry(GE_TRADERNC,"Я договорился с Бэлором. Каждые несколько дней он будет собирать для меня пакет с урожаем болотника, который я смогу выгодно продать Сайферу.");
		BALOR_BOTENDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Я не вижу руду. Пятьдесят кусков и ни куском меньше, понял?
		Info_ClearChoices(dia_balor_telldealer);
	};
};

func void dia_balor_telldealer_forgetit()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//Не думай, что можно вот так просто заявиться в Новый лагерь и продать весь болотник первому встречному! Если не знаешь нужного человека, у тебя ничего не выйдет.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//Ты можешь рассказать все не тому человеку, и у тебя все отберут.
	Info_ClearChoices(dia_balor_telldealer);
};


instance DIA_BALOR_RIPOFF(C_INFO)
{
	npc = nov_1304_balor;
	nr = 5;
	condition = dia_balor_ripoff_condition;
	information = dia_balor_ripoff_info;
	permanent = 1;
	description = "Это снова я. Мне нужно забрать следующую партию.";
};


func int dia_balor_ripoff_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed) && (BALOR_CAN_GIVE == TRUE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_balor_ripoff_info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//Это снова я. Мне нужно забрать следующую партию.
	if((BALOR_BOTENDAY <= (Wld_GetDay() - 2)))
	{
		if(BALOR_TELLSNCDEALER == TRUE)
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//Еще бы! Чтобы снова отнести его в Новый лагерь.
			AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//Дай мне задаток: пятьдесят кусков руды.
			Info_ClearChoices(dia_balor_ripoff);
			Info_AddChoice(dia_balor_ripoff,"Забудь об этом.",dia_balor_telldealer_forgetit2);
			Info_AddChoice(dia_balor_ripoff,"Ладно, вот тебе руда!",dia_balor_telldealer_pay2);
		}
		else
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//А, это снова ты? Ладно, бери, но только не вздумай нас обмануть!
			b_printtrademsg1("Получен болотник (50).");
			AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//Да что ты, я и не собирался.
			CreateInvItems(self,itmi_plants_swampherb_01,50);
			b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
			BALOR_CAN_GIVE = FALSE;
			BALOR_BOTENDAY = Wld_GetDay();
		};
	}
	else
	{
		if(BALOR_TELLSNCDEALER == TRUE)
		{
			AI_PlayAni(self,"T_SEARCH");
		};
		AI_Output(self,other,"SVM_1_NotNow");	//Я занят!
		AI_StopProcessInfos(self);
	};
};

func void dia_balor_telldealer_pay2()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		b_printtrademsg1("Отдано руды: 50");
		b_printtrademsg2("Получен пакет с травой.");
		Info_ClearChoices(dia_balor_ripoff);
		Npc_RemoveInvItems(other,itminugget,50);
		CreateInvItems(other,weedpack,1);
		BALOR_BOTENDAY = Wld_GetDay();
		BALOR_CAN_GIVE = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Я не вижу руду. Пятьдесят кусков и ни куском меньше, понял?
		Info_ClearChoices(dia_balor_ripoff);
	};
};

func void dia_balor_telldealer_forgetit2()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Забудь об этом.
	AI_Output(self,other,"SVM_1_OkayKeepIt");	//Хорошо, как хочешь! Оставь себе!
	Info_ClearChoices(dia_balor_ripoff);
};

instance DIA_BALOR_PERM(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_perm_condition;
	information = dia_balor_perm_info;
	permanent = 1;
	description = "Что ж, работай хорошо.";
};


func int dia_balor_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		return 1;
	};
};

func void dia_balor_perm_info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//Что ж, работай хорошо.
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//Конечно, а что еще, по-твоему, здесь делаю? Валяюсь в болоте?
};

instance BALOR_GETLOST(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = balor_getlost_condition;
	information = balor_getlost_info;
	permanent = 1;
	important = 1;
};

func int balor_getlost_condition()
{
	if(((BALOR_TRADE_COUNT >= 5) || (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)) && (Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void balor_getlost_info()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		AI_Output(self,other,"SVM_1_YouDefeatedNOV_Guard");	//От тебя здесь одни неприятности. Так дальше не может продолжаться!
	}
	else
	{
		AI_Output(self,other,"SVM_1_SuckerDefeatedNov_Guard");	//Думаешь, ты можешь безнаказанно обижать здесь послушников?
	};
	AI_StopProcessInfos(self);
};

