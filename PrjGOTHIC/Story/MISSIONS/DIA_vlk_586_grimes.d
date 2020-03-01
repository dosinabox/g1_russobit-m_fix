
instance VLK_586_GRIMES_EXIT(C_INFO)
{
	npc = vlk_586_grimes;
	nr = 999;
	condition = vlk_586_grimes_exit_condition;
	information = vlk_586_grimes_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_586_grimes_exit_condition()
{
	return 1;
};

func void vlk_586_grimes_exit_info()
{
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//Желаю удачи!
	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02");	//И тебе того же, паренек.
	AI_StopProcessInfos(self);
};


instance VLK_586_GRIMES_STORY(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_story_condition;
	information = vlk_586_grimes_story_info;
	important = 0;
	permanent = 0;
	description = "Ты давно здесь живешь?";
};


func int vlk_586_grimes_story_condition()
{
	if(Npc_KnowsInfo(hero,vlk_586_grimes_first))
	{
		return 1;
	};
};

func void vlk_586_grimes_story_info()
{
	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01");	//Ты давно здесь живешь?
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02");	//Да, я уже лет 10 здесь живу. И знаешь, за это время я многому научился и многое испытал.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03");	//В какие только неприятности я не попадал, но, как видишь, я все еще жив.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04");	//Когда-то давным-давно мы работали на шахте... Теперь она заброшена, да и балки, наверное, уже давно обрушились...
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05");	//Но, это было давно...
};


instance VLK_586_GRIMES_KNOW(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_know_condition;
	information = vlk_586_grimes_know_info;
	important = 0;
	permanent = 0;
	description = "Должно быть, ты уже немало слышал о разных планах побега из колонии.";
};


func int vlk_586_grimes_know_condition()
{
	if(Npc_KnowsInfo(hero,vlk_586_grimes_story))
	{
		return 1;
	};
};

func void vlk_586_grimes_know_info()
{
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01");	//Должно быть, ты уже немало слышал о разных планах побега из колонии.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02");	//Послушай, парень, я понимаю твое желание выбраться отсюда. Но мой совет - забудь об этом.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03");	//Лучше и не думай о побеге. Я видел тех, кто пытался пройти через Барьер.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04");	//Не повторяй их ошибок. Барьер никого не выпустит.
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05");	//В мои планы не входит провести ближайшие десять лет в этой шахте!
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06");	//Не хочешь - не надо. Возможно, когда-нибудь ты будешь большим человеком, кто знает.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07");	//Да только Барьеру не важно кем ты будешь, он тебя все равно остановит.
};


instance VLK_586_GRIMES_FIRST(C_INFO)
{
	npc = vlk_586_grimes;
	condition = vlk_586_grimes_first_condition;
	information = vlk_586_grimes_first_info;
	important = 1;
	permanent = 0;
};


func int vlk_586_grimes_first_condition()
{
	return 1;
};

func void vlk_586_grimes_first_info()
{
	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02");	//Новенький! Ты руду добывал когда-нибудь?
	Npc_ExchangeRoutine(self,"WORK");
};

