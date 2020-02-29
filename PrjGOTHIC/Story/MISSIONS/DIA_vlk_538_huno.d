
instance DIA_HUNO_EXIT(C_INFO)
{
	npc = vlk_538_huno;
	nr = 999;
	condition = dia_huno_exit_condition;
	information = dia_huno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_huno_exit_condition()
{
	return 1;
};

func void dia_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUNO_YOUKNOWYOURJOB(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_youknowyourjob_condition;
	information = dia_huno_youknowyourjob_info;
	permanent = 0;
	important = 0;
	description = "А у тебя неплохо получается, как я вижу.";
};


func int dia_huno_youknowyourjob_condition()
{
	return TRUE;
};

func void dia_huno_youknowyourjob_info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//А у тебя неплохо получается, как я вижу.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Да уж, недовольных я еще не встречал.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Но если таковые и найдутся, им же хуже. Здесь никто не хочет оставаться без оружия, а ковать хорошие мечи умею только я.
};


instance DIA_HUNO_HOWLONG(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howlong_condition;
	information = dia_huno_howlong_info;
	permanent = 0;
	important = 0;
	description = "Много времени уходит на один меч?";
};


func int dia_huno_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_howlong_info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Много времени уходит на один меч?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Все зависит от меча. Обычный меч я могу выковать очень быстро. Ты и глазом моргнуть не успеешь.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Если, конечно, моя работа будет достойно оплачена.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//А вот таким, как Уистлер, приходится ждать дольше всех.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Почему? Платит слишком мало?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Да нет, как раз наоборот. За последний меч он заплатил мне 150 кусков руды.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Ему подавай не простой меч, а с завитушками и прочими бабьими штучками, а это стоит недешево.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Эй, мне кажется, ты меня не слушаешь!
};


instance DIA_HUNO_HOWSYOURBUSINESS(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howsyourbusiness_condition;
	information = dia_huno_howsyourbusiness_info;
	permanent = 1;
	important = 0;
	description = "Ну, кузнец, как дела?";
};


func int dia_huno_howsyourbusiness_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_howsyourbusiness_info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Ну, кузнец, как дела?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//А зачем ты хочешь это знать?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Может быть, я закажу тебе что-нибудь.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Правда? И что же это?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Я еще не решил.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Приходи ко мне, когда тебе действительно что-нибудь понадобится, и не тревожь меня по пустякам.
};


var int huno_learnsmith;

instance DIA_HUNO_LEARNSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_learnsmith_condition;
	information = dia_huno_learnsmith_info;
	permanent = 1;
	important = 0;
	description = "Я хотел бы попробовать поработать у тебя в кузнице.";
};


func int dia_huno_learnsmith_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_learnsmith_info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Я хотел бы попробовать поработать у тебя в кузнице.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Так, так... только с первого раза у тебя все равно не получится выковать хороший клинок!
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Что мне нужно делать?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Что ж, возьми заготовку и подержи ее над огнем.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Раскаленную докрасна заготовку положи на наковальню и сформируй меч. 
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Когда он будет готов, его нужно закалить, опустив в ведро с водой.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Потом охлажденный клинок нужно будет заточить на точильном камне.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//Я все понял.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//Но без материалов у тебя ничего не выйдет. Если хочешь, можешь купить их у меня. 
	HUNO_LEARNSMITH = TRUE;
};


instance DIA_HUNO_BUYSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_buysmith_condition;
	information = dia_huno_buysmith_info;
	permanent = 1;
	important = 0;
	description = "Я хочу купить у тебя заготовки.";
	trade = 1;
};


func int dia_huno_buysmith_condition()
{
	if(HUNO_LEARNSMITH == TRUE)
	{
		return TRUE;
	};
};

func void dia_huno_buysmith_info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Я хочу купить у тебя заготовки.
	if(Npc_HasItems(self,itmiswordraw) < 5)
	{
		CreateInvItems(self,itmiswordraw,5);
	};
	if(Npc_HasItems(self,itmiswordrawhot) < 5)
	{
		CreateInvItems(self,itmiswordrawhot,5);
	};
	if(Npc_HasItems(self,itmiswordbladehot) < 5)
	{
		CreateInvItems(self,itmiswordbladehot,5);
	};
	if(Npc_HasItems(self,itmiswordblade) < 5)
	{
		CreateInvItems(self,itmiswordblade,5);
	};
};

