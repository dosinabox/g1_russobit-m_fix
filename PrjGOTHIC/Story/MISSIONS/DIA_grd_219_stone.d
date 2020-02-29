
instance DIA_STONE_HELLO(C_INFO)
{
	npc = grd_219_stone;
	nr = 1;
	condition = dia_stone_hello_condition;
	information = dia_stone_hello_info;
	permanent = 0;
	description = "Ты ведь кузнец?";
};


func int dia_stone_hello_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_stone_hello_info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//Ты ведь кузнец?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//Точно.
};


instance DIA_STONE_NOTSELLING(C_INFO)
{
	npc = grd_219_stone;
	nr = 1;
	condition = dia_stone_notselling_condition;
	information = dia_stone_notselling_info;
	permanent = 1;
	description = "Ты продаешь оружие и доспехи?";
};


func int dia_stone_notselling_condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_stone_notselling_info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//Ты продаешь оружие и доспехи?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//Да, продаю доспехи. А оружием заведует Скип.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//А какие у тебя есть доспехи?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//Есть доспехи для стражников. А ты не стражник. Так что, поищи что-нибудь для себя в другом месте!
	AI_StopProcessInfos(self);
};


instance GRD_219_STONE_GETSTUFF(C_INFO)
{
	npc = grd_219_stone;
	condition = grd_219_stone_getstuff_condition;
	information = grd_219_stone_getstuff_info;
	important = 0;
	permanent = 0;
	description = "Мне нужны доспехи.";
};


func int grd_219_stone_getstuff_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_219_stone_getstuff_info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//Мне нужны доспехи.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//Вижу, Торус взял тебя на службу? Мои поздравления!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//Еще один желающий свернуть себе голову за Гомеза. Впрочем, мне-то какое дело?
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//Вот, держи доспехи и меч. Добро пожаловать в Стражники!
	CreateInvItems(self,itmw_1h_sword_03,2);
	b_giveinvitems(self,other,itmw_1h_sword_03,2);
	Npc_RemoveInvItem(other,itmw_1h_sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	b_logentry(GE_BECOMEGUARD,"Я получил у кузнеца Стоуна мой первый доспех стражника. Я могу купить у него и более прочные доспехи, если у меня будет достаточно руды.");
	AI_StopProcessInfos(self);
};


instance GRD_219_STONE_BETTERARMOR(C_INFO)
{
	npc = grd_219_stone;
	condition = grd_219_stone_betterarmor_condition;
	information = grd_219_stone_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "Мне нужны доспехи получше.";
};


func int grd_219_stone_betterarmor_condition()
{
	if(Npc_KnowsInfo(hero,grd_219_stone_getstuff) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void grd_219_stone_betterarmor_info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//Мне нужны доспехи получше.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//Когда будешь достоин лучшего, тогда и получишь... ну, конечно, если у тебя будет достаточно руды.
	Info_ClearChoices(grd_219_stone_betterarmor);
	Info_AddChoice(grd_219_stone_betterarmor,DIALOG_BACK,grd_219_stone_betterarmor_back);
	Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("Тяж. доспех стражника: оружие 70, стрелы 10, огонь 25",VALUE_GRD_ARMOR_H),grd_219_stone_betterarmor_h);
	Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("Доспех стражника: оружие 55, стрелы 10, огонь 35",VALUE_GRD_ARMOR_M),grd_219_stone_betterarmor_m);
};

func void grd_219_stone_betterarmor_m()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//Мне нужны обычные доспехи стражника.
	if(KAPITEL < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Торус сказал, что сперва послужишь немного, а потом уже и получишь новые доспехи!
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_GRD_ARMOR_M)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Есть у меня одни в запасе, но, похоже, у тебя не хватит на них руды! Будет руда - будут доспехи!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//Хорошо, вот держи. Специально для тебя, новенькие, только не позволяй наемникам их дырявить!
		b_giveinvitems(hero,self,itminugget,VALUE_GRD_ARMOR_M);
		b_giveinvitems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(grd_219_stone_betterarmor);
};

func void grd_219_stone_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//Мне нужны тяжелые доспехи стражника.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02");	//Такие доспехи только для матерых стражников. А ты, парень, до них не дорос.
	Info_ClearChoices(grd_219_stone_betterarmor);
};

func void grd_219_stone_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Я передумал.  
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//Твое дело. Ты знаешь, где меня найти.
	Info_ClearChoices(grd_219_stone_betterarmor);
};


