
instance DIA_MILTEN_EXIT(C_INFO)
{
	npc = pc_mage;
	nr = 999;
	condition = dia_milten_exit_condition;
	information = dia_milten_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_milten_exit_condition()
{
	return 1;
};

func void dia_milten_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_00");	//Идем.
	}
	else
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_01");	//Увидимся.
	};
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_FIRST(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_first_condition;
	information = dia_milten_first_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_first_condition()
{
	if((CORKALOM_BRINGMCQBALLS != LOG_SUCCESS) && !Npc_KnowsInfo(hero,grd_200_thorus_wannabemage) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_milten_first_info()
{
	AI_Output(self,other,"DIA_Milten_First_02_00");	//Ты не должен переступать этот порог до тех пор, пока не получишь разрешение от господина Корристо.
};


instance DIA_MILTEN_HELLO(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_hello_condition;
	information = dia_milten_hello_info;
	permanent = 0;
	description = "Я ищу Верховного Мага Круга Огня.";
};


func int dia_milten_hello_condition()
{
	if((SATURAS_BRINGFOCI == FALSE) && !Npc_KnowsInfo(hero,dia_milten_gotocorristo))
	{
		return 1;
	};
};

func void dia_milten_hello_info()
{
	AI_Output(other,self,"DIA_Milten_Hello_15_00");	//Я ищу Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Milten_Hello_02_01");	//Это Корристо. Зачем он тебе нужен?
};


instance DIA_MILTEN_GOTOCORRISTO(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_gotocorristo_condition;
	information = dia_milten_gotocorristo_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_gotocorristo_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_200_thorus_wannabemage)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_milten_gotocorristo_info()
{
	var C_NPC corristo;
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01");	//Мы слышали о твоих подвигах в Старой шахте. Без ползунов добыча руды идет гораздо спокойнее.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02");	//Корристо тоже слышал о тебе. Он хочет поговорить с тобой. Иди к нему.
	if((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1))
	{
		AI_Output(other,self,"DIA_Milten_Letter_15_00");	//У меня есть письмо для Верховного Мага Круга Огня.
		AI_Output(self,other,"DIA_Milten_Letter_02_03");	//Покажи мне это письмо.
		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//Вот оно.
		b_usefakescroll();
		if(Npc_HasItems(other,itwr_fire_letter_01))
		{
			b_printtrademsg1("Отдано запечатанное письмо.");
			b_givexp(XP_XARDASLETTER);
			Npc_RemoveInvItem(other,itwr_fire_letter_01);
		}
		else if(Npc_HasItems(other,itwr_fire_letter_02))
		{
			b_printtrademsg1("Отдано вскрытое письмо.");
			b_givexp(XP_XARDASLETTEROPEN);
			Npc_RemoveInvItem(other,itwr_fire_letter_02);
		};
		corristo = Hlp_GetNpc(kdf_402_corristo);
		CreateInvItem(corristo,itwr_fire_letter_02);
		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//А я не заслужил награды?
		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//В этом больше нет необходимости.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"Я доставил письмо магам. Принеси я его пораньше, то получил бы награду, жаль.");
			Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
			PYROCAR_MESSENGER = LOG_SUCCESS;
		};
	};
};


var int milten_hasletter;

instance DIA_MILTEN_LETTER(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_letter_condition;
	information = dia_milten_letter_info;
	permanent = 0;
	description = "У меня есть письмо для Верховного Мага Круга Огня.";
};


func int dia_milten_letter_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_hello) && ((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1)) && (KAPITEL < 4) && (SATURAS_BRINGFOCI == FALSE))
	{
		return 1;
	};
};

func void dia_milten_letter_info()
{
	AI_Output(other,self,"DIA_Milten_Letter_15_00");	//У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Milten_Letter_02_01");	//Ты гонец из Внешнего Мира?
	AI_Output(other,self,"DIA_Milten_Letter_15_02");	//Да, один маг передал мне письмо, перед тем как меня забросили в колонию.
	AI_Output(self,other,"DIA_Milten_Letter_02_03");	//Покажи мне это письмо.
	Info_ClearChoices(dia_milten_letter);
	Info_AddChoice(dia_milten_letter,"Сначала я хочу получить награду.",dia_milten_letter_no);
	Info_AddChoice(dia_milten_letter,"Вот оно.",dia_milten_letter_give);
};

func void dia_milten_letter_give()
{
	var C_NPC corristo;
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//Вот оно.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03");	//Это письмо адресовано Ксардасу!
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04");	//И что в этом необычного?
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05");	//Ксардас оставил служение Инносу много лет назад. Он ушел отсюда и посвятил свою жизнь черной магии.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06");	//Он живет в башне в центре земель орков и занимается только своими исследованиями.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07");	//Он сказал, что выяснит сам, что пошло не так при возведении Барьера.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08");	//Жди здесь. Я скоро вернусь.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	if(Npc_HasItems(other,itwr_fire_letter_01))
	{
		b_printtrademsg1("Отдано запечатанное письмо.");
		b_givexp(XP_XARDASLETTER);
		Npc_RemoveInvItem(other,itwr_fire_letter_01);
	}
	else if(Npc_HasItems(other,itwr_fire_letter_02))
	{
		b_printtrademsg1("Отдано вскрытое письмо.");
		b_givexp(XP_XARDASLETTEROPEN);
		Npc_RemoveInvItem(other,itwr_fire_letter_02);
	};
	corristo = Hlp_GetNpc(kdf_402_corristo);
	CreateInvItem(corristo,itwr_fire_letter_02);
	MILTEN_HASLETTER = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void dia_milten_letter_no()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00");	//Сначала я хочу получить награду.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01");	//Корристо прикажет Торрезу выдать ее тебе, как только получит письмо.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02");	//Я служитель Инноса, и никогда не лгу. Теперь ты можешь отдать мне письмо.
	Info_ClearChoices(dia_milten_letter);
	Info_AddChoice(dia_milten_letter,"Нет, я бы сам хотел отдать это письмо Торрезу.",dia_milten_letter_no_again);
	Info_AddChoice(dia_milten_letter,"Вот оно.",dia_milten_letter_give);
};

