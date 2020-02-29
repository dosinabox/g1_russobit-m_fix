
instance DIA_BAALPARVEZ_EXIT(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 999;
	condition = dia_baalparvez_exit_condition;
	information = dia_baalparvez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalparvez_exit_condition()
{
	return 1;
};

func void dia_baalparvez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_GREET(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_greet_condition;
	information = dia_baalparvez_greet_info;
	permanent = 0;
	important = 1;
};


func int dia_baalparvez_greet_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_baalparvez_greet_info()
{
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00");	//Да пребудет с тобой Спящий, незнакомец!
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01");	//Я здесь, чтобы наставить тебя на путь истинный.
};


instance DIA_BAALPARVEZ_RIGHTWAY(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_rightway_condition;
	information = dia_baalparvez_rightway_info;
	permanent = 0;
	description = "И каков этот истинный путь?";
};


func int dia_baalparvez_rightway_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_greet))
	{
		return 1;
	};
};

func void dia_baalparvez_rightway_info()
{
	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00");	//И каков этот истинный путь?
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01");	//Путь Спящего. Лишь в его силе освободить нас.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02");	//Гуру хотят призвать Спящего, и поэтому сейчас в нашем лагере готовится Великая Церемония.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03");	//До сих пор он говорил с нами только в видениях, но пришло время увидеть его воочию.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04");	//Чтобы достичь этого, нам надо объединить всю нашу духовную силу. Для этого нам понадобится много последователей.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05");	//Наш лагерь недалеко отсюда, на болоте. Хочешь, я могу проводить тебя туда.
};


instance DIA_BAALPARVEZ_MYADVANTAGE(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_myadvantage_condition;
	information = dia_baalparvez_myadvantage_info;
	permanent = 0;
	description = "А какая мне польза от того, что я присоединюсь к вам?";
};


func int dia_baalparvez_myadvantage_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_rightway))
	{
		return 1;
	};
};

func void dia_baalparvez_myadvantage_info()
{
	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00");	//А какая мне польза от того, что я присоединюсь к вам?
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01");	//Возможно, ты станешь одним из избранных, кто получит от Спящего магический дар.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02");	//Или ты сможешь достичь больших высот и стать Стражем. Только лучшие из нас могут добиться этого.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03");	//Если будет на то воля Спящего, ты можешь даже совместить оба этих занятия.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04");	//Видишь, наше Братство многое может предложить тебе.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05");	//Серьезно подумай об этом, прежде чем решить присоединиться к какому-нибудь другому лагерю!
};


instance DIA_BAALPARVEZ_SLEEPER(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 2;
	condition = dia_baalparvez_sleeper_condition;
	information = dia_baalparvez_sleeper_info;
	permanent = 0;
	description = "Ты знаешь, кто такой Спящий?";
};


func int dia_baalparvez_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_greet))
	{
		return 1;
	};
};

func void dia_baalparvez_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00");	//Ты знаешь, кто такой Спящий?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01");	//Спящий говорит с нами во снах и видениях.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02");	//Вот уже пять лет, он ведет нас за собой, с тех пор как Юберион впервые услышал его.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03");	//Все члены Братства отвергают трех богов и молятся о спасении лишь Спящему.
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04");	//Спасении? От чего?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05");	//От этого проклятого места, конечно! Спящий укажет нам путь к свободе!
};


instance DIA_BAALPARVEZ_SLEEPERSAID(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 2;
	condition = dia_baalparvez_sleepersaid_condition;
	information = dia_baalparvez_sleepersaid_info;
	permanent = 0;
	description = "И что сказал Спящий?";
};


func int dia_baalparvez_sleepersaid_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_sleeper))
	{
		return 1;
	};
};

func void dia_baalparvez_sleepersaid_info()
{
	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00");	//И что сказал Спящий?
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01");	//Он привел нас к развалинам старого храма на болоте. Именно там мы построили свой лагерь.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02");	//Он даровал нам свободу действий - никто из нас не горбит спину на шахтах.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03");	//Он открыл нам силу болотника. Мы продаем его другим лагерям и взамен получаем все, что нам надо.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04");	//А избранных он одарил магическим даром. Его магия более могущественная и древняя, чем та, что используется остальными.
};


instance DIA_BAALPARVEZ_PSIMAGIC(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 4;
	condition = dia_baalparvez_psimagic_condition;
	information = dia_baalparvez_psimagic_info;
	permanent = 0;
	description = "Расскажи мне о магии Спящего.";
};


func int dia_baalparvez_psimagic_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalparvez_sleepersaid))
	{
		return 1;
	};
};

func void dia_baalparvez_psimagic_info()
{
	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00");	//Расскажи мне о магии Спящего.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01");	//Этот дар позволяет человеку управлять силой своего разума.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02");	//Только Гуру посвящены в таинство магии Спящего.
};


var int baalparvez_gotopsi_day;

instance DIA_BAALPARVEZ_GOTOPSI(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 800;
	condition = dia_baalparvez_gotopsi_condition;
	information = dia_baalparvez_gotopsi_info;
	permanent = 1;
	description = "Проводи меня в свой лагерь. Я хочу посмотреть на него!";
};


func int dia_baalparvez_gotopsi_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(hero,dia_baalparvez_rightway) && (Npc_GetDistToWP(self,"PATH_OC_PSI_18") > 5000) && !Npc_KnowsInfo(hero,dia_baalparvez_atpsi))
	{
		return 1;
	};
};

func void dia_baalparvez_gotopsi_info()
{
	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00");	//Проводи меня в свой лагерь. Я хочу посмотреть на него!
	if(PSI_WALK == 0)
	{
		if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
		};
		b_logentry(CH1_JOINPSI,"Идол Парвез, миссионер из Братства, ищет последователей веры в Спящего в Старом лагере. Он предложил проводить меня в Болотный лагерь.");
		PSI_WALK = 1;
	};
	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01");	//Очень хорошо! Я пойду впереди. Иди за мной!
	BAALPARVEZ_GOTOPSI_DAY = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_SetRefuseTalk(self,300);
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_BAALPARVEZ_ATPSI(C_INFO)
{
	npc = nov_1330_baalparvez;
	nr = 1;
	condition = dia_baalparvez_atpsi_condition;
	information = dia_baalparvez_atpsi_info;
	permanent = 0;
	important = 1;
};


func int dia_baalparvez_atpsi_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18"))
	{
		return 1;
	};
};

func void dia_baalparvez_atpsi_info()
{
	var C_NPC kalom;
	if(BAALPARVEZ_GOTOPSI_DAY > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00");	//Вот, мы на месте. Дальше по дороге вниз находится лагерь Братства.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00");	//Видишь внизу? Это наш лагерь.
	};
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01");	//Заходи и поговори с моими братьями. Уверен, что, придя сюда, ты не потратил время зря.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02");	//Спроси Кор Галома. Он занимается учениками и их наставниками.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03");	//А я возвращаюсь в лагерь. Там еще многим нужно помочь найти путь истины.
	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04");	//Удачи!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_logentry(CH1_JOINPSI,"Передо мной Болотный лагерь. Мой проводник посоветовал мне поговорить с Гуру Кор Галомом. Он наблюдает за послушниками и наставниками.");
	b_givexp(XP_ARRIVEDATPSICAMP);
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	kalom.aivar[AIV_FINDABLE] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

