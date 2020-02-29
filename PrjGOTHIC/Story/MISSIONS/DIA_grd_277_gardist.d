
instance GRD_277_GARDIST_SITTINGORK(C_INFO)
{
	npc = grd_277_gardist;
	condition = grd_277_gardist_sittingork_condition;
	information = grd_277_gardist_sittingork_info;
	important = 0;
	permanent = 0;
	description = "Что это за орк?";
};


func int grd_277_gardist_sittingork_condition()
{
	if(IAN_GEARWHEEL != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void grd_277_gardist_sittingork_info()
{
	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01");	//Что это за орк?
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02");	//Он наш пленник. Счастливчик! У нас сломалась шестеренка, и этот мерзавец может спокойно валять дурака.
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03");	//Как только пресс будет отремонтирован, он сразу же приступит к работе. Бездельничать не будет.
};


instance GRD_277_GARDIST_WORKINGORK(C_INFO)
{
	npc = grd_277_gardist;
	condition = grd_277_gardist_workingork_condition;
	information = grd_277_gardist_workingork_info;
	important = 0;
	permanent = 0;
	description = "Как я вижу, пресс уже в порядке.";
};


func int grd_277_gardist_workingork_condition()
{
	if(IAN_GEARWHEEL == LOG_SUCCESS && Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void grd_277_gardist_workingork_info()
{
	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01");	//Как я вижу, пресс уже в порядке.
	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02");	//Отлично. Заставить работать - это мы умеем.
};

