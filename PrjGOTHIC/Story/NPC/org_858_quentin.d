
instance ORG_858_QUENTIN(NPC_DEFAULT)
{
	name[0] = "Квентин";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 20;
	voice = 0;
	id = 858;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,4,"Hum_Head_Pony",11,1,org2m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,50);
	CreateInvItem(self,itke_quentin);
	CreateInvItems(self,itfo_potion_health_01,2);
	EquipItem(self,itmw_1h_mace_war_04);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_858;
};


func void rtn_start_858()
{
	ta_boss(13,0,14,0,"LOCATION_11_09");
	ta_boss(14,0,13,0,"LOCATION_11_09");
};

instance INFO_QUENTIN_EXIT(C_INFO)
{
	npc = org_858_quentin;
	nr = 999;
	condition = info_quentin_exit_condition;
	information = info_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int info_quentin_exit_condition()
{
	return 1;
};

func void info_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA1(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia1_condition;
	information = quentin_dia1_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia1_condition()
{
	if(Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void quentin_dia1_info()
{
	AI_Output(self,hero,"Quentin_DIA1_01");	//Что ты здесь делаешь, парень?
	if(OC_BANNED == TRUE)
	{
		AI_Output(hero,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//Меня прогнали из Старого лагеря. Я могу присоединиться к вам?
		AI_Output(self,hero,"Quentin_DIA1_02");	//А вот это интересно. Что же такого ты им сделал? Украл что-то? Убил рудокопа?
		AI_Output(self,hero,"Quentin_DIA1_03");	//Впрочем, неважно... Враг Гомеза - наш друг. Но как мне узнать, что ты не его шпион?
		AI_Output(hero,self,"Info_Thorus_MordragKo_Offer_15_00");	//Я выполню твое задание.
	}
	else
	{
		AI_Output(hero,self,"DIA_Roscoe_WannaJoin_15_00");	//Я хочу присоединиться к вам.
		AI_Output(self,hero,"Quentin_DIA1_04");	//Серьезно? Вот так просто? И зачем ты нам нужен?
		AI_Output(hero,self,"DIA_Gomez_Fault_15_00");	//Я пришел предложить свою помощь.
	};	
	AI_Output(self,hero,"Quentin_DIA1_05");	//Хмм... Ладно, ты не похож на полного придурка. Я дам тебе шанс.
	AI_Output(self,hero,"Quentin_DIA1_06");	//Сбегай в лагерь рудокопов Свободной шахты и найди там вора по имени Калеш. Он работает на меня.
	b_usefakescroll();
	AI_Output(self,hero,"Quentin_DIA1_07");	//Передай ему это письмо - и не смей читать, понял?
	b_printtrademsg1("Получено письмо.");
	AI_Output(hero,self,"DIA_Fletcher_Hello_ISee_15_00");	//Все понятно.
	CreateInvItem(hero,calashnote);
	b_logentry(QUENTIN_GANG,"Квентин отправил меня в лагерь рудокопов Свободной шахты, где я должен буду передать письмо вору по имени Калеш.");
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA2(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia2_condition;
	information = quentin_dia2_info;
	permanent = 0;
	description = "Эй, что за...";
};

func int quentin_dia2_condition()
{
	if(Npc_KnowsInfo(hero,info_calash_dia1) || Npc_HasItems(hero,calashnote2))
	{
		return 1;
	};
};

func void quentin_dia2_info()
{
	AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Эй, что за...
	AI_Output(self,hero,"Quentin_DIA2_01");	//Ха! А ты как хотел? Думал, что сразу получишь от меня какое-нибудь "секретное задание высочайшей важности"?
	AI_Output(self,hero,"Quentin_DIA2_02");	//Убить дракона, там, не знаю, разрушить Барьер...
	AI_Output(self,hero,"Quentin_DIA2_03");	//Ладно, шутки в сторону. Вижу, раз ты вернулся, то настроен серьезно. Готов выслушать мое предложение?
	Info_ClearChoices(quentin_dia2);
	Info_AddChoice(quentin_dia2,"Да.",quentin_dia2_yes);
	Info_AddChoice(quentin_dia2,"А не пошел бы ты...",quentin_dia2_fuckoff);
};

func void quentin_dia2_yes()
{
	AI_Output(hero,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Да.
	AI_Output(self,hero,"Quentin_DIA2_05");	//Вот это мне нравится! А теперь слушай.
	AI_Output(self,hero,"Quentin_DIA2_06");	//Уже несколько месяцев мы пытаемся выкрасть амулет Братства из лагеря сектантов, но безуспешно.
	AI_Output(self,hero,"Quentin_DIA2_07");	//За Барьером есть влиятельные люди, готовые хорошо заплатить за него. У сектантов этот амулет считается какой-то наградой за заслуги.
	AI_Output(self,hero,"Quentin_DIA2_08");	//Проблема в том, что амулет носят только некоторые Гуру, а все они - сильные маги. Нам пока не удалось подобраться к ним.
	if(Npc_GetTrueGuild(hero) == GIL_NOV || Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,hero,"Quentin_DIA2_09");	//Очень хорошо, что ты уже принадлежишь к сектантам, ты будешь нам очень полезен.
	};
	AI_Output(self,hero,"Quentin_DIA2_10");	//Отправляйся в Болотный лагерь, осмотрись. Но не советую сразу лазить у всех по карманам. Приходи ко мне, если найдешь амулет.
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Я постараюсь найти его тебе!
	AI_Output(self,hero,"Quentin_DIA2_11");	// И никому ни слова о нашем плане - мы будем приглядывать за тобой!
	Info_ClearChoices(quentin_dia2);
	b_logentry(QUENTIN_GANG,"Новое задание от Квентина, на этот раз нормальное - найти амулет Братства. Говорит, что его носят только самые уважаемые сектанты из Болотного лагеря. Где же мне найти такого?");
	AI_StopProcessInfos(self);
};

func void quentin_dia2_fuckoff()
{
	AI_Output(hero,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//А не пошел бы ты...
	AI_Output(self,hero,"Quentin_DIA2_04");	//Ну, как знаешь. Эй, парни, взять его!
	b_setorg2hostile();
	Info_ClearChoices(quentin_dia2);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"Я послал куда подальше Квентина вместе с его сбродом. Обойдусь без них!");
	};
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA3(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia3_condition;
	information = quentin_dia3_info;
	permanent = 0;
	description = "Вот, возьми его. Как ты и просил.";
};

func int quentin_dia3_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia2) && Npc_HasItems(hero,itmi_amulet_psi_01))
	{
		return 1;
	};
};

func void quentin_dia3_info()
{
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//Вот, возьми его. Как ты и просил.
	b_printtrademsg1("Отдан амулет.");
	b_giveinvitems(hero,self,itmi_amulet_psi_01,1);
	b_givexp(300);
	AI_Output(self,hero,"Quentin_DIA3_01");	//Не может быть! Ты сделал то, что не удавалось моим парням несколько месяцев! Кажется, я недооценивал тебя...
	AI_TurnToNPC(self,org_869_raeuber);
	AI_Output(self,hero,"Quentin_DIA3_02");	//Эй, придурки! Посмотрите, кто принес мне амулет!
	AI_TurnToNPC(self,hero);
	AI_Output(self,hero,"Quentin_DIA3_03");	//Конечно, я мог бы убить тебя, забрать амулет и выбросить твой труп на съедение глорхам, но похоже что ты и правда достоин уважения.
	AI_Output(self,hero,"Quentin_DIA3_04");	//Пожалуй, я дам тебе руды и предложу выполнить еще одно задание для меня. Что скажешь?
	b_logentry(QUENTIN_GANG,"Я достал амулет, Квентин был в полном восторге.");
};

instance QUENTIN_DIA33(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia33_condition;
	information = quentin_dia33_info;
	permanent = 0;
	description = "Слушаю тебя!";
};

func int quentin_dia33_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia3))
	{
		return 1;
	};
};