func void dia_milten_letter_no_again()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00");	//Нет, я бы сам хотел отдать это письмо Торрезу.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01");	//Смогу ли я тебя переубедить?
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02");	//Нет. Сначала я хочу получить награду.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03");	//Хорошо. Если ты этого хочешь. Жди здесь.
	Info_ClearChoices(dia_milten_letter);
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	MILTEN_HASLETTER = FALSE;
	Npc_SetRefuseTalk(self,10);
};


instance DIA_MILTEN_COMESBACK(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_comesback_condition;
	information = dia_milten_comesback_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_comesback_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_letter) && (Npc_RefuseTalk(self) == FALSE) && (KAPITEL <= 3))
	{
		return 1;
	};
};

func void dia_milten_comesback_info()
{
	if(MILTEN_HASLETTER == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_00");	//Корристо огорчило известие о том, что ты не доверяешь служителям Инноса.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_01");	//Но он позволил тебе встретиться с Торрезом и получить обычную награду.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"Мильтен направил меня к Торрезу. Я не отдам такое ценное послание просто так, сначала мне нужна награда!");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_02");	//Корристо был в полном восторге. Он сказал, что ты можешь встретиться с Торрезом и выбрать себе награду.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"Мильтен отнес письмо верховному магу, Корристо. Мне полагается награда за доставку, теперь нужно поговорить с Торрезом.");
		};
	};
};


instance DIA_MILTEN_WOTORREZ(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_wotorrez_condition;
	information = dia_milten_wotorrez_info;
	permanent = 0;
	description = "Где найти Торреза?";
};


func int dia_milten_wotorrez_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (SATURAS_BRINGFOCI == FALSE))
	{
		return 1;
	};
};

func void dia_milten_wotorrez_info()
{
	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00");	//Где найти Торреза?
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01");	//Весь день он стоит перед храмом.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02");	//Ночи же он проводит в своей келье. Поскольку лишь маги могут войти в храм, тебе придется поговорить с ним днем.
};


instance DIA_MILTEN_NOCHEINBRIEF(C_INFO)
{
	npc = pc_mage;
	nr = 2;
	condition = dia_milten_nocheinbrief_condition;
	information = dia_milten_nocheinbrief_info;
	permanent = 0;
	description = "У меня есть письмо от магов Воды.";
};


func int dia_milten_nocheinbrief_condition()
{
	if((CRONOS_MESSENGER == LOG_RUNNING) && (KAPITEL <= 3) && (Npc_HasItems(hero,cronos_brief) >= 1))
	{
		return 1;
	};
};

func void dia_milten_nocheinbrief_info()
{
	var C_NPC corristo;
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//У меня есть письмо от магов Воды.
	b_printtrademsg1("Отдано письмо Кроноса.");
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01");	//А! Очень хорошо! Я передам его Корристо.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02");	//Когда вернешься в Новый лагерь, маги Воды вознаградят тебя за труды.
	b_logentry(KDWLETTER,"Мильтен получил письмо магов Воды, нужно сообщить об успехе Кроносу.");
	Npc_RemoveInvItem(other,cronos_brief);
	corristo = Hlp_GetNpc(kdf_402_corristo);
	CreateInvItem(corristo,cronos_brief);
};


instance DIA_MILTEN_PERM(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_perm_condition;
	information = dia_milten_perm_info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о магах Огня.";
};


func int dia_milten_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (KAPITEL <= 3))
	{
		return 1;
	};
};

func void dia_milten_perm_info()
{
	AI_Output(other,self,"DIA_Milten_PERM_15_00");	//Расскажи мне что-нибудь о магах Огня.
	AI_Output(self,other,"DIA_Milten_PERM_02_01");	//Круг Огня обретает свою силу с благословения Инноса. Бог света и истины благоволит нам.
	AI_Output(self,other,"DIA_Milten_PERM_02_02");	//Маги считают себя избранными, ну и ко всем остальным относятся соответственно.
	AI_Output(self,other,"DIA_Milten_PERM_02_03");	//Мне повезло, что меня приняли. Корристо сделал меня своим учеником. По-моему, он просто хотел немного развлечься.
	AI_Output(self,other,"DIA_Milten_PERM_02_04");	//С тех пор я ежедневно совершенствую свои магические навыки, чтобы быть допущенным в следующий Круг.
};


instance DIA_MILTEN_WANNAMAGE(C_INFO)
{
	npc = pc_mage;
	nr = 2;
	condition = dia_milten_wannamage_condition;
	information = dia_milten_wannamage_info;
	permanent = 1;
	description = "Я тоже хочу стать учеником мага. Таким, как ты.";
};


