
instance KDF_402_CORRISTO_EXIT(C_INFO)
{
	npc = kdf_402_corristo;
	nr = 999;
	condition = kdf_402_corristo_exit_condition;
	information = kdf_402_corristo_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_402_corristo_exit_condition()
{
	return TRUE;
};

func void kdf_402_corristo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_CORRISTO_INTRUDER(C_INFO)
{
	npc = kdf_402_corristo;
	nr = 1;
	condition = info_corristo_intruder_condition;
	information = info_corristo_intruder_info;
	permanent = 1;
	important = 1;
};


func int info_corristo_intruder_condition()
{
	if(Npc_IsInState(self,zs_talk) && (!Npc_KnowsInfo(hero,grd_200_thorus_wannabemage) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS)))
	{
		return 1;
	};
};

func void info_corristo_intruder_info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Что ты здесь делаешь? Тебе сюда нельзя! Уходи!
	AI_StopProcessInfos(self);
};


instance KDF_402_CORRISTO_EXPLAINMAGE(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_explainmage_condition;
	information = kdf_402_corristo_explainmage_info;
	important = 0;
	permanent = 0;
	description = "Расскажи мне, что значит быть магом.";
};


func int kdf_402_corristo_explainmage_condition()
{
	if(!Npc_KnowsInfo(hero,kdf_402_corristo_wannbekdf) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_explainmage_info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01");	//Расскажи мне, что значит быть магом.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02");	//Мы, маги Огня, служим Инносу, верховному богу.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03");	//Мы избраны быть его жрецами, учителями и судьями. Наша способность колдовать - его бесценный дар.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04");	//Дар, который определяет цель нашей жизни и налагает на нас большую ответственность.
};


instance KDF_402_CORRISTO_WANNBEKDF(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_wannbekdf_condition;
	information = kdf_402_corristo_wannbekdf_info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать магом, одним из вас.";
};


func int kdf_402_corristo_wannbekdf_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_200_thorus_wannabemage)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_wannbekdf_info()
{
	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01");	//Я хочу стать магом, одним из вас.
	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02");	//Ты хочешь стать магом Круга Огня? Хм...
	if(hero.level < 10)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ты знаешь еще слишком мало. Приходи ко мне, когда будешь знать больше.
		AI_StopProcessInfos(self);
		b_printguildcondition(10);
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03");	//Многие приходили ко мне, чтобы стать магами, но только один из них стал моим учеником. Все остальные ушли ни с чем.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05");	//Твой дух уже может принять наше учение. Если хочешь стать магом, ты должен пройти испытание. Скажи мне, когда будешь готов.
		CORRISTO_KDFAUFNAHME = 1;
		kdf_402_corristo_wannbekdf.permanent = 0;
		Info_ClearChoices(kdf_402_corristo_wannbekdf);
		Log_CreateTopic(GE_BECOMEFIREMAGE,LOG_NOTE);
		b_logentry(GE_BECOMEFIREMAGE,"Корристо сказал мне, что я могу быть принят в Круг магов Огня. Но для этого я должен пройти испытание.");
	};
};


instance KDF_402_CORRISTO_KDFTEST(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kdftest_condition;
	information = kdf_402_corristo_kdftest_info;
	important = 0;
	permanent = 0;
	description = "Я готов к испытанию.";
};


func int kdf_402_corristo_kdftest_condition()
{
	if(CORRISTO_KDFAUFNAHME == 1)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kdftest_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01");	//Я готов к испытанию.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02");	//Хорошо. Ты помогал братьям из Болотного лагеря, да?
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"Да, это так.",kdf_402_corristo_kdftest_ja);
	Info_AddChoice(kdf_402_corristo_kdftest,"Нет.",kdf_402_corristo_kdftest_no);
};