instance DIA_GRD_219_STONE_EXIT(C_INFO)
{
	npc = grd_219_stone;
	nr = 999;
	condition = dia_grd_219_stone_exit_condition;
	information = dia_grd_219_stone_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_219_stone_exit_condition()
{
	return 1;
};

func void dia_grd_219_stone_exit_info()
{
	var C_NPC stone;
	if(Npc_KnowsInfo(hero,dia_grd_219_stone4))
	{
		AI_StopProcessInfos(self);
		stone = Hlp_GetNpc(grd_219_stone);
		TA_BeginOverlay(stone);
		TA_Min(stone,0,0,0,5,zs_position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(stone,0,5,0,10,zs_position,"OCC_MERCS_ENTRANCE");
		TA_Min(stone,0,10,0,15,zs_position,"OCC_SHADOWS_CORNER");
		TA_Min(stone,0,15,0,20,zs_position,"OCC_STABLE_ENTRANCE");
		TA_Min(stone,0,20,72,0,zs_position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//Еще увидимся.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//Увидимся.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_STONE(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone_condition;
	information = dia_grd_219_stone_info;
	important = 1;
	permanent = 0;
};


func int dia_grd_219_stone_condition()
{
	if(KAPITEL >= 5)
	{
		return 1;
	};
};

func void dia_grd_219_stone_info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//Чего тебе? Ты не похож на прихвостней Гомеза.
};


instance DIA_GRD_219_STONE1(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone1_condition;
	information = dia_grd_219_stone1_info;
	important = 0;
	permanent = 0;
	description = "Правда, я не один из его людей.";
};


func int dia_grd_219_stone1_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone))
	{
		return 1;
	};
};

func void dia_grd_219_stone1_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//Правда, я не один из его людей.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//Тогда как ты сюда попал? Ключи от камер Гомез держит при себе...
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//Скажем так, он сам отдал их мне.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//Хочешь сказать, что ты тот парень, который поставил Гомеза на место?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//Да, это я.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//Парень, вот уж никогда бы не подумал! Но я рад, что этот подлый головорез наконец-то получил свое!
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//Но зачем тебе спасать меня?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//Я услышал, что тебя посадили за решетку, и решил использовать эту возможность, чтобы устранить Гомеза и освободить тебя.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//Ну, спасибо...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//... Я твой должник. Будет минутка, заходи ко мне в кузницу, поболтаем.
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_STONE3(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone3_condition;
	information = dia_grd_219_stone3_info;
	important = 1;
	permanent = 0;
};


func int dia_grd_219_stone3_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void dia_grd_219_stone3_info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//А вот и ты. Дай мне тебя отблагодарить за то, что ты меня вытащил из той крысиной норы!
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//Знаешь, я вот подумал: мне ведь нечего тебе подарить, может, я скую для тебя что-нибудь, а?
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//Может, кольцо или что-то в этом роде...
};


instance DIA_GRD_219_STONE2(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone2_condition;
	information = dia_grd_219_stone2_info;
	important = 0;
	permanent = 0;
	description = "Кто посадил тебя за решетку? Как ты здесь оказался?";
};


func int dia_grd_219_stone2_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3))
	{
		return 1;
	};
};

func void dia_grd_219_stone2_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//Кто посадил тебя за решетку? Как ты здесь оказался?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//Гомез! Эта свинья обвинила меня в сговоре с магами Огня. Я жив до сих пор, только потому, что лучший кузнец на весь Старый лагерь.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//Меня бросили в эту крысиную нору и выпускали, только когда нужно было поработать на Гомеза.
};


instance DIA_GRD_219_STONE4(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone4_condition;
	information = dia_grd_219_stone4_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь усилить эти железные доспехи?";
};


func int dia_grd_219_stone4_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && Npc_HasItems(hero,ore_armor_m) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone4_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//Ты можешь усилить эти железные доспехи?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//Конечно, могу. Давай сюда, минутку и все будет готово.
	AI_UnequipArmor(hero);
	b_giveinvitems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	b_giveinvitems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//Держи, теперь эти доспехи мощнее и мы в расчете.
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE5(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone5_condition;
	information = dia_grd_219_stone5_info;
	important = 0;
	permanent = 0;
	description = "Я хотел бы получить кольцо, чтобы повысить мою жизненную энергию.";
};


func int dia_grd_219_stone5_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone5_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//Я хотел бы получить кольцо, которое может повысить мою жизненную энергию.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//Это просто. Минуту.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//Кольцо здоровья даст тебе дополнительный запас жизненных сил. Думаю, теперь мы в расчете.
	CreateInvItem(self,ring_des_lebens2);
	b_giveinvitems(self,other,ring_des_lebens2,1);
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE6(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone6_condition;
	information = dia_grd_219_stone6_info;
	important = 0;
	permanent = 0;
	description = "Наверное, мне пригодилось бы Кольцо Защиты.";
};


func int dia_grd_219_stone6_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone6_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//Наверное, мне пригодилось бы Кольцо защиты.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//Кольцо защиты? Хорошо, прямо сейчас и сделаю. Подожди немного.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//Хотел Кольцо защиты - получил. Так что теперь мы в расчете.
	CreateInvItem(self,schutzring_total2);
	b_giveinvitems(self,other,schutzring_total2,1);
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE7(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone7_condition;
	information = dia_grd_219_stone7_info;
	important = 0;
	permanent = 0;
	description = "Сделай мне то, что повысит мою магическую силу.";
};


func int dia_grd_219_stone7_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone7_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//Сделай мне то, что повысит мою магическую силу.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//...Повысить магическую силу?.. Амулет! Точно, я скую тебе Амулет магии. Подожди немного.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//Вот, амулет готов. Отличная вещь получилась, думаю, ты в обиде не остался.
	CreateInvItem(self,amulett_der_magie);
	b_giveinvitems(self,other,amulett_der_magie,1);
	KNOWSTONE = 1;
};