func int dia_milten_wannamage_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_perm) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS) && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void dia_milten_wannamage_info()
{
	AI_Output(other,self,"DIA_Milten_WannaMage_15_00");	//Я тоже хочу стать учеником мага. Таким, как ты.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_01");	//Корристо выбрал меня, потому что я помогал Баронам.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_02");	//До тех пор, пока ты не сделаешь что-нибудь исключительное, он и разговаривать не захочет о твоем обучении.
	if(Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 2)
	{
		AI_Output(self,other,"DIA_Milten_WannaMage_02_03");	//Помимо этого, ты должен принадлежать к Старому лагерю. Сомневаюсь, что Корристо возьмет себе в ученики человека из другой части колонии.
	};
};


instance INFO_MILTEN_SHWAIT(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shwait_condition;
	information = info_milten_shwait_info;
	important = 1;
	permanent = 0;
};


func int info_milten_shwait_condition()
{
	if(Npc_GetDistToWP(hero,"OW_PATH_274") < 1000 && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void info_milten_shwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01");	//Приветствую! Мой друг Лестер из Болотного лагеря рассказал мне о тебе.
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02");	//Я поражен. Ты стал очень сильным.
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//Так, стараюсь...
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04");	//Ах, да. Как всегда скромен, да?
};


instance INFO_MILTEN_SHGORN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shgorn_condition;
	information = info_milten_shgorn_info;
	important = 0;
	permanent = 0;
	description = "Я видел Горна.";
};


func int info_milten_shgorn_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && Npc_KnowsInfo(hero,info_gorn_ruinsuccess))
	{
		return TRUE;
	};
};

func void info_milten_shgorn_info()
{
	AI_Output(hero,self,"Info_Milten_SHGORN_15_01");	//Я видел Горна.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_02");	//В самом деле? И где?
	AI_Output(hero,self,"Info_Milten_SHGORN_15_03");	//В руинах монастыря у моря. Мы искали там сокровища.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_04");	//Уверен, что он расскажет мне обо всем, когда мы встретимся вновь.
};


instance INFO_MILTEN_SHLESTER(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shlester_condition;
	information = info_milten_shlester_info;
	important = 0;
	permanent = 0;
	description = "Мы с Лестером осматривали форт в горах.";
};


func int info_milten_shlester_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void info_milten_shlester_info()
{
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01");	//Мы с Лестером осматривали форт в горах.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02");	//Он говорил мне об этом. Думаю, тебе можно доверять.
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03");	//Так где же вы встречались до этого?
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04");	//О, здесь и там - в самых разных местах.
};


instance INFO_MILTEN_SHYOU(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shyou_condition;
	information = info_milten_shyou_info;
	important = 0;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int info_milten_shyou_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait))
	{
		return 1;
	};
};

func void info_milten_shyou_info()
{
	AI_Output(hero,self,"Info_Milten_SHYOU_15_01");	//Что ты здесь делаешь?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_02");	//Неподалеку отсюда находится древнее каменное кольцо, в центре которого есть вход в подземелье.
	AI_Output(hero,self,"Info_Milten_SHYOU_15_03");	//Что-то вроде склепа?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_04");	//Да, что-то вроде.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_05");	//Мне нужно кое-что добыть из этого склепа.
};


instance INFO_MILTEN_SHME(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shme_condition;
	information = info_milten_shme_info;
	important = 0;
	permanent = 0;
	description = "Я ищу юнитор. Он должен быть где-то здесь.";
};


func int info_milten_shme_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && !Npc_KnowsInfo(hero,info_milten_shaccept))
	{
		return 1;
	};
};

func void info_milten_shme_info()
{
	AI_Output(hero,self,"Info_Milten_SHME_15_01");	//Я ищу юнитор. Он должен быть где-то здесь.
	AI_Output(self,hero,"Info_Milten_SHME_02_02");	//Похоже, нам обоим нужно попасть в одно и то же место.
};


instance INFO_MILTEN_SHPROBLEM(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shproblem_condition;
	information = info_milten_shproblem_info;
	important = 0;
	permanent = 0;
	description = "Почему ты сам не можешь пойти в склеп и взять то, что тебе нужно?";
};


func int info_milten_shproblem_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shyou))
	{
		return TRUE;
	};
};

func void info_milten_shproblem_info()
{
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01");	//А почему ты сам не можешь пойти в склеп и взять там то, что тебе нужно?
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02");	//А, долгая история. Слишком многое придется рассказывать, чтобы объяснить.
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03");	//Расскажи, я не тороплюсь!
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04");	//Хорошо! После сотворения магического Барьера, поработившего всех нас...
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05");	//...один из магов укрыл там магический артефакт.
};


instance INFO_MILTEN_SHFOCUS(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shfocus_condition;
	information = info_milten_shfocus_info;
	important = 0;
	permanent = 0;
	description = "Ты говоришь об одном из камней-юниторов?";
};


func int info_milten_shfocus_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shproblem))
	{
		return TRUE;
	};
};

func void info_milten_shfocus_info()
{
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01");	//Ты говоришь об одном из камней-юниторов?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02");	//Точно! Так ты уже знаешь историю об этих пяти камнях?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03");	//Скажи, а ты сюда, случайно, не за юнитором пришел?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04");	//Нет, юнитор мне не нужен, но зато я ищу талисман орков.
};


instance INFO_MILTEN_SHSEAL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shseal_condition;
	information = info_milten_shseal_info;
	important = 0;
	permanent = 0;
	description = "И этот артефакт находится в склепе?";
};


