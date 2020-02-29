
instance VLK_585_ALEPH_EXIT(C_INFO)
{
	npc = vlk_585_aleph;
	nr = 999;
	condition = vlk_585_aleph_exit_condition;
	information = vlk_585_aleph_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_585_aleph_exit_condition()
{
	return 1;
};

func void vlk_585_aleph_exit_info()
{
	if(!Npc_KnowsInfo(hero,grd_261_brandick_aleph))
	{
		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//Желаю удачи!
		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02");	//Ты знаешь, где меня найти.
	};
	AI_StopProcessInfos(self);
};


instance VLK_585_ALEPH_CLEVER(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_clever_condition;
	information = vlk_585_aleph_clever_info;
	important = 1;
	permanent = 0;
};


func int vlk_585_aleph_clever_condition()
{
	return 1;
};

func void vlk_585_aleph_clever_info()
{
	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01");	//Хе-хе-хе, стражники никогда не поймают меня!
};


instance VLK_585_ALEPH_GUARDS(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_guards_condition;
	information = vlk_585_aleph_guards_info;
	important = 0;
	permanent = 0;
	description = "О чем ты говоришь?";
};


func int vlk_585_aleph_guards_condition()
{
	if(Npc_KnowsInfo(hero,vlk_585_aleph_clever))
	{
		return 1;
	};
};

func void vlk_585_aleph_guards_info()
{
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//О чем ты говоришь?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02");	//Я работаю только тогда, когда они подходят слишком близко. Все остальное время я занимаюсь своими делами.
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03");	//Думаю, они все равно тебя подозревают. Зачем это тебе?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04");	//Конечно, ты прав, я получаю так же мало руды, как все здесь. Ее всегда не хватает, так что приходится меняться.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05");	//Я всегда в курсе последних событий. Могу рассказать много интересного. У тебя с собой, случайно, есть руда? Ну, скажем, 10 кусков.
};


instance VLK_585_ALEPH_INFO(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_info_condition;
	information = vlk_585_aleph_info_info;
	important = 0;
	permanent = 0;
	description = "(дать 10 кусков руды)";
};


func int vlk_585_aleph_info_condition()
{
	if((Npc_HasItems(hero,itminugget) >= 10) && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_info_info()
{
	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01");	//Хорошо, возьми десять кусков.
	b_printtrademsg1("Отдано руды: 10");
	b_giveinvitems(other,self,itminugget,10);
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02");	//Спасибо. Если ты вернешься в главный ствол шахты и спустишься вниз, ты увидишь две пещеры.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03");	//В одной из них будет стоять стражник. Там же стоит старый пресс.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04");	//Если тебе повезет, ты найдешь зелье лечения, но будь осторожен, там повсюду ползуны.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05");	//Если захочешь узнать что-нибудь еще, приходи ко мне, уж я смогу тебе помочь...
};


instance VLK_585_ALEPH_ANGRY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_angry_condition;
	information = vlk_585_aleph_angry_info;
	important = 1;
	permanent = 0;
};


func int vlk_585_aleph_angry_condition()
{
	if(Npc_KnowsInfo(hero,grd_261_brandick_aleph))
	{
		return 1;
	};
};

func void vlk_585_aleph_angry_info()
{
	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01");	//Ты рассказал все Брендику! Сгинь, предатель!
	AI_StopProcessInfos(self);
	Npc_SetTempAttitude(self,ATT_ANGRY);
};


instance VLK_585_ALEPH_KEY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_key_condition;
	information = vlk_585_aleph_key_info;
	important = 0;
	permanent = 0;
	description = "Есть какие-нибудь новости? Расскажешь?";
};


func int vlk_585_aleph_key_condition()
{
	if(!Npc_KnowsInfo(hero,grd_261_brandick_aleph) && Npc_KnowsInfo(hero,vlk_585_aleph_info))
	{
		return 1;
	};
};

func void vlk_585_aleph_key_info()
{
	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01");	//Есть какие-нибудь новости? Расскажешь?
	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02");	//А у тебя еще есть руда?
};


instance VLK_585_ALEPH_GLEN(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_glen_condition;
	information = vlk_585_aleph_glen_info;
	important = 0;
	permanent = 0;
	description = "(дать 10 кусков руды)";
};


func int vlk_585_aleph_glen_condition()
{
	if((Npc_HasItems(hero,itminugget) >= 10) && Npc_KnowsInfo(hero,vlk_585_aleph_key))
	{
		return 1;
	};
};

func void vlk_585_aleph_glen_info()
{
	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01");	//Надеюсь, за эти десять кусков ты расскажешь мне что-нибудь стоящее.
	b_printtrademsg1("Отдано руды: 10");
	b_giveinvitems(other,self,itminugget,10);
	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02");	//Здесь очень много запертых сундуков. Отмычки можно купить у рудокопа по имени Глен. Ты найдешь его наверху.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	b_logentry(GE_TRADEROM,"За небольшую плату Алеф рассказал мне, что рудокоп по имени Глен продает отмычки.");
};

