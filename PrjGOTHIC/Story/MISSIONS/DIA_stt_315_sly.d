
instance DIA_STT_315_SLY_EXIT(C_INFO)
{
	npc = stt_315_sly;
	nr = 999;
	condition = dia_stt_315_sly_exit_condition;
	information = dia_stt_315_sly_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_stt_315_sly_exit_condition()
{
	return 1;
};

func void dia_stt_315_sly_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_SLY(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_sly_condition;
	information = dia_stt_315_sly_info;
	important = 1;
	permanent = 0;
};


func int dia_stt_315_sly_condition()
{
	return 1;
};

func void dia_stt_315_sly_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"DIA_STT_315_Sly_10_01");	//Я тебя раньше не видел. Ты ведь новенький, не так ли?
	AI_Output(self,other,"DIA_STT_315_Sly_10_02");	//Я Слай. Предлагаю новеньким работу.
};


var int sly_lostnek;

instance DIA_STT_315_LOSTNEK(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_lostnek_condition;
	information = dia_stt_315_lostnek_info;
	permanent = 1;
	description = "Ты можешь предложить мне работу? Какую?";
};


func int dia_stt_315_lostnek_condition()
{
	if(SLY_LOSTNEK != LOG_RUNNING && SLY_LOSTNEK != LOG_SUCCESS && SLY_LOSTNEK != LOG_FAILED)
	{
		return 1;
	};
};

func void dia_stt_315_lostnek_info()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_15_00");	//Ты можешь предложить мне работу? Какую?
	AI_Output(self,other,"DIA_STT_315_LostNek_10_01");	//Пропал один из стражников - Нек! Возможно, он ушел в Новый лагерь.
	AI_Output(self,other,"DIA_STT_315_LostNek_10_02");	//Ты новенький здесь, не вызываешь подозрений. Походи по окрестностям, понаблюдай.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_STT_315_LostNek_10_03");	//А найдешь его, так я замолвлю словечко за тебя в лагере.
	};
	Info_ClearChoices(dia_stt_315_lostnek);
	Info_AddChoice(dia_stt_315_lostnek,"Может, позже...",dia_stt_315_lostnek_later);
	Info_AddChoice(dia_stt_315_lostnek,"Я попробую найти Нека.",dia_stt_315_lostnek_doit);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Info_AddChoice(dia_stt_315_lostnek,"А что это мне даст какое-то там словечко?",dia_stt_315_lostnek_why);
	};
};

func void dia_stt_315_lostnek_later()
{
	AI_Output(other,self,"DIA_Lefty_First_Later_15_00");	//Может, позже...
	AI_StopProcessInfos(self);
};

func void dia_stt_315_lostnek_why()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_Why_15_00");	//А что это мне даст какое-то там словечко?
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_01");	//Если хочешь присоединиться к нашему лагерю, то для начала тебе надо заручиться поддержкой наших людей.
	AI_Output(self,other,"DIA_STT_315_LostNek_Why_10_02");	//Тебе только лучше будет, если я поговорю с Диего.
};

func void dia_stt_315_lostnek_doit()
{
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_00");	//Я попробую найти Нека.
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_01");	//Расспроси о нем Флетчера. После исчезновения Нека, он контролирует его район.
	AI_Output(other,self,"DIA_STT_315_LostNek_DoIt_15_02");	//Где я могу его найти?
	AI_Output(self,other,"DIA_STT_315_LostNek_DoIt_10_03");	//Возле арены.
	SLY_LOSTNEK = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"Призрак Слай пообещал мне замолвить за меня словечко, если я найду Нека. Он думает, что этот стражник перебежал в Новый лагерь. Он посоветовал мне расспросить Флетчера, который следит за порядком возле арены.");
	}
	else
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"Призрак Слай попросил меня найти стражника Нека. Он думает, что тот убежал в Новый лагерь. Он посоветовал мне поговорить с Флетчером, который следит за порядком возле арены.");
	};
	Info_ClearChoices(dia_stt_315_lostnek);
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_LOSTNEKSUCCESS(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_lostneksuccess_condition;
	information = dia_stt_315_lostneksuccess_info;
	permanent = 1;
	description = "Я нашел Нека.";
};