func int info_milten_shseal_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shproblem))
	{
		return TRUE;
	};
};

func void info_milten_shseal_info()
{
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01");	//И этот артефакт находится в склепе?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02");	//Да. Его защищает могущественная магия. Первый из воров, кто попытается стянуть юнитор...
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03");	//...будет проклят и обречен в облике нежити охранять гробницу от других воров... Вечно.
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04");	//А мы можем обойти это заклятье?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//В этом больше нет необходимости.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06");	//Несколько лет назад один из Баронов, развлекавшийся охотой на орков, решил заглянуть в гробницу.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07");	//И теперь он стережет там сокровища.
};


instance INFO_MILTEN_SHTALISMAN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shtalisman_condition;
	information = info_milten_shtalisman_info;
	important = 0;
	permanent = 0;
	description = "А что это за талисман?";
};


func int info_milten_shtalisman_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shfocus))
	{
		return TRUE;
	};
};

func void info_milten_shtalisman_info()
{
	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01");	//А что это за талисман?
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02");	//Я думаю, последний владелец использовал его для защиты от злобных орков.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03");	//Если я прав, этот талисман может оказаться очень полезным.
};


instance INFO_MILTEN_SHOFFER(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shoffer_condition;
	information = info_milten_shoffer_info;
	important = 0;
	permanent = 0;
	description = "Нам нужно осмотреть гробницу. Ты найдешь талисман, а я - юнитор.";
};


func int info_milten_shoffer_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shseal) && Npc_KnowsInfo(hero,info_milten_shtalisman))
	{
		return TRUE;
	};
};

func void info_milten_shoffer_info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01");	//Нам нужно вместе осмотреть эту гробницу. Ты найдешь талисман, а я - юнитор.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02");	//Все это хорошо, но есть одна проблема...
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03");	//Проблема?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04");	//Да. Тот, кто охраняет эту гробницу.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05");	//А разве его нельзя просто порубить на куски?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06");	//Это не так-то просто. Кажется, он не вполне поддается обычному оружию.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07");	//Мне кажется, что ты уже что-то придумал. У тебя есть план?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08");	//Хм... ну... план-то есть, но одному мне не справиться.
};


instance INFO_MILTEN_SHOFFER2(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shoffer2_condition;
	information = info_milten_shoffer2_info;
	important = 0;
	permanent = 0;
	description = "Ну, и какой у тебя план?";
};


func int info_milten_shoffer2_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shoffer))
	{
		return TRUE;
	};
};

func void info_milten_shoffer2_info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01");	//Ну, и какой у тебя план?
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02");	//У меня есть свиток с очень мощным заклинанием.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03");	//Оно способно уничтожить любую нежить.
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04");	//Но тогда осмотреть гробницу будет проще простого!
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05");	//Ну... Не совсем. С некоторых пор там обитает не только страж.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06");	//Все те грабители, что были после него, оказались столь же невезучими.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07");	//Я уже один раз спускался туда и едва не погиб. Одному там не справиться.
};


instance INFO_MILTEN_SHACCEPT(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shaccept_condition;
	information = info_milten_shaccept_info;
	important = 0;
	permanent = 0;
	description = "Дай мне этот свиток, и мы пойдем туда вместе!";
};


func int info_milten_shaccept_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shoffer2))
	{
		return TRUE;
	};
};

func void info_milten_shaccept_info()
{
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01");	//Дай мне этот свиток, и мы пойдем туда вместе!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02");	//Хорошо! Я надеялся, что ты это скажешь!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03");	//Но у нас всего один свиток. Необходимо приберечь его для стража.
	b_printtrademsg1("Получен свиток уничтожения нежити.");
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04");	//С остальной нежитью придется сражаться обычным оружием.
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05");	//Понятно. Как пройти к кругу камней?
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//Иди за мной.
	Log_CreateTopic(CH3_STONEHENGE,LOG_MISSION);
	Log_SetTopicStatus(CH3_STONEHENGE,LOG_RUNNING);
	b_logentry(CH3_STONEHENGE,"Недалеко от круга камней я встретил мага Огня Мильтена. Он сказал мне, что юнитор, который я ищу, находится в склепе под этим сооружением.");
	b_logentry(CH3_STONEHENGE,"Мильтен дал мне свиток, с помощью которого можно победить стража склепа. Мы решили вместе осмотреть это помещение.");
	CreateInvItem(self,itarscrolldestroyundead);
	b_giveinvitems(self,hero,itarscrolldestroyundead,1);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHGuide");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHARRIVED(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_sharrived_condition;
	information = info_milten_sharrived_info;
	important = 1;
	permanent = 0;
};


func int info_milten_sharrived_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_sharrived_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01");	//Вот мы и пришли. Этот туннель ведет прямо в гробницу.
	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02");	//Тогда пойдем, навестим этого стража!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHHEAL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shheal_condition;
	information = info_milten_shheal_info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Помоги мне!";
};


func int info_milten_shheal_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (MILTEN_HEAL < 4))
	{
		return TRUE;
	};
};

func void info_milten_shheal_info()
{
	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01");	//Я ранен. Помоги мне!
	if(MILTEN_HEAL == 0)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 1;
	}
	else if(MILTEN_HEAL == 1)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 2;
	}
	else if(MILTEN_HEAL == 2)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 3;
	}
	else
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03");	//У меня больше нет целебных эликсиров.
		MILTEN_HEAL = 4;
	};
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHRUNNING(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shrunning_condition;
	information = info_milten_shrunning_info;
	important = 0;
	permanent = 1;
	description = "Страж все еще жив!";
};


