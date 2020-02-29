
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return 1;
};

func void dia_jarvis_exit_info()
{
	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00");	//Эй, будь осторожен!
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_FIRST(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 1;
	condition = dia_jarvis_first_condition;
	information = dia_jarvis_first_info;
	permanent = 0;
	important = 1;
};


func int dia_jarvis_first_condition()
{
	return 1;
};

func void dia_jarvis_first_info()
{
	AI_Output(self,other,"DIA_Jarvis_First_08_00");	//Ты хочешь пройти в эти ворота, да?
	AI_Output(other,self,"DIA_Jarvis_First_15_01");	//А ты хочешь меня остановить?
	AI_Output(self,other,"DIA_Jarvis_First_08_02");	//Нет, но тебе следует знать, что тебя за ними ждет. Это не Старый лагерь и не Лагерь сумасшедших сектантов.
	AI_Output(other,self,"DIA_Jarvis_First_15_03");	//И как здесь живется?
	AI_Output(self,other,"DIA_Jarvis_First_08_04");	//У нас нет охранников или Стражей, которые следят за порядком. Здесь каждый сам за себя. Только мы, наемники, стоим друг за друга.
};


instance DIA_JARVIS_SLDINFO(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 1;
	condition = dia_jarvis_sldinfo_condition;
	information = dia_jarvis_sldinfo_info;
	permanent = 0;
	description = "А чем занимаются наемники?";
};


func int dia_jarvis_sldinfo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_first))
	{
		return 1;
	};
};

func void dia_jarvis_sldinfo_info()
{
	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00");	//А чем занимаются наемники?
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01");	//Мы служим магам Воды. Мы их защищаем.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02");	//Все, что мы хотим, - это вырваться из этой колонии. У нас тяжелая работа, но мы не хотим променять на 'удобную' жизнь под крылышком Гомеза, чьи люди живут за счет рудокопов.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03");	//Наш лидер Ли. Он великий человек. Только благодаря ему наш лагерь еще не развалился.
};


instance DIA_JARVIS_MAGIER(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_magier_condition;
	information = dia_jarvis_magier_info;
	permanent = 0;
	description = "А что делают здесь маги?";
};


func int dia_jarvis_magier_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_sldinfo))
	{
		return 1;
	};
};

func void dia_jarvis_magier_info()
{
	AI_Output(other,self,"DIA_Jarvis_Magier_15_00");	//А что делают здесь маги?
	AI_Output(self,other,"DIA_Jarvis_Magier_08_01");	//Они изучают магические свойства руды, которую добывают наши рудокопы.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_02");	//Насколько я знаю, они хотят взорвать эту гору руды, которую мы уже собрали. Они думают, что этот взрыв уничтожит Барьер.
	AI_Output(other,self,"DIA_Jarvis_Magier_15_03");	//Наверное, это будет очень опасно.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_04");	//Они говорят, что такой взрыв не опасен для людей.
};


instance DIA_JARVIS_ERZHAUFEN(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_erzhaufen_condition;
	information = dia_jarvis_erzhaufen_info;
	permanent = 0;
	description = "Здесь есть большая гора руды?";
};


func int dia_jarvis_erzhaufen_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_magier))
	{
		return 1;
	};
};

func void dia_jarvis_erzhaufen_info()
{
	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00");	//Здесь есть большая гора руды?
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01");	//Я бы сказал, да. Думаю, нашей руды хватит даже на то, чтобы купить королеву.
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02");	//Но мы ни за что не отдадим свою руду этому старику. Мы готовы заплатить эту цену за нашу свободу.
};


instance DIA_JARVIS_WOHAUFEN(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 2;
	condition = dia_jarvis_wohaufen_condition;
	information = dia_jarvis_wohaufen_info;
	permanent = 0;
	description = "А где находится рудная гора?";
};


func int dia_jarvis_wohaufen_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_erzhaufen))
	{
		return 1;
	};
};

func void dia_jarvis_wohaufen_info()
{
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00");	//А где находится рудная гора?
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01");	//Ты хочешь увидеть целую гору руды? Всю нашу руду мы складываем в центре пещеры.
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02");	//Но к горе никому нельзя приближаться. Ее постоянно охраняют маги и наемники.
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03");	//Да я просто так спросил.
};


instance DIA_JARVIS_REST(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 3;
	condition = dia_jarvis_rest_condition;
	information = dia_jarvis_rest_info;
	permanent = 0;
	description = "А кто еще живет в лагере?";
};


func int dia_jarvis_rest_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_first))
	{
		return 1;
	};
};

func void dia_jarvis_rest_info()
{
	AI_Output(other,self,"DIA_Jarvis_Rest_15_00");	//А кто еще живет в лагере?
	AI_Output(self,other,"DIA_Jarvis_Rest_08_01");	//В основном здесь живут воры. Порядок в лагере их не беспокоит. Я бы им даже охрану ворот не доверил, по-моему, от крестьян гораздо больше пользы, чем от них.
};


instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_728_jarvis;
	nr = 10;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int dia_jarvis_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_jarvis_magier))
	{
		return 1;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Jarvis_PERM_08_01");	//Как обычно рудокопы добывают руду. Когда ее будет достаточно, мы взорвем гору.
};


instance SLD_728_JARVIS_AUFNAHMESOLDIER(C_INFO)
{
	npc = sld_728_jarvis;
	condition = sld_728_jarvis_aufnahmesoldier_condition;
	information = sld_728_jarvis_aufnahmesoldier_info;
	important = 1;
	permanent = 0;
};


func int sld_728_jarvis_aufnahmesoldier_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && ((Npc_HasItems(hero,itat_crawlerqueen) >= 1) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void sld_728_jarvis_aufnahmesoldier_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01");	//Эй, я слышал, что ползунов в шахте стало гораздо меньше. И все благодаря тебе.
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02");	//Думаю, Ли с радостью примет тебя к себе. Поговори с ним об этом.
	self.flags = 0;
	Log_CreateTopic(GE_BECOMEMERCENARY,LOG_NOTE);
	b_logentry(GE_BECOMEMERCENARY,"Я должен поговорить с Ли. Может быть, он возьмет меня к себе в наемники.");
};