func void b_aleph_storageshedkey()
{
	b_logentry(CH2_STORAGESHED,"Алеф продал мне ключ от ящиков на складе!");
};


instance VLK_585_ALEPH_SCHUPPEN(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_schuppen_condition;
	information = vlk_585_aleph_schuppen_info;
	important = 0;
	permanent = 1;
	description = "Ты знаешь что-нибудь о ключе к ящикам на складе?";
};


func int vlk_585_aleph_schuppen_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && !Npc_KnowsInfo(hero,grd_261_brandick_aleph) && ALEPH_KEY == FALSE && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_schuppen_info()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01");	//Ты знаешь что-нибудь о ключе к ящикам на складе?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02");	//Ну, все зависит от...
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03");	//От того, сколько я заплачу?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04");	//Вот, ты быстро учишься.
	Info_ClearChoices(vlk_585_aleph_schuppen);
	Info_AddChoice(vlk_585_aleph_schuppen,DIALOG_BACK,vlk_585_aleph_schuppen_back);
	Info_AddChoice(vlk_585_aleph_schuppen,"Заплатить 50 кусков.",vlk_585_aleph_schuppen_50);
	Info_AddChoice(vlk_585_aleph_schuppen,"Заплатить 30 кусков.",vlk_585_aleph_schuppen_30);
	Info_AddChoice(vlk_585_aleph_schuppen,"Заплатить 15 кусков.",vlk_585_aleph_schuppen_15);
};

func void vlk_585_aleph_schuppen_50()
{
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01");	//50 кусков тебе хватит?
		b_printtrademsg1("Отдано руды: 50");
		b_giveinvitems(other,self,itminugget,50);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02");	//Твоя щедрость безгранична! Возьми ключ. А еще возьми это кольцо. Оно было моим талисманом на счастье.
		b_printtrademsg2("Получен ключ от сундука и кольцо силы.");
		CreateInvItems(other,itke_om_03,1);
		CreateInvItems(other,staerkering,1);
		Info_ClearChoices(vlk_585_aleph_schuppen);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03");	//У тебя же нет руды!
	};
};

func void vlk_585_aleph_schuppen_30()
{
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		Info_ClearChoices(vlk_585_aleph_schuppen);
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//Предлагаю 30 кусков.
		b_printtrademsg1("Отдано руды: 30");
		b_giveinvitems(other,self,itminugget,30);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02");	//Хорошо. У меня как раз есть ключ. Совершенно случайно, кстати.
		b_printtrademsg2("Получен ключ от сундука.");
		CreateInvItem(self,itke_om_03);
		b_giveinvitems(self,other,itke_om_03,1);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03");	//Ты обещаешь то, чего нет!
	};
};

func void vlk_585_aleph_schuppen_15()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01");	//Тебя устроит 15 кусков?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02");	//15 кусков? Никогда не видел никакого ключа!
};

func void vlk_585_aleph_schuppen_back()
{
	Info_ClearChoices(vlk_585_aleph_schuppen);
};


instance VLK_585_ALEPH_DIRTY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_dirty_condition;
	information = vlk_585_aleph_dirty_info;
	important = 0;
	permanent = 1;
	description = "Ты знаешь что-нибудь о ключе к ящикам на складе?";
};


func int vlk_585_aleph_dirty_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && Npc_KnowsInfo(hero,grd_261_brandick_aleph) && ALEPH_KEY == FALSE && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_dirty_info()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01");	//Ты знаешь что-нибудь о ключе к ящикам на складе?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02");	//Ну, ты же знаешь, все зависит...
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03");	//От того, сколько я заплачу?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04");	//Ты быстро все понимаешь. Мне нужно 100 кусков.
	Info_ClearChoices(vlk_585_aleph_dirty);
	Info_AddChoice(vlk_585_aleph_dirty,"(заплатить 100 кусков руды)",vlk_585_aleph_dirty_100);
	Info_AddChoice(vlk_585_aleph_dirty,"(не платить)",vlk_585_aleph_dirty_no);
};

func void vlk_585_aleph_dirty_100()
{
	if(Npc_HasItems(hero,itminugget) >= 100)
	{
		b_printtrademsg1("Отдано руды: 100");
		b_giveinvitems(hero,self,itminugget,100);
		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01");	//Ты меня совсем разоришь. Держи уж свои 100 кусков.
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02");	//Хорошее предложение! Не могу отказать. Держи свой ключ.
		b_printtrademsg2("Получен ключ от сундука.");
		CreateInvItem(self,itke_om_03);
		b_giveinvitems(self,other,itke_om_03,1);
		Info_ClearChoices(vlk_585_aleph_dirty);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03");	//Ты за кого меня принимаешь? 100 кусков и ни одним меньше!
	};
};

func void vlk_585_aleph_dirty_no()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01");	//Сто кусков - да это же целое состояние. И не мечтай!
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02");	//Ну, я никогда не начинал первым. Это ты ко мне все время обращался!..
	Info_ClearChoices(vlk_585_aleph_dirty);
};

