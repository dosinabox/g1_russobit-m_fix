
instance NOV_1371_BAALNETBEK_EXIT(C_INFO)
{
	npc = nov_1371_baalnetbek;
	nr = 999;
	condition = nov_1371_baalnetbek_exit_condition;
	information = nov_1371_baalnetbek_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int nov_1371_baalnetbek_exit_condition()
{
	return TRUE;
};

func void nov_1371_baalnetbek_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_1371_BAALNETBEK_CRAZY(C_INFO)
{
	npc = nov_1371_baalnetbek;
	condition = nov_1371_baalnetbek_crazy_condition;
	information = nov_1371_baalnetbek_crazy_info;
	important = 0;
	permanent = 0;
	description = "Кто ты?";
};


func int nov_1371_baalnetbek_crazy_condition()
{
	return TRUE;
};

func void nov_1371_baalnetbek_crazy_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01");	//Кто ты?
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02");	//Я Гуру этого Болотного лагеря. Мои слуги зовут меня Идол Нетбек.
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03");	//Здесь же никого нет! О ком ты?
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04");	//Ты можешь и сам их увидеть. Деревья! Они ходят вокруг, танцуют для меня...
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05");	//... понятно, ну, я, пожалуй, пойду...
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06");	//Подожди, ты можешь помочь мне превратить это болото в большой цветущий сад!
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07");	//Ладно, ты начни без меня, а я... я приду потом, как-нибудь.
	AI_TurnAway(hero,self);
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08");	//Надеюсь, он никуда меня не заведет...
	AI_StopProcessInfos(self);
};


instance NOV_1371_BAALNETBEK_AGAIN(C_INFO)
{
	npc = nov_1371_baalnetbek;
	condition = nov_1371_baalnetbek_again_condition;
	information = nov_1371_baalnetbek_again_info;
	important = 0;
	permanent = 1;
	description = "Эй, как дела?";
};


func int nov_1371_baalnetbek_again_condition()
{
	if(Npc_KnowsInfo(hero,nov_1371_baalnetbek_crazy))
	{
		return TRUE;
	};
};

func void nov_1371_baalnetbek_again_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01");	//Эй, как дела?
	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02");	//Смотри, не обижай мои деревья!
};

