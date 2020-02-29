
instance VLK_583_GLEN_EXIT(C_INFO)
{
	npc = vlk_583_glen;
	nr = 999;
	condition = vlk_583_glen_exit_condition;
	information = vlk_583_glen_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_583_glen_exit_condition()
{
	return 1;
};

func void vlk_583_glen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance VLK_583_GLEN_INFO(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_info_condition;
	information = vlk_583_glen_info_info;
	important = 0;
	permanent = 1;
	description = "Я хочу осмотреть шахту. Можешь что-нибудь посоветовать?";
};


func int vlk_583_glen_info_condition()
{
	return 1;
};

func void vlk_583_glen_info_info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//Я хочу осмотреть шахту. Можешь что-нибудь посоветовать?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Держись подальше от ползунов.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Чем ниже ты спускаешься, тем больше будет вокруг этих тварей. Мерзкие порождения Белиара!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Они таятся во тьме и поджидают свою добычу. Ты слышишь, как их когти царапают камень, когда они подбираются все ближе и ближе. Я видел, как они убивают...
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//Они быстры и безжалостны. Если тебе дорога жизнь, лучше уноси отсюда ноги, пока еще цел.
};


instance VLK_583_GLEN_LOCKPICK(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_lockpick_condition;
	information = vlk_583_glen_lockpick_info;
	important = 0;
	permanent = 0;
	description = "Я слышал, у тебя можно купить отмычки.";
};


func int vlk_583_glen_lockpick_condition()
{
	if(Npc_KnowsInfo(hero,vlk_585_aleph_glen))
	{
		return 1;
	};
};

func void vlk_583_glen_lockpick_info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//Я слышал, у тебя можно купить отмычки.
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Ну, от такого проныры, как ты, ничего не скроешь, верно? По 10 кусков руды за штуку.
};


instance VLK_583_GLEN_BUY(C_INFO)
{
	npc = vlk_583_glen;
	condition = vlk_583_glen_buy_condition;
	information = vlk_583_glen_buy_info;
	important = 0;
	permanent = 1;
	description = "(купить отмычки)";
	trade = 1;
};


func int vlk_583_glen_buy_condition()
{
	if(Npc_KnowsInfo(hero,vlk_583_glen_lockpick))
	{
		return 1;
	};
};

func void vlk_583_glen_buy_info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Я хочу купить отмычки.
};