func int info_milten_shrunning_condition()
{
	var int keeperfound;
	Npc_PerceiveAll(self);
	keeperfound = Wld_DetectNpc(self,zombiethekeeper,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && (keeperfound && !Npc_IsDead(other)))
	{
		return TRUE;
	};
};

func void info_milten_shrunning_info()
{
	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01");	//Страж все еще жив!
	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02");	//Так уничтожь его, прочитав свиток с заклинанием!
};


instance INFO_MILTEN_SHSCROLL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shscroll_condition;
	information = info_milten_shscroll_info;
	important = 0;
	permanent = 0;
	description = "Я использовал свиток... но я не убил стража!";
};


func int info_milten_shscroll_condition()
{
	var int keeperfound;
	Npc_PerceiveAll(self);
	keeperfound = Wld_DetectNpc(self,zombiethekeeper,NOFUNC,-1);
	if(keeperfound && !Npc_IsDead(other) && Npc_KnowsInfo(hero,info_milten_shaccept) && (Npc_HasItems(hero,itarscrolldestroyundead) == 0) && (Npc_HasItems(hero,itarrune_6_1_destroyundead) == 0))
	{
		return TRUE;
	};
};

func void info_milten_shscroll_info()
{
	var C_NPC npc;
	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01");	//Я использовал свиток... но я не убил стража!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02");	//Только не это! Придумай, как еще можно победить его!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03");	//Может быть, мы сможем купить еще один свиток или какую-нибудь руну в одном из лагерей?
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04");	//Я буду ждать тебя там, где мы встретились в прошлый раз.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHWait");
	if(c_npcbelongstooldcamp(hero))
	{
		npc = Hlp_GetNpc(kdf_405_torrez);
		CreateInvItem(npc,itarscrolldestroyundead);
	}
	else if(c_npcbelongstonewcamp(hero))
	{
		npc = Hlp_GetNpc(kdw_604_cronos);
		CreateInvItem(npc,itarscrolldestroyundead);
	}
	else
	{
		npc = Hlp_GetNpc(gur_1208_baalcadar);
		CreateInvItem(npc,itarscrolldestroyundead);
	};
};


instance INFO_MILTEN_SHNEWSCROLL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shnewscroll_condition;
	information = info_milten_shnewscroll_info;
	important = 0;
	permanent = 0;
	description = "У меня теперь есть заклинание 'Уничтожить Нежить'!";
};


func int info_milten_shnewscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shscroll) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && ((Npc_HasItems(hero,itarscrolldestroyundead) > 0) || (Npc_HasItems(hero,itarrune_6_1_destroyundead) > 0)))
	{
		return TRUE;
	};
};

func void info_milten_shnewscroll_info()
{
	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01");	//У меня теперь есть заклинание 'Уничтожить Нежить'!
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02");	//Хорошо. Значит, мы можем еще раз наведаться в гости к стражу.
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03");	//Иди вперед, я пойду за тобой.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHFollow");
};


instance INFO_MILTEN_SHLEAVE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shleave_condition;
	information = info_milten_shleave_info;
	important = 1;
	permanent = 1;
};


func int info_milten_shleave_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") > 10000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_shleave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01");	//Похоже, гробница тебя больше не интересует.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02");	//Если все-таки передумаешь, ты можешь найти меня там, где мы встретились с тобой в прошлый раз.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SHWait");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHCONTINUE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shcontinue_condition;
	information = info_milten_shcontinue_info;
	important = 0;
	permanent = 1;
	description = "Пройдем еще раз мимо стража?";
};


func int info_milten_shcontinue_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 9000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_shcontinue_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01");	//Пройдем еще раз мимо стража?
	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02");	//Я готов. Иди вперед, я пойду следом.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


var int orctalismanisfound;

instance INFO_MILTEN_SHSUCCESS(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shsuccess_condition;
	information = info_milten_shsuccess_info;
	important = 1;
	permanent = 0;
};


func int info_milten_shsuccess_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && Npc_HasItems(hero,itmi_orctalisman) && (c_bodystatecontains(hero,BS_RUN) || c_bodystatecontains(hero,BS_WALK) || c_bodystatecontains(hero,BS_JUMP) || (ORCTALISMANISFOUND == 1) || Npc_HasReadiedWeapon(hero)) && (Npc_GetDistToPlayer(self) < 1000))
	{
		ORCTALISMANISFOUND = 1;
		return TRUE;
	};
};

