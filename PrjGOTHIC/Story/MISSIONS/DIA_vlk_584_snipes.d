
instance VLK_584_SNIPES_EXIT(C_INFO)
{
	npc = vlk_584_snipes;
	nr = 999;
	condition = vlk_584_snipes_exit_condition;
	information = vlk_584_snipes_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_584_snipes_exit_condition()
{
	return 1;
};

func void vlk_584_snipes_exit_info()
{
	AI_Output(other,self,"Info_Exit_Info_15_001");	//Еще увидимся!
	AI_Output(self,other,"Info_Exit_Info_07_02");	//Конечно, увидимся!
	AI_StopProcessInfos(self);
};


instance VLK_584_SNIPES_DEAL(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_condition;
	information = vlk_584_snipes_deal_info;
	important = 0;
	permanent = 0;
	description = "Как идут дела?";
};


func int vlk_584_snipes_deal_condition()
{
	return 1;
};

func void vlk_584_snipes_deal_info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01");	//Как идут дела?
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02");	//Я могу предложить тебе одно дельце.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03");	//Если ты сможешь отправить Аарона подальше от его сундука, я дам тебе десять кусков руды.
	SNIPES_DEAL = LOG_RUNNING;
	Log_CreateTopic(CH2_SNIPESDEAL,LOG_MISSION);
	Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_RUNNING);
	b_logentry(CH2_SNIPESDEAL,"Рудокоп Снайпс предложил мне 10 кусков руды, если я отвлеку стражника Аарона от его сундука!");
};


instance VLK_584_SNIPES_DEAL_RUN(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_run_condition;
	information = vlk_584_snipes_deal_run_info;
	important = 0;
	permanent = 0;
	description = "Ну, где мои десять кусков?";
};


func int vlk_584_snipes_deal_run_condition()
{
	if(SNIPES_DEAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void vlk_584_snipes_deal_run_info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01");	//Ну, где мои десять кусков?
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//Возьми, ты заслужил их.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03");	//Да, знаешь, что еще: у меня есть ключ от этого сундука. Только для тебя - всего за тридцать кусков!
	CreateInvItems(self,itminugget,10);
	b_giveinvitems(self,other,itminugget,10);
	CreateInvItem(self,itke_om_02);
	b_givexp(XP_LUREAARONAWAY);
	b_logentry(CH2_SNIPESDEAL,"Снайпс предложил мне купить у него ключ за 30 кусков руды.");
};


instance VLK_584_SNIPES_DEAL_2(C_INFO)
{
	npc = vlk_584_snipes;
	condition = vlk_584_snipes_deal_2_condition;
	information = vlk_584_snipes_deal_2_info;
	important = 0;
	permanent = 1;
	description = "(купить ключ)";
};


func int vlk_584_snipes_deal_2_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal_run) && Npc_HasItems(self,itke_om_02) && SNIPES_KEY == FALSE)
	{
		return 1;
	};
};

func void vlk_584_snipes_deal_2_info()
{
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01");	//По рукам, я его покупаю!
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02");	//Думаю, дело того стоит.
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03");	//А что с этого получишь ты?
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04");	//Да, знаешь, мне просто приятно, что я смогу обвести кого-то из стражников вокруг пальца. А если что-то из этого сундука окажется у меня, мне не жить.
		b_giveinvitems(hero,self,itminugget,30);
		b_giveinvitems(self,hero,itke_om_02,1);
		SNIPES_KEY = TRUE;
		b_logentry(CH2_SNIPESDEAL,"Я купил у Снайпса ключ от сундука. Интересно, что мне скажет об этом Аарон, когда я расскажу ему об этом?");
	}
	else
	{
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05");	//Я же сказал: тридцать кусков, и ключ твой.
	};
};

