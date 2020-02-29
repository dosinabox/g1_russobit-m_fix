
instance ORG_819_DRAX_EXIT(C_INFO)
{
	npc = org_819_drax;
	nr = 999;
	condition = org_819_drax_exit_condition;
	information = org_819_drax_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_819_drax_exit_condition()
{
	return 1;
};

func void org_819_drax_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_819_DRAX_HUNTHERE(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_hunthere_condition;
	information = org_819_drax_hunthere_info;
	permanent = 0;
	description = "Ты охотник, да?";
};


func int org_819_drax_hunthere_condition()
{
	return 1;
};

func void org_819_drax_hunthere_info()
{
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00");	//Ты охотник, да?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01");	//Кажется, да... а что тебе нужно?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02");	//Ты можешь подсказать мне, как лучше охотиться?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03");	//Я могу обучить тебя, но все имеет свою цену.
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04");	//И какова эта цена?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05");	//Для начала бутылка пива, а там посмотрим.
};


var int drax_bierbekommen;
var int drax_lehrer_frei;

instance ORG_819_DRAX_SCAVENGER(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_scavenger_condition;
	information = org_819_drax_scavenger_info;
	permanent = 1;
	description = "Вот твое пиво. Так ты расскажешь мне об охоте?";
};


func int org_819_drax_scavenger_condition()
{
	if(Npc_KnowsInfo(hero,org_819_drax_hunthere) && (DRAX_BIERBEKOMMEN == FALSE))
	{
		return 1;
	};
};

func void org_819_drax_scavenger_info()
{
	if(Npc_HasItems(other,itfobeer) > 0)
	{
		b_giveinvitems(other,self,itfobeer,1);
		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//Вот твое пиво. Так ты расскажешь мне об охоте?
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	// Эти места населены крупными птицами. Мы называем их падальщиками. Атаковать их нужно поодиночке. Выманить падальщика из стаи проще простого.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//Когда ты подойдешь ближе, птица забеспокоится, а потом стремительно бросится на тебя. Держи оружие наготове.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//Нанеси удар первым. Падальщик остановится, и у тебя будет тактическое преимущество. Тогда ты с легкостью его одолеешь.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//Ну, а если он ударит тебя первым, тогда... но этого лучше не допускать.
		DRAX_BIERBEKOMMEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//У меня нет пива.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//Так купи его. Это мой последний бесплатный совет на сегодня. А когда вернешься с пивом, прихвати немного руды.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//Я могу многому тебя научить, но не задаром же!
	};
	DRAX_LEHRER_FREI = TRUE;
	Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
	b_logentry(GE_TEACHEROW,"Вор Дракс предложил мне научиться разделывать добычу, если мне это будет по карману. Обычно он охотится между Старым лагерем и местом обмена.");
};


instance ORG_819_DRAX_CREATURES(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_creatures_condition;
	information = org_819_drax_creatures_info;
	permanent = 1;
	description = "Ты можешь научить меня правильно разделывать добычу?";
};


func int org_819_drax_creatures_condition()
{
	if((DRAX_LEHRER_FREI == TRUE) && ((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE)))
	{
		return 1;
	};
};

func void org_819_drax_creatures_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//Ты можешь научить меня правильно разделывать добычу?
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//Конечно, могу, но на этот раз ты пивом не отделаешься.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//В здешних краях можно добывать шкуры, клыки и когти, если знать, как это делается. Но за это знание придется заплатить.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//Охотничьи трофеи обычно высоко ценятся.
		Info_ClearChoices(org_819_drax_creatures);
		Info_AddChoice(org_819_drax_creatures,DIALOG_BACK,org_819_drax_creatures_back);
		Info_AddChoice(org_819_drax_creatures,"Ты просишь слишком много.",org_819_drax_creatures_prettymuch);
		if(KNOWS_GETTEETH == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"Добыча клыков (Цена: 1 очко обучения, 50 кусков руды)",org_819_drax_creatures_zahn);
		};
		if(KNOWS_GETFUR == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"Добыча шкур (Цена: 1 очко обучения, 100 кусков руды)",org_819_drax_creatures_fell);
		};
		if(KNOWS_GETCLAWS == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"Добыча когтей (Цена: 1 очко обучения, 50 кусков руды)",org_819_drax_creatures_kralle);
		};
		if(KNOWS_GETHIDE == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"Шкуры рептилий (Цена: 1 очко обучения, 100 кусков руды)",org_819_drax_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Ну, вот, теперь я научил тебя всему, что знаю сам.
	};
};

func void org_819_drax_creatures_back()
{
	Info_ClearChoices(org_819_drax_creatures);
};

func void org_819_drax_creatures_prettymuch()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//Ты просишь слишком много.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//Конечно, ведь охота - хороший способ заработать руду.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//Если ты не знаешь, как правильно разделывать добычу, то все убитые тобой звери просто сгниют без пользы.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//А ты упустишь возможность заработать немного, продав их шкуры.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//На твоем месте я постарался бы научиться охотиться как можно быстрее.
};

func void org_819_drax_creatures_zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//Как добывать клыки?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("Навык: добыча клыков",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//Ты должен следить за тем, чтобы клыки не сломались. Чтобы этого избежать, используй очень острый нож, как рычаг.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//Клыки волков, глорхов и мракорисов ценятся выше всего.
			KNOWS_GETTEETH = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи клыков: волк, орочья собака, глорх, жерх, пес-кровосос, мракорис.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00");	//Ты должен набраться опыта, иначе ты ничему не сможешь научиться.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00");	//У тебя нет руды. Как я уже сказал, здесь все имеет свою цену.
	};
};

func void org_819_drax_creatures_fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//Как снимать шкуры?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("Навык: добыча шкур",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01");	//Важно знать, что начинать разделывать тушу следует с головы. Шкуры здесь высоко ценятся, поэтому главное не повредить их при снятии.
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02");	//Из шкур волков и мракорисов шьют хорошую одежду. С практикой к тебе придет умение распознавать, годится та или иная шкура на одежду или нет.
			KNOWS_GETFUR = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи шкур: волк, орочья собака, маркорис, тролль.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01");	//Твоего опыта недостаточно, чтобы воспользоваться моим советом.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//У тебя нет руды. Как я уже сказал, здесь все имеет свою цену.
	};
};

func void org_819_drax_creatures_kralle()
{
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("Навык: добыча когтей",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//Научи меня добывать когти.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01");	//Это проще, чем кажется на первый взгляд. Нужно отогнуть коготь вперед, но при этом не пытаться его выдернуть и не отгибать назад.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02");	//Конечно, пригодные когти можно добыть не у всякого зверя. Обычно в дело идут когти ящериц.
			KNOWS_GETCLAWS = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи когтей: ящерица, глорх, шныг, жерх, штек.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02");	//Твоего опыта недостаточно, чтобы воспользоваться моим советом.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02");	//У тебя нет руды. Как я уже сказал, здесь все имеет свою цену.
	};
};

func void org_819_drax_creatures_haut()
{
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("Навык: добыча шкур рептилий",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//Что нужно делать, чтобы снимать шкуры с рептилий?
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01");	//Для этого подходят не все рептилии, а лишь шныги и болотожоры.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02");	//Если ты подрежешь шкуру по краям, то ты сможешь легко ее снять. Теперь ты сможешь легко справляться с этой задачей.
			KNOWS_GETHIDE = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи шкур рептилий: шныг, болотожор.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//Сначала заплати мне. Как говорится - всему своя цена.
	};
};