func void info_milten_shsuccess_info()
{
	AI_UnreadySpell(hero);
	AI_RemoveWeapon(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01");	//Хорошо. Теперь у тебя есть талисман.
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//Вот, возьми его. Как ты и просил.
	b_printtrademsg1("Отдан талисман орков.");
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03");	//Спасибо, друг. Я никогда не забываю тех, кто помог мне.
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04");	//Я возвращаюсь в Старый лагерь. Может быть, мы там еще встретимся.
	b_giveinvitems(hero,self,itmi_orctalisman,1);
	b_logentry(CH3_STONEHENGE,"Вместе мы смогли победить стража склепа. Мильтен нашел то, что искал, и решил вернуться в Старый лагерь.");
	b_logentry(CH3_STONEHENGE,"Сатурас обрадуется, когда я принесу ему юнитор, который здесь нашел!");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ReturnToOC");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_OCWARN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocwarn_condition;
	information = info_milten_ocwarn_info;
	important = 1;
	permanent = 0;
};


func int info_milten_ocwarn_condition()
{
	if(KAPITEL == 4 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_milten_ocwarn_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_OCWARN_02_01");	//Они... Они все мертвы... Все мертвы. Я не мог им помочь... Я был... Меня там не было... Я...
	if(Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_02");	//Не волнуйся, Мильтен, я только что говорил с Диего. Он прятался на другой стороне лагеря.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_03");	//Тогда ты должен знать... Что сказал Диего?
		AI_Output(hero,self,"Info_Milten_OCWARN_15_04");	//Если я встречу Горна и Лестера, я скажу им, что он хочет видеть их на вашем обычном месте.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_05");	//Удачи! Будь осторожен!
		b_logentry(CH4_FIREMAGES,"Мильтен прячется недалеко от Старого лагеря, как и Диего. Он предупреждает об опасности всех, кто решился зайти в лагерь.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_06");	//Успокойся, Мильтен, что случилось?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_07");	//Все маги Огня мертвы! Все, кроме меня, и я тоже был на волосок от смерти.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_08");	//Лучше расскажи мне все по порядку.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_09");	//Ладно. Спокойно, Мильтен, спокойно...
		AI_Output(self,hero,"Info_Milten_OCWARN_02_10");	//Все началось с того, что обрушилась Старая шахта...
		AI_Output(hero,self,"Info_Milten_OCWARN_15_11");	//Старая шахта обрушилась?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_12");	//Да. Все произошло очень быстро. Никто не уцелел.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_13");	//Вход в шахту блокировали стражники.
		b_failch4quests();
	};
};


instance INFO_MILTEN_OCMINE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocmine_condition;
	information = info_milten_ocmine_info;
	important = 0;
	permanent = 0;
	description = "Как же она могла обрушиться?";
};


func int info_milten_ocmine_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_milten_ocmine_info()
{
	AI_Output(hero,self,"Info_Milten_OCMINE_15_01");	//Как же она могла обрушиться?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_02");	//Понятия не имею. Те из рудокопов, кто был в тот момент у входа, потом говорили, что началось что-то вроде землетрясения, а потом из туннеля вырвалось огромное облако пыли.
	AI_Output(hero,self,"Info_Milten_OCMINE_15_03");	//Ты был там?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_04");	//Да. Там я и узнал, что шахта обрушилась.
};


instance INFO_MILTEN_OCKDW(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ockdw_condition;
	information = info_milten_ockdw_info;
	important = 0;
	permanent = 0;
	description = "Ты говорил что-то о магах Огня.";
};


func int info_milten_ockdw_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_milten_ockdw_info()
{
	AI_Output(hero,self,"Info_Milten_OCKDW_15_01");	//Ты говорил что-то о магах Огня.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_02");	//Я знаю только то, что вскоре после того, как шахта обрушилась, их всех убили Бароны.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_03");	//Когда я вернулся от гробницы, стражники у ворот внезапно напали на меня.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_04");	//Они называли меня предателем. Мне едва удалось уйти.
};


instance INFO_MILTEN_OCWHY(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocwhy_condition;
	information = info_milten_ocwhy_info;
	important = 0;
	permanent = 0;
	description = "Зачем Баронам нужно было убить магов? Это же глупо...";
};


func int info_milten_ocwhy_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ockdw))
	{
		return TRUE;
	};
};

func void info_milten_ocwhy_info()
{
	AI_Output(hero,self,"Info_Milten_OCWHY_15_01");	//Зачем Баронам нужно было убивать магов? Это же глупо!
	AI_Output(self,hero,"Info_Milten_OCWHY_02_02");	//Ты прав. Но у меня не было шанса спросить об этом у стражников. Они сразу же взялись за мечи.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_03");	//Возможно, Диего что-то знает. Как раз в то время он был в лагере.
};


instance INFO_MILTEN_OCYOU(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocyou_condition;
	information = info_milten_ocyou_info;
	important = 0;
	permanent = 0;
	description = "Ты должен спрятаться там, где они не смогут тебя найти.";
};


func int info_milten_ocyou_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ockdw))
	{
		return TRUE;
	};
};

func void info_milten_ocyou_info()
{
	AI_Output(hero,self,"Info_Milten_OCYOU_15_01");	//Ты должен спрятаться там, где они не смогут тебя найти.
	AI_Output(self,hero,"Info_Milten_OCYOU_02_02");	//Нет. Мы с Диего договорились приглядывать за воротами и предупреждать наших друзей из других лагерей. Они ведь ничего не подозревают!
	if(!Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		AI_Output(self,hero,"Info_Milten_OCYOU_02_03");	//Пожалуйста, поговори с ним!
	}
	else
	{
		b_logentry(CH4_FIREMAGES,"После того, как Диего рассказал мне о событиях в Старом лагере, я встретил Мильтена. Надеюсь, люди Гомеза не смогут их найти.");
	};
};


instance INFO_MILTEN_OCDIEGO(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocdiego_condition;
	information = info_milten_ocdiego_info;
	important = 0;
	permanent = 0;
	description = "Где я могу найти Диего?";
};