func void quentin_dia33_info()
{
	AI_Output(hero,self,"DIA_Horatio_HelpSTR_15_02");	//Слушаю тебя!
	AI_Output(self,hero,"Quentin_DIA3_05");	//Недавно мы подкупили одного работника из замка Баронов по имени Гилберт.
	AI_Output(self,hero,"Quentin_DIA3_06");	//Он должен был сделать нам дубликат одного важного ключа, но бесследно исчез.
	AI_Output(self,hero,"Quentin_DIA3_07");	//Ни руды, ни ключа! Обманул нас! Мы точно знаем, что он жив и прячется где-то в районе Старого лагеря. Да и дубликат он успел сделать.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//Почему он ушел из Старого лагеря?
	AI_Output(self,hero,"Quentin_DIA3_08");	//Испугался, наверное.
	AI_Output(self,hero,"Quentin_DIA3_09");	//Найди его и принеси мне то, что принадлежит нам! А судьба этого бедолаги меня не волнует, если понадобится - убей.
	AI_Output(hero,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//Я займусь им.
	AI_Output(self,hero,"Quentin_DIA3_10");	//Еще раз спасибо за амулет. Возьми руду и наш доспех, ты заслужил это. Добро пожаловать в шайку!
	b_printtrademsg1("Получено руды: 400");
	b_printtrademsg2("Получен доспех грабителя.");
	CreateInvItems(self,itminugget,400);
	b_giveinvitems(self,hero,itminugget,400);
	if(KAPITEL == 1)
	{
		CreateInvItems(hero,org2n,1);
		AI_EquipArmor(hero,org2n);
	}
	else
	{
		CreateInvItems(hero,org2l,1);
		AI_EquipArmor(hero,org2l);
	};
	b_logentry(QUENTIN_GANG,"Грабители Квентина упустили человека из Старого лагеря, теперь их план под угрозой. Пока не знаю, что они задумали, но мне нужно найти некого Гилберта, который прячется где-то неподалеку от Старого лагеря.");
};

instance QUENTIN_DIA4(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia4_condition;
	information = quentin_dia4_info;
	permanent = 0;
	description = "Вот твой ключ.";
};

func int quentin_dia4_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia33) && Npc_HasItems(hero,itke_gilbert))
	{
		return 1;
	};
};