func int dia_stt_315_lostneksuccess_condition()
{
	if((SLY_LOSTNEK == LOG_RUNNING) && (Npc_HasItems(other,neks_amulett) > 0))
	{
		return 1;
	};
};

func void dia_stt_315_lostneksuccess_info()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_15_00");	//Я нашел Нека.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_10_01");	//Хорошо! А доказать можешь?
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	Info_AddChoice(dia_stt_315_lostneksuccess,"Нет, не могу.",dia_stt_315_lostneksuccess_noproof);
	Info_AddChoice(dia_stt_315_lostneksuccess,"Да, на нем был амулет. Вот он.",dia_stt_315_lostneksuccess_proof);
};

func void dia_stt_315_lostneksuccess_proof()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_Proof_15_00");	//Да, на нем был амулет. Вот он.
	b_printtrademsg1("Отдан амулет убитого стражника.");
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_01");	//Амулет. Из-за него-то все и началось. А ты смышленый парень.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_02");	//Уверен, ты хотел оставить амулет себе, но ты правильно сделал, что отдал его.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_STT_315_LostNekSuccess_Proof_10_03");	//Если Диего будет интересно мое мнение, то я буду за тебя.
	};
	SLY_LOSTNEK = LOG_SUCCESS;
	b_giveinvitems(other,self,neks_amulett,1);
	Log_SetTopicStatus(CH1_LOSTNEK,LOG_SUCCESS);
	b_logentry(CH1_LOSTNEK,"Я отдал Слаю амулет Нека. Он был удивлен моей честности.");
	b_givexp(XP_SLYSEARCHFORNEK);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
		b_logentry(CH1_JOINOC,"Я передал Слаю амулет Нека. Он поговорит с Диего и замолвит за меня словечко.");
	}
	else
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
		b_logentry(CH1_JOINOC,"Я отдал Слаю амулет Нека. Но мне это все равно ничего не дало, ведь я больше не смогу вступить в Старый лагерь.");
	};
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	AI_StopProcessInfos(self);
};

func void dia_stt_315_lostneksuccess_noproof()
{
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_00");	//Нет, не могу.
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_01");	//Точно? Ты уверен? У Нека был один амулет...
	AI_Output(self,other,"DIA_STT_315_LostNekSuccess_NoProof_10_02");	//Не люблю, когда мои вещи у чужих людей. Найди этот амулет, он должен быть у меня!
	AI_Output(other,self,"DIA_STT_315_LostNekSuccess_NoProof_15_03");	//Ты первый узнаешь о том, что я нашел амулет.
	b_logentry(CH1_LOSTNEK,"Слай хочет получить амулет Нека в качестве доказательства.");
	Info_ClearChoices(dia_stt_315_lostneksuccess);
	AI_StopProcessInfos(self);
};


instance DIA_STT_315_SLY_AFTERSUCCESS(C_INFO)
{
	npc = stt_315_sly;
	nr = 1;
	condition = dia_stt_315_sly_aftersuccess_condition;
	information = dia_stt_315_sly_aftersuccess_info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int dia_stt_315_sly_aftersuccess_condition()
{
	if((KAPITEL == 1) && (SLY_LOSTNEK == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_stt_315_sly_aftersuccess_info()
{
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_01");	//Все хорошо! Я за тебя, так что можешь не волноваться по поводу Диего!
	AI_Output(other,self,"DIA_STT_315_Sly_AfterSuccess_15_02");	//Услуга за услугу, как всегда?
	AI_Output(self,other,"DIA_STT_315_Sly_AfterSuccess_10_03");	//Да, как всегда.
};