func int info_milten_ocdiego_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwhy) && Npc_KnowsInfo(hero,info_milten_ocyou) && !Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_milten_ocdiego_info()
{
	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01");	//Где я могу найти Диего?
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02");	//Он скрывается у вторых ворот, на другом конце лагеря.
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03");	//Пожалуйста, поговори с ним!
	b_logentry(CH4_FIREMAGES,"Недалеко от Старого лагеря меня встретил Мильтен. Он рассказал об обвале на Старой шахте и убийстве магов Огня.");
	b_logentry(CH4_FIREMAGES,"Диего прячется на другой стороне лагеря, недалеко от ворот. Мне срочно нужно с ним поговорить. Он знает о случившемся намного лучше.");
};


instance INFO_MILTEN_LOADSWORD(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword_condition;
	information = info_milten_loadsword_info;
	important = 1;
	permanent = 0;
};


func int info_milten_loadsword_condition()
{
	if(LOADSWORD)
	{
		return TRUE;
	};
};

func void info_milten_loadsword_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01");	//Приветствую тебя, мой друг. Много воды утекло с тех пор, как мы виделись последний раз.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02");	//Привет, Мильтен. С тех пор очень многое изменилось.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03");	//Я бы с удовольствием рассказал бы тебе обо всем, но сейчас на это нет времени. Я очень спешу.
};


instance INFO_MILTEN_LOADSWORD1(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword1_condition;
	information = info_milten_loadsword1_info;
	important = 0;
	permanent = 0;
	description = "Мильтен, мне нужна твоя помощь!";
};


func int info_milten_loadsword1_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword))
	{
		return 1;
	};
};

func void info_milten_loadsword1_info()
{
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01");	//Мильтен, мне нужна твоя помощь!
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02");	//Что случилось? Чем я могу тебе помочь?
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03");	//Я расскажу тебе об этом там, где нас никто не услышит.
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04");	//Хорошо. Иди за мной.
	Npc_ExchangeRoutine(self,"LSAway");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_LSAWAY(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsaway_condition;
	information = info_milten_lsaway_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsaway_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword1) && (Npc_GetDistToWP(hero,"NC_KDW04_IN") < 500))
	{
		return TRUE;
	};
};

func void info_milten_lsaway_info()
{
	if((hero.attribute[ATR_STRENGTH] < 30) || (Npc_HasItems(hero,ITMW_2H_SWORD_HEAVY_03) || Npc_HasItems(hero,INNOS_ZORN) || Npc_HasItems(hero,GORNS_RACHE) || Npc_HasItems(hero,ROTER_WIND) || Npc_HasItems(hero,LEES_AXT) || Npc_HasItems(hero,THORUS_SCHWERT) || Npc_HasItems(hero,ITMW_2H_SWORD_HEAVY_04) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_01) || Npc_HasItems(hero,ORIKS_AXT) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_02) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_04) || Npc_HasItems(hero,TORLOFS_AXT) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_03)))
	{
		CreateInvItem(hero,demourizel);
	};
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01");	//Теперь рассказывай, что стряслось?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02");	//Мне нужна энергия рудной горы, и я думаю, что маги Воды не согласятся помочь мне получить ее.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03");	//Ты шутишь?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04");	//Сейчас не время шутить. Я серьезен, как никогда.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05");	//Я видел Ксардаса, некроманта.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06");	//Он сказал мне, что нужно делать.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07");	//Ксардас? Ты меня пугаешь!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08");	//Никто не разговаривал с ним с тех самых пор, как он покинул Старый лагерь.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09");	//Я говорил с ним.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10");	//Зачем тебе понадобилась сила железной горы?
	if(Npc_HasItems(hero,mythrilklinge01))
	{
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_11");	//Я хочу передать ее этому мечу.
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_Output(self,hero,"Info_Milten_LSAWAY_02_12");	//Ух, ты! Вот это клинок!
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_13");	//Его имя УРИЗЕЛЬ!
		AI_RemoveWeapon(hero);
	};
};


instance INFO_MILTEN_LOADSWORD4(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword4_condition;
	information = info_milten_loadsword4_info;
	important = 0;
	permanent = 0;
	description = "Ксардас дал мне заклинание, которое передаст мечу силу руды.";
};


func int info_milten_loadsword4_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsaway))
	{
		return 1;
	};
};

func void info_milten_loadsword4_info()
{
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
		AI_EquipBestMeleeWeapon(hero);
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01");	//Ксардас дал мне заклинание, которое передаст мечу силу руды.
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_printtrademsg1("Отдано заклинание переноса энергии.");
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02");	//Тебе нужно будет прочитать его, когда я поднесу меч к горе.
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03");	//Ну, хм, если мне нужно только прочесть заклинание...
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_usefakescroll();
	};
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04");	//Но у нас возникнут проблемы с Сатурасом и другими магами!
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_printtrademsg2("Получено заклинание переноса энергии.");
	};
};

instance INFO_MILTEN_LSRISK(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsrisk_condition;
	information = info_milten_lsrisk_info;
	important = 0;
	permanent = 0;
	description = "Мы должны рискнуть!";
};


func int info_milten_lsrisk_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword4))
	{
		return TRUE;
	};
};