func void kdf_402_corristo_kdftest_ja()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01");	//Да, это так.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03");	//Назови мне имя верховного бога.
	CORRISTO_KDFAUFNAHME = 2;
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"Аданос.",kdf_402_corristo_kdftest_adanos);
	Info_AddChoice(kdf_402_corristo_kdftest,"Спящий.",kdf_402_corristo_kdftest_sleeper);
	Info_AddChoice(kdf_402_corristo_kdftest,"Иннос.",kdf_402_corristo_kdftest_innos);
	Info_AddChoice(kdf_402_corristo_kdftest,"Гомез.",kdf_402_corristo_kdftest_gomez);
};

func void kdf_402_corristo_kdftest_no()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01");	//Нет.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03");	//Мы не можем принять в свой круг человека, который отрекается от своих поступков.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04");	//Путь мага для тебя закрыт. Ты можешь пойти к стражникам или рудокопам.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_adanos()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01");	//Аданос.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03");	//Это неверный ответ. Быть может, твои таланты больше пригодятся стражникам.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_sleeper()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01");	//Спящий.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03");	//Ты слишком много времени провел в лагере на болотах. Может быть, тебе стоит вернуться к ним.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_innos()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01");	//Иннос.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03");	//Назови мне высшую добродетель.
	CORRISTO_KDFAUFNAHME = 3;
	Info_ClearChoices(kdf_402_corristo_kdftest);
	Info_AddChoice(kdf_402_corristo_kdftest,"Честь воина.",kdf_402_corristo_kdftest_fight);
	Info_AddChoice(kdf_402_corristo_kdftest,"Смирение перед силой магии.",kdf_402_corristo_kdftest_demut);
	Info_AddChoice(kdf_402_corristo_kdftest,"Контроль над телом и духом.",kdf_402_corristo_kdftest_disziplin);
	Info_AddChoice(kdf_402_corristo_kdftest,"Благоговение перед богами.",kdf_402_corristo_kdftest_ehrfurcht);
};

func void kdf_402_corristo_kdftest_gomez()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01");	//Гомез.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02");	//Хмм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03");	//Я думаю, тебе стоит обратиться к Торусу. Твоя судьба - стать воином.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void kdf_402_corristo_kdftest_fight()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01");	//Честь воина.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03");	//Я думаю, тебе стоит обратиться к Торусу. Твоя судьба - стать воином.
	AI_StopProcessInfos(self);
};

func void kdf_402_corristo_kdftest_demut()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01");	//Смирение перед силой магии.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	AI_StopProcessInfos(self);
	CORRISTO_KDFAUFNAHME = 4;
	b_story_feueraufnahme();
};

func void kdf_402_corristo_kdftest_disziplin()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01");	//Контроль над телом и духом.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	CORRISTO_KDFAUFNAHME = 4;
	AI_StopProcessInfos(self);
	b_story_feueraufnahme();
};

func void kdf_402_corristo_kdftest_ehrfurcht()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01");	//Благоговение перед богами.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	CORRISTO_KDFAUFNAHME = 4;
	AI_StopProcessInfos(self);
	b_story_feueraufnahme();
};


instance KDF_402_CORRISTO_AUFNAHME(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_aufnahme_condition;
	information = kdf_402_corristo_aufnahme_info;
	important = 1;
	permanent = 0;
};


func int kdf_402_corristo_aufnahme_condition()
{
	if((Npc_GetDistToWP(hero,"OCC_CHAPEL_UPSTAIRS") < 500) && (CORRISTO_KDFAUFNAHME == 4))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_aufnahme_info()
{
	CORRISTO_KDFAUFNAHME = 5;
	b_story_feueraufnahme();
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01");	//Мы собрались здесь, чтобы принять клятву нового служителя Огня.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02");	//Принеси же клятву Огня.
	Snd_Play("howling_01");
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03");	//Я клянусь божественной властью...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04");	//Я клянусь божественной властью...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05");	//...и силой священного неугасимого Огня...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06");	//...и силой священного неугасимого Огня...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07");	//... что с этого дня мои знания и дела будут навеки едины с пламенем...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08");	//... что с этого дня мои знания и дела будут навеки едины с пламенем...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09");	//...пока мое тело не вернется в царство Белиара и не угаснет огонь моей жизни.
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10");	//...пока мое тело не вернется в царство Белиара и не угаснет огонь моей жизни.
	AI_StopProcessInfos(self);
};


