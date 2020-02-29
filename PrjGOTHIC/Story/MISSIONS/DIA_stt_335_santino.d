
instance STT_335_SANTINO_EXIT(C_INFO)
{
	npc = stt_335_santino;
	nr = 999;
	condition = stt_335_santino_exit_condition;
	information = stt_335_santino_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_335_santino_exit_condition()
{
	return 1;
};

func void stt_335_santino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_335_SANTINO_BUY(C_INFO)
{
	npc = stt_335_santino;
	condition = stt_335_santino_buy_condition;
	information = stt_335_santino_buy_info;
	important = 0;
	permanent = 0;
	description = "я могу у теб€ что-нибудь купить?";
};


func int stt_335_santino_buy_condition()
{
	return 1;
};

func void stt_335_santino_buy_info()
{
	AI_Output(other,self,"STT_335_Santino_BUY_Info_15_01");	//я могу у теб€ что-нибудь купить?
	AI_Output(self,other,"STT_335_Santino_BUY_Info_07_02");	//” мен€ есть все, что можно продать. ј то, чего у мен€ нет, все равно никому не нужно.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	b_logentry(GE_TRADEROM,"—антино продает некоторые припасы: болты, стрелы, еду.");
};

instance STT_335_SANTINO_BUY2(C_INFO)
{
	npc = stt_335_santino;
	condition = stt_335_santino_buy2_condition;
	information = stt_335_santino_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_335_santino_buy2_condition()
{
	if(Npc_KnowsInfo(hero,stt_335_santino_buy))
	{
		return 1;
	};
};

func void stt_335_santino_buy2_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//ѕокажи мне свои товары.
};

