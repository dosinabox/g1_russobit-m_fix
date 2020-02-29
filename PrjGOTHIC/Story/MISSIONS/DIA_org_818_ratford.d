
instance ORG_818_RATFORD_EXIT(C_INFO)
{
	npc = org_818_ratford;
	nr = 999;
	condition = org_818_ratford_exit_condition;
	information = org_818_ratford_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_818_ratford_exit_condition()
{
	return 1;
};

func void org_818_ratford_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_818_RATFORD_WRONGWAY(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_wrongway_condition;
	information = org_818_ratford_wrongway_info;
	permanent = 0;
	important = 1;
};


func int org_818_ratford_wrongway_condition()
{
	return 1;
};

func void org_818_ratford_wrongway_info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//Эй, ты!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//Что тебе нужно?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Хочу предупредить тебя. Прямо за нами начинаются охотничьи угодья.
};


instance ORG_818_RATFORD_WHATGAME(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_whatgame_condition;
	information = org_818_ratford_whatgame_info;
	permanent = 0;
	description = "А на кого здесь можно охотиться?";
};


func int org_818_ratford_whatgame_condition()
{
	return 1;
};

func void org_818_ratford_whatgame_info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//А на кого здесь можно охотиться?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//На падальщиков. Мы добываем дичь, к тому же их не так уж сложно убивать. Нужно только знать как.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//Да? И как это сделать?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Спроси моего напарника Дракса. Он в этом гораздо лучше разбирается.
};


instance ORG_818_RATFORD_WHYDANGEROUS(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_whydangerous_condition;
	information = org_818_ratford_whydangerous_info;
	permanent = 0;
	description = "Почему эти места считаются опасными?";
};


func int org_818_ratford_whydangerous_condition()
{
	return 1;
};

func void org_818_ratford_whydangerous_info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//Почему эти места считаются опасными?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Ты только что прибыл, да? В колонии нет безопасных мест, каждый шаг таит какую-то опасность.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//На дорогах между лагерями не так опасно, но даже там тебя может поджидать пара волков или ящериц, для которых ты станешь легкой добычей.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//И тебе от них не спастись, если у тебя нет ни хорошего доспеха, ни стоящего оружия.
};


instance ORG_818_RATFORD_WOEQUIPMENT(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_woequipment_condition;
	information = org_818_ratford_woequipment_info;
	permanent = 0;
	description = "Где я могу найти хорошие доспехи и оружие?";
};


func int org_818_ratford_woequipment_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
	{
		return 1;
	};
};

func void org_818_ratford_woequipment_info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Где я могу найти хорошие доспехи и оружие?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//У торговцев в лагерях. Отсюда недалеко до Старого лагеря. Иди по дороге и без труда его найдешь.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Но в Новом лагере, из которого мы пришли, вещи стоят не так дорого, если, конечно, найти нужных людей.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Если зайдешь в Старый лагерь, найди Мордрага. Он один из нас. У него ты сможешь купить хороший товар по низкой цене.
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"Вор Мордраг продает в Старом лагере свои товары по выгодным ценам.");
};


instance ORG_818_RATFORD_MORELOCATIONS(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_morelocations_condition;
	information = org_818_ratford_morelocations_info;
	permanent = 0;
	description = "Расскажи мне о том, что находится в этой колонии.";
};


func int org_818_ratford_morelocations_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
	{
		return 1;
	};
};

func void org_818_ratford_morelocations_info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//Расскажи мне о том, что находится в этой колонии.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Чтобы быстро найти дорогу от одного лагеря к другому, лучше купить карту. Так ты избежишь многих неприятностей.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Я имею в виду встречи с разными существами, которых лучше никогда не встречать. Они обитают в разных ущельях.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Избегай старых развалин. Здесь их очень много. Большинство из них - старые укрепления, оставшиеся со времен первой войны с орками. Иногда можно встретить и покинутые поселения орков.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//Обычно в таких местах можно еще встретить орков или даже более опасных тварей. А ночью от таких мест вообще лучше держаться подальше.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//И мой последний совет: не стоит бродить по местным лесам!
};


instance ORG_818_RATFORD_WOKARTE(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_wokarte_condition;
	information = org_818_ratford_wokarte_info;
	permanent = 0;
	description = "Где мне достать карту?";
};


func int org_818_ratford_wokarte_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
	{
		return 1;
	};
};

func void org_818_ratford_wokarte_info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Где мне достать карту?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Спроси об этом людей из Старого лагеря. По-моему, там жил один картограф.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Может, у тебя получиться выудить у него какую-нибудь карту. А, может, у него будет карта и для меня?
	Info_ClearChoices(org_818_ratford_wokarte);
	Info_AddChoice(org_818_ratford_wokarte,"Если я достану карту бесплатно, я возьму все, что смогу унести.",org_818_ratford_wokarte_stehlen);
	Info_AddChoice(org_818_ratford_wokarte,"А зачем это тебе? Разве он не продает их?",org_818_ratford_wokarte_kaufen);
};

func void org_818_ratford_wokarte_stehlen()
{
	var C_NPC lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Если у меня получится достать карту бесплатно, то я возьму столько, сколько смогу унести.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//А ты мне нравишься! Быть может, ты захочешь присоединиться к Новому лагерю? Если зайдешь туда, найди Ларса. Он принимает новых людей. Думаю, у него найдется для тебя работа.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(org_818_ratford_wokarte);
};

func void org_818_ratford_wokarte_kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//А зачем это тебе? Разве он не продает их?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Ну, за нее придется отдать не так уж мало руды...
	Info_ClearChoices(org_818_ratford_wokarte);
};


instance ORG_818_RATFORD_THANKS(C_INFO)
{
	npc = org_818_ratford;
	nr = 888;
	condition = org_818_ratford_thanks_condition;
	information = org_818_ratford_thanks_info;
	permanent = 0;
	description = "Спасибо за помощь.";
};


func int org_818_ratford_thanks_condition()
{
	return 1;
};

func void org_818_ratford_thanks_info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Спасибо за помощь.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Только не думай, что здесь все будут рады помочь тебе!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Конечно, у новичка отбирать нечего, но некоторые могут убить тебя просто потому, что им приглянулась твоя кирка.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//Я это запомню.
};