instance KDF_402_CORRISTO_ROBE(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_robe_condition;
	information = kdf_402_corristo_robe_info;
	important = 1;
	permanent = 0;
};


func int kdf_402_corristo_robe_condition()
{
	if(Npc_KnowsInfo(hero,kdf_402_corristo_aufnahme))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_robe_info()
{
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,kdf_armor_l);
	CreateInvItem(self,itamarrow);
	b_giveinvitems(self,hero,itamarrow,1);
	Npc_RemoveInvItem(hero,itamarrow);
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01");	//Этой клятвой ты связал свою жизнь с неугасимым Огнем.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02");	//Возьми это одеяние и носи его в знак вечного союза.
	AI_StopProcessInfos(self);
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Npc_SetTrueGuild(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_logentry(GE_BECOMEFIREMAGE,"Я прошел испытание и принес клятву Огня. Теперь я могу носить одеяние магов Огня!");
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"Корристо может посвятить меня в тайны Кругов магии и помочь мне повысить мою магическую силу. Я смогу найти его в доме магов Огня.");
};


instance KDF_402_CORRISTO_MANA(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_mana_condition;
	information = kdf_402_corristo_mana_info;
	important = 0;
	permanent = 1;
	description = "Я хочу увеличить свою магическую силу.";
};


func int kdf_402_corristo_mana_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_mana_info()
{
	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01");	//Я хочу увеличить свою магическую силу.
	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02");	//Я могу помочь тебе в этом. Как ты будешь использовать ее, зависит только от тебя.
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};

func void kdf_402_corristo_mana_back()
{
	Info_ClearChoices(kdf_402_corristo_mana);
};

func void kdf_402_corristo_mana_man_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};

func void kdf_402_corristo_mana_man_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(kdf_402_corristo_mana);
	Info_AddChoice(kdf_402_corristo_mana,DIALOG_BACK,kdf_402_corristo_mana_back);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_5);
	Info_AddChoice(kdf_402_corristo_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdf_402_corristo_mana_man_1);
};


instance KDF_402_CORRISTO_EXPLAINCIRCLES(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_explaincircles_condition;
	information = kdf_402_corristo_explaincircles_info;
	important = 0;
	permanent = 0;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int kdf_402_corristo_explaincircles_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_explaincircles_info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02");	//Как пожелаешь. Круги символизируют глубину твоих магических знаний.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03");	//Они влияют на твою способность изучать и использовать новые заклинания.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04");	//Прежде чем изучать следующий Круг, ты должен полностью освоить знания предыдущего.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05");	//Чтобы изучить высшие Круги, тебе потребуется много времени и опыта.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06");	//Но твое усердие в их изучении будет вознаграждено новыми, все более могущественными заклинаниями. Но суть Кругов магии не только в этом.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07");	//Они являются частью жизни любого мага. Они навсегда останутся с тобой. Прими их словно часть самого себя.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08");	//Если ты поймешь, в чем заключается их сила, ты поймешь, какая сила скрывается в тебе самом.
};


instance KDF_402_CORRISTO_KREIS1(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis1_condition;
	information = kdf_402_corristo_kreis1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_1,LPCOST_TALENT_MAGE_1,0);
};


func int kdf_402_corristo_kreis1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,kdf_402_corristo_explaincircles) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis1_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01");	//Я готов приобщиться к Первому Кругу магии.
	if(b_giveskill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02");	//Вступление в Первый Круг магии даст тебе умение использовать магические руны.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03");	//Каждая руна содержит в себе одно магическое заклинание.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04");	//Используя свою магическую силу, ты сможешь прочитать это заклинание.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05");	//Но в отличие от магических свитков, которые теряют свою силу после первого прочтения, заклинание руны можно читать снова и снова, и оно не иссякнет. 
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06");	//Каждая руна является источником магической силы, которая может быть задействована в любое время.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07");	//Как я уже сказал, при прочтении заклинания руны или свитка будет расходоваться твоя магическая сила.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08");	//Каждый новый Круг, который ты изучишь, будет давать тебе возможность читать заклинания более сложных рун.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09");	//Используй силу рун, чтобы познать самого себя.
		kdf_402_corristo_kreis1.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS2(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis2_condition;
	information = kdf_402_corristo_kreis2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_2,LPCOST_TALENT_MAGE_2,0);
};


