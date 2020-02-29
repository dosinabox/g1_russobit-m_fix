
instance STT_300_ALBERTO_EXIT(C_INFO)
{
	npc = stt_300_alberto;
	nr = 999;
	condition = stt_300_alberto_exit_condition;
	information = stt_300_alberto_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_300_alberto_exit_condition()
{
	return 1;
};

func void stt_300_alberto_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_300_ALBERTO_BUY(C_INFO)
{
	npc = stt_300_alberto;
	condition = stt_300_alberto_buy_condition;
	information = stt_300_alberto_buy_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_300_alberto_buy_condition()
{
	return 1;
};

func void stt_300_alberto_buy_info()
{
	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01");	//Я могу что-нибудь купить у тебя?
	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02");	//Еще бы. Все, что захочешь. Если сможешь заплатить.
};