func void quentin_dia4_info()
{
	AI_Output(hero,self,"Info_Aaron_SELLNOW_15_01");	//Вот твой ключ.
	AI_Output(self,hero,"Quentin_DIA4_01");	//Наконец! А что с Гилбертом?
	if(Npc_IsDead(non_1500_gilbert))
	{
		AI_Output(hero,self,"DIA_Fletcher_WegenNek_15_04");	//Стал кормом для крыс...
	}
	else
	{
		AI_Output(hero,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//Все совсем не так, как ты думаешь...
	};
	AI_Output(self,hero,"Quentin_DIA4_02");	//Неважно. А теперь слушай меня внимательно, у нас мало времени.
	AI_Output(self,hero,"Quentin_DIA4_03");	//До побега из лагеря Гилберт работал в тюрьме Гомеза, помогал надзирателям и кормил заключенных.
	AI_Output(self,hero,"Quentin_DIA4_04");	//Дубликат ключа, который ты вернул, открывает одну из камер в этой тюрьме. В ней сидит наш человек, Алекс.
	AI_Output(self,hero,"Quentin_DIA4_05");	//Его поймали несколько недель назад и мы намерены освободить его! Мне нужна твоя помощь.
	if(FMTAKEN == TRUE)
	{
		AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//Гомез убил всех магов Круга Огня!
		AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//Они не покорились Гомезу и выступили против нападения на Свободную шахту.
		AI_Output(self,hero,"Quentin_DIA4_12");	//Серьезно? Это все меняет, в Старом лагере теперь слишком опасно... Хорошо, я отправлю с тобой нашего человека.
		AI_Output(self,hero,"Quentin_DIA4_13");	//Он будет ждать тебя у входа на склад Баронов. Поговори с ним как только найдешь способ попасть в замок.
		AI_Output(self,hero,"Quentin_DIA4_14");	//Освободите Алекса и вместе пробивайтесь к выходу из лагеря.
		AI_Output(hero,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//Да, меня ждет очередное кровавое приключение...
		b_logentry(QUENTIN_GANG,"Дубликат Гилберта, который я принес, как оказалось - копия ключа от камеры в тюрьме Баронов, куда бросили одного из грабителей, Алекса.");
		b_logentry(QUENTIN_GANG,"Квентин организовал побег и поручил мне главную роль в своем плане. Мне поможет один из грабителей, я найду его на складе Баронов. Вдвоем мы освободим Алекса и все вместе вернемся в лагерь.");
		Wld_InsertNpc(org_897_mort,"OCC_CELLAR_LAST_ROOM");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//Как я могу ему помочь?
		AI_Output(self,hero,"Quentin_DIA4_06");	//Я не могу отправить с тобой много человек, здесь нужен незаметный и деликатный подход. У нас есть план.
		if(Npc_GetTrueGuild(hero) == GIL_GRD || Npc_GetTrueGuild(hero) == GIL_STT || Npc_GetTrueGuild(hero) == GIL_KDF)
		{
			AI_Output(self,hero,"Quentin_DIA4_07");	//Ты уже принадлежишь к Старому лагерю, у тебя не должно возникнуть проблем.
		};
		AI_Output(self,hero,"Quentin_DIA4_08");	//Возьми эту одежду стражника и меч, передай все это Алексу.
		b_printtrademsg1("Получена маскировка.");
		AI_Output(self,hero,"Quentin_DIA4_09");	//Также ему понадобится карта Старого лагеря, потому что вы не сможете выйти оттуда вдвоем.
		AI_Output(self,hero,"Quentin_DIA4_10");	//Но тебе придется поискать ее самостоятельно, тут я не смогу тебе помочь.
		AI_Output(self,hero,"Quentin_DIA4_11");	//Пробирайся в тюрьму ночью, когда большинство стражников и надзиратель будут спать.
		AI_Output(hero,self,"DIA_Jesse_Mission_YES_15_00");	//Я посмотрю, что тут можно сделать...
		AI_Output(self,hero,"Quentin_DIA4_15");	//Будь осторожен! Мы все рассчитываем на тебя!
		CreateInvItems(self,alexstuff,1);
		b_giveinvitems(self,hero,alexstuff,1);
		b_logentry(QUENTIN_GANG,"Дубликат Гилберта, который я принес, как оказалось - копия ключа от камеры в тюрьме Баронов, куда бросили одного из грабителей, Алекса.");
		b_logentry(QUENTIN_GANG,"Квентин организовал его побег и дал мне одежду стражника и легкий меч. Также мне понадобится карта Старого лагеря. Все это я должен передать Алексу и вывести его из тюрьмы. Дальше он справится сам.");
	};
	b_givexp(300);
};

var C_ITEM armor;

instance QUENTIN_DIA0(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia0_condition;
	information = quentin_dia0_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia0_condition()
{
	armor = Npc_GetEquippedArmor(hero);
	if(!Npc_KnowsInfo(hero,quentin_dia33) && Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(org2l))
	{
		return 1;
	};
};

func void quentin_dia0_info()
{
	AI_DrawWeapon(self);
	AI_Output(self,hero,"Quentin_DIA0_01");	//Ты обокрал нас!
	b_setorg2hostile();
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING && !Npc_KnowsInfo(hero,dia_raven_quentin))
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"Не следовало мне грабить грабителей прямо у них под носом... Теперь можно забыть о связях с преступным миром!");
	};
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA5(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia5_condition;
	information = quentin_dia5_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia5_condition()
{
	if(Npc_KnowsInfo(hero,info_alex_bye))
	{
		return 1;
	};
};

func void quentin_dia5_info()
{
	AI_Output(self,hero,"Quentin_DIA5_01");	//Отличная работа! Все целы и невредимы, благодаря тебе! Ты не перестаешь меня удивлять.
	AI_Output(self,hero,"Quentin_DIA5_02");	//Надеюсь, эта руда поможет.
	b_printtrademsg1("Получено руды: 500");
	AI_Output(self,hero,"Quentin_DIA5_03");	//Теперь Алекс в долгу перед тобой. Можешь брать его с собой на охоту или какие-нибудь дела, он поможет тебе.
	AI_Output(self,hero,"Quentin_DIA5_04");	//Только держитесь подальше от лагерей, не хочется, чтобы его опять поймали. Да и в шахты он не полезет.
	b_givexp(400);
	CreateInvItems(self,itminugget,500);
	b_giveinvitems(self,hero,itminugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	b_logentry(QUENTIN_GANG,"Алекс успешно добрался до лагеря грабителей. Я спас его, так что теперь он будет помогать мне, когда потребуется. А у Квентина пока нет для меня новых заданий, можно заняться чем-то другим. Например, тратить заслуженную руду!");
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA51(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia51_condition;
	information = quentin_dia51_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia51_condition()
{
	if(!Npc_KnowsInfo(hero,info_alex_bye) && Npc_KnowsInfo(hero,info_alex_letsgo) && FMTAKEN == TRUE)
	{
		return 1;
	};
};

func void quentin_dia51_info()
{
	AI_Output(self,hero,"Quentin_DIA5_01");	//Отличная работа! Все целы и невредимы, благодаря тебе! Ты не перестаешь меня удивлять.
	AI_Output(self,hero,"Quentin_DIA5_02");	//Надеюсь, эта руда поможет.
	b_printtrademsg1("Получено руды: 500");
	AI_Output(self,hero,"Quentin_DIA5_03");	//Теперь Алекс в долгу перед тобой. Можешь брать его с собой на охоту или какие-нибудь дела, он поможет тебе.
	AI_Output(self,hero,"Quentin_DIA5_04");	//Только держитесь подальше от лагерей, не хочется, чтобы его опять поймали. Да и в шахты он не полезет.
	b_givexp(400);
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	b_fullstop(alex);
	b_exchangeroutine(alex,"Camp");
	b_clearimmortal(alex);
	CreateInvItems(alex,itmw_1h_mace_03,1);
	EquipItem(alex,itmw_1h_mace_03);
	CreateInvItems(alex,itrw_bow_long_01,1);
	EquipItem(alex,itrw_bow_long_01);
	CreateInvItems(alex,itamarrow,200);
	alex.aivar[AIV_PARTYMEMBER] = FALSE;
	var C_NPC org897;
	org897 = Hlp_GetNpc(org_897_mort);
	b_fullstop(org897);
	b_exchangeroutine(org897,"Camp");
	org897.aivar[AIV_PARTYMEMBER] = FALSE;
	CreateInvItems(self,itminugget,500);
	b_giveinvitems(self,hero,itminugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	b_logentry(QUENTIN_GANG,"Алекс успешно добрался до лагеря грабителей. Я спас его, так что теперь он будет помогать мне, когда потребуется. А у Квентина пока нет для меня новых заданий, можно заняться чем-то другим. Например, тратить заслуженную руду!");
	AI_StopProcessInfos(self);
};
