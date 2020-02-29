
instance VLK_587_GARP_EXIT(C_INFO)
{
	npc = vlk_587_garp;
	nr = 999;
	condition = vlk_587_garp_exit_condition;
	information = vlk_587_garp_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_587_garp_exit_condition()
{
	return 1;
};

func void vlk_587_garp_exit_info()
{
	AI_StopProcessInfos(self);
};


instance VLK_587_GARP_ORK(C_INFO)
{
	npc = vlk_587_garp;
	condition = vlk_587_garp_ork_condition;
	information = vlk_587_garp_ork_info;
	important = 0;
	permanent = 0;
	description = "Скажи, что здесь делает орк?";
};


func int vlk_587_garp_ork_condition()
{
	return 1;
};

func void vlk_587_garp_ork_info()
{
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01");	//Скажи, что здесь делает орк?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Работает. Его нашли стражники и заставили выполнять самую тяжелую работу.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Его не держат на привязи. Почему же он не сбежит?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Однажды он попытался. Стражники его так сильно избили, что он недели две встать не мог. С тех пор он смирился и не хочет убегать.
};

