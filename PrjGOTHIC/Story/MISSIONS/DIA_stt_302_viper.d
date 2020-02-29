
instance STT_302_VIPER_EXIT(C_INFO)
{
	npc = stt_302_viper;
	nr = 999;
	condition = stt_302_viper_exit_condition;
	information = stt_302_viper_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_302_viper_exit_condition()
{
	return 1;
};

func void stt_302_viper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_302_VIPER_GREET(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_greet_condition;
	information = stt_302_viper_greet_info;
	important = 0;
	permanent = 0;
	description = "Ты, должно быть, плавильщик.";
};


func int stt_302_viper_greet_condition()
{
	return 1;
};

func void stt_302_viper_greet_info()
{
	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01");	//Ты, должно быть, плавильщик.
	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02");	//А ты умный парень, как я посмотрю.
};


instance STT_302_VIPER_MELT(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_melt_condition;
	information = stt_302_viper_melt_info;
	important = 0;
	permanent = 0;
	description = "Я слышал, что в шахте переплавляется только часть руды.";
};


func int stt_302_viper_melt_condition()
{
	if(Npc_KnowsInfo(hero,stt_302_viper_greet) && Npc_KnowsInfo(hero,grd_260_drake_mine_mehr))
	{
		return 1;
	};
};

func void stt_302_viper_melt_info()
{
	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01");	//Я слышал, что в шахте переплавляется только часть руды.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02");	//Когда-то мы переплавляли всю руду. Но Гомез и маги решили, что так не пойдет.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03");	//Несколько недель они что-то здесь изучали, рассматривали руду и все остальное.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04");	//Они несли всякую чушь и совали свои благородные носы в те вещи, о которых не имели ни малейшего представления.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05");	//В итоге мы стали переплавлять только часть руды, а маги сюда больше не показывались.
};


instance STT_302_VIPER_BUY(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_buy_condition;
	information = stt_302_viper_buy_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь дать мне руду?";
};


func int stt_302_viper_buy_condition()
{
	if(Npc_KnowsInfo(hero,stt_302_viper_greet))
	{
		return 1;
	};
};

func void stt_302_viper_buy_info()
{
	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01");	//Ты можешь дать мне руду?
	if(hero.guild == GIL_ORG)
	{
		AI_Output(self,other,"SVM_11_YouStoleFromMe");	//И ты еще смеешь появляться мне на глаза, грязный вор?
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02");	//Если у тебя есть что-нибудь взамен.
		Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
		b_logentry(GE_TRADEROM,"Вайпер занимается переплавкой руды и может обменять ее на мои товары.");
	};
};

instance STT_302_VIPER_BUY2(C_INFO)
{
	npc = stt_302_viper;
	condition = stt_302_viper_buy2_condition;
	information = stt_302_viper_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_302_viper_buy2_condition()
{
	if(Npc_KnowsInfo(hero,stt_302_viper_buy) && hero.guild != GIL_ORG)
	{
		return 1;
	};
};

func void stt_302_viper_buy2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Давай меняться.
};

