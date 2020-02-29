
instance GRD_261_BRANDICK_EXIT(C_INFO)
{
	npc = grd_261_brandick;
	nr = 999;
	condition = grd_261_brandick_exit_condition;
	information = grd_261_brandick_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_261_brandick_exit_condition()
{
	return 1;
};

func void grd_261_brandick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_261_BRANDICK_ALEPH(C_INFO)
{
	npc = grd_261_brandick;
	condition = grd_261_brandick_aleph_condition;
	information = grd_261_brandick_aleph_info;
	important = 0;
	permanent = 0;
	description = "(выдать Алефа)";
};


func int grd_261_brandick_aleph_condition()
{
	if(Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void grd_261_brandick_aleph_info()
{
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01");	//Слушай, этот Алеф бездельничает, когда ты за ним не наблюдаешь.
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02");	//Правда?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03");	//Ты знаешь, кого я не люблю больше, чем лоботрясов? Предателей. Так что убирайся отсюда!
	Npc_ExchangeRoutine(self,"WATCH");
	b_exchangeroutine(vlk_585_aleph,"BUSY");
	AI_StopProcessInfos(self);
};