func int kdf_402_corristo_kreis2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis2_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01");	//Я готов обрести знания Второго Круга.
	if(b_giveskill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02");	//Ты уже научился читать заклинания рун. Пришло время углубить твои знания.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03");	//Второй Круг магии даст тебе возможность читать сильные боевые заклинания, но самое главное, ты сможешь исцелять болезни.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04");	//Но тебе предстоит еще многому научиться, чтобы познать истинные тайны магии.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05");	//Ты уже знаешь, что можешь использовать любую руну, пока на это хватит твоей личной силы.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06");	//Но это крайний случай, и он не всегда оправдан. Тебе дана сила, которая может приносить смерть и разрушение.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07");	//Истинный маг использует ее лишь тогда, когда это действительно необходимо.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08");	//Внимательно следи за тем, что происходит вокруг, и ты сможешь познать силу рун.
		kdf_402_corristo_kreis2.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS3(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis3_condition;
	information = kdf_402_corristo_kreis3_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_3,LPCOST_TALENT_MAGE_3,0);
};


func int kdf_402_corristo_kreis3_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis3_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01");	//Ты можешь передать мне знания Третьего Круга магии?
	if(b_giveskill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02");	//Третий Круг - очень важная часть пути, который проходит каждый маг. Его постижением завершается твой поиск.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03");	//Ты уже на середине пути познания магии. Ты уже умеешь читать заклинания рун.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04");	//Это знание станет основой для дальнейшего совершенствования. Подумай, прежде чем использовать ту или иную руну.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05");	//Ты можешь читать ее или не читать, но твой выбор должен быть осознан.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06");	//Если ты сделал выбор, ты должен следовать ему не раздумывая.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07");	//Познай свой путь, и ты познаешь силу своих решений.
		kdf_402_corristo_kreis3.permanent = 0;
	};
};


instance KDF_402_CORRISTO_KREIS4(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_kreis4_condition;
	information = kdf_402_corristo_kreis4_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_4,LPCOST_TALENT_MAGE_4,0);
};


func int kdf_402_corristo_kreis4_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_402_corristo_kreis4_info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01");	//Я готов вступить в Четвертый Круг.
	if(b_giveskill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02");	//Тебе уже открыты знания трех Кругов магии. Пришло время познать ее тайны.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03");	//Магия руны сокрыта в камне. Камень этот получают при шлифовке магической руды.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04");	//Такой руды, которую добывают в здешних шахтах. Камень наделяется магической энергией в особых храмах. Так он становится орудием нашей силы.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05");	//Все руны, которые ты можешь использовать, открывают тебе доступ к знаниям и могуществу наших храмов.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06");	//Теперь ты выучил все, что знаю я сам.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07");	//Познай магию, и ты познаешь тайну своей силы.
		kdf_402_corristo_kreis4.permanent = 0;
	};
};


instance KDF_402_CORRISTO_HEAVYARMOR(C_INFO)
{
	npc = kdf_402_corristo;
	condition = kdf_402_corristo_heavyarmor_condition;
	information = kdf_402_corristo_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("Учитель, я хочу носить одеяние верховных магов Круга Огня.",VALUE_KDF_ARMOR_H);
};


func int kdf_402_corristo_heavyarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_402_corristo_heavyarmor_info()
{
	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01");	//Учитель, я хочу носить одеяние верховных магов Круга Огня.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ты знаешь еще слишком мало. Приходи ко мне, когда будешь знать больше.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_KDF_ARMOR_H)
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Тебе не хватает руды.
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04");	//Я вижу, что ты уже достоин носить облачение верховного мага Круга Огня.
		CreateInvItem(hero,kdf_armor_h);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
		b_giveinvitems(hero,self,itminugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor(hero);
		kdf_402_corristo_heavyarmor.permanent = 0;
	};
};