func void info_milten_lsrisk_info()
{
	AI_Output(hero,self,"Info_Milten_LSRISK_15_01");	//Мы должны рискнуть!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_02");	//Это очень важно!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_03");	//Важно для всех жителей колонии!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_04");	//Я не понимаю...
	AI_Output(hero,self,"Info_Milten_LSRISK_15_05");	//Это поможет нам выбраться отсюда. Поверь мне!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_06");	//Ну, хорошо. После всего того, что ты для нас сделал, я не могу относиться к тебе иначе как с полным доверием.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_07");	//Помимо этого, похоже, и Ксардас тебе доверяет.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_08");	//Встретимся возле железной горы, и... Никому не говори об этом!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_09");	//Хорошо. Встретимся у рудной горы.
	b_logentry(CH5_URIZIEL,"Я смог убедить моего друга Мильтена помочь мне перенести энергию магической руды в меч. Мы договорились встретиться у подножия рудной горы.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LSOreHeap");
};


instance INFO_MILTEN_OREGUARD(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_oreguard_condition;
	information = info_milten_oreguard_info;
	important = 1;
	permanent = 0;
};


func int info_milten_oreguard_condition()
{
	if(Npc_KnowsInfo(hero,info_oreguard))
	{
		return TRUE;
	};
};

func void info_milten_oreguard_info()
{
	AI_Output(hero,self,"DIA_Huno_YouKnowYourJob_15_00");	//А у тебя неплохо получается, как я вижу.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//Иди за мной.
	Npc_ExchangeRoutine(self,"LSOreHeap2");
	AI_StopProcessInfos(self);
};

instance INFO_MILTEN_LSOREHEAP(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsoreheap_condition;
	information = info_milten_lsoreheap_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsoreheap_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsrisk) && (Npc_GetDistToWP(hero,"NC_PATH41") < 500))
	{
		return TRUE;
	};
};

func void info_milten_lsoreheap_info()
{
	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01");	//Ты принес меч и заклинание?
};


instance INFO_MILTEN_LSNOW(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsnow_condition;
	information = info_milten_lsnow_info;
	important = 0;
	permanent = 0;
	description = "Вот заклинание!";
};


func int info_milten_lsnow_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsoreheap) && Npc_HasItems(hero,mythrilklinge01) && Npc_HasItems(hero,scroll4milten) && (Npc_GetDistToWP(hero,"NC_PATH41") < 1000))
	{
		return TRUE;
	};
};

func void info_milten_lsnow_info()
{
	AI_Output(hero,self,"Info_Milten_LSNOW_15_01");	//Вот заклинание!
	b_printtrademsg1("Отдано заклинание переноса энергии.");
	AI_Output(hero,self,"Info_Milten_LSNOW_15_02");	//Ты готов?
	AI_Output(self,hero,"Info_Milten_LSNOW_02_03");	//Если только кто-нибудь может быть готов к этому...
	AI_Output(hero,self,"Info_Milten_LSNOW_15_04");	//Тогда давай начнем!
	b_giveinvitems(hero,self,scroll4milten,1);
	STARTCHAPTERSSIX = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_CHAPTERSIX(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_chaptersix_condition;
	information = info_milten_chaptersix_info;
	important = 1;
	permanent = 0;
};


func int info_milten_chaptersix_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsnow) && STARTCHAPTERSSIX)
	{
		return TRUE;
	};
};

func void info_milten_chaptersix_info()
{
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NC_PIT_CENTER");
	b_kapitelwechsel(6);
};


instance INFO_MILTEN_LSDONE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsdone_condition;
	information = info_milten_lsdone_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsdone_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void info_milten_lsdone_info()
{
	AI_Output(self,hero,"Info_Milten_LSDONE_02_01");	//Готово!
	if(hero.attribute[ATR_STRENGTH] >= 30)
	{
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero,"T_URISELINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output(hero,self,"Info_Milten_LSDONE_15_02");	//Невероятно! Этот камень был серым, а теперь он излучает синий свет!
	};
	AI_Output(self,hero,"Info_Milten_LSDONE_02_03");	//Похоже, у нас получилось! Магическая сила всей этой руды теперь заключена в одном старом мече.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_04");	//Но, кажется, мы привлекли к себе слишком много внимания.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_05");	//Тебе придется воспользоваться заклинанием Портал, для того чтобы выбраться отсюда!
	if(!Npc_HasItems(hero,itarrune_1_6_teleport3) && !Npc_HasItems(hero,itarrune_1_5_teleport5))
	{
		b_printtrademsg1("Получен свиток телепортации.");
		CreateInvItem(hero,itarscrollteleport5);
	};
	AI_Output(hero,self,"Info_Milten_LSDONE_15_06");	//А что будет с тобой?
	AI_Output(self,hero,"Info_Milten_LSDONE_02_07");	//Обо мне не волнуйся, я что-нибудь придумаю. Уходи!
	if(hero.attribute[ATR_MANA] < 5 && !Npc_HasItems(hero,itfo_potion_mana_01) && !Npc_HasItems(hero,itfo_potion_mana_02) && !Npc_HasItems(hero,itfo_potion_mana_03))
	{
		b_printtrademsg2("Получена эссенция магической энергии.");
		CreateInvItem(hero,itfo_potion_mana_01);
	};
	b_story_urizielloaded();
	AI_StopProcessInfos(self);
	b_exchangeroutine(pc_thief,"Reunion");
	if(Npc_KnowsInfo(hero,info_gorn_diegomilten))
	{
		b_exchangeroutine(pc_fighter,"Reunion");
	};
	if(Npc_KnowsInfo(hero,info_lester_diegomilten))
	{
		b_exchangeroutine(pc_psionic,"Reunion");
	};
	AI_StartState(self,zs_miltensescape,1,"");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

