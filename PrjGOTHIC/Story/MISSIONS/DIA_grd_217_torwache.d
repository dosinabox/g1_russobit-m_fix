
instance DIA_GRD_217_EXIT(C_INFO)
{
	npc = grd_217_torwache;
	nr = 999;
	condition = dia_grd_217_exit_condition;
	information = dia_grd_217_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_217_exit_condition()
{
	return 1;
};

func void dia_grd_217_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_217_FIRST(C_INFO)
{
	npc = grd_217_torwache;
	nr = 1;
	condition = dia_grd_217_first_condition;
	information = dia_grd_217_first_info;
	permanent = 1;
	description = "Привет!";
};


func int dia_grd_217_first_condition()
{
	return 1;
};

func void dia_grd_217_first_info()
{
	AI_Output(other,self,"DIA_Grd_217_First_15_00");	//Привет!
	AI_Output(self,other,"DIA_Grd_217_First_06_01");	//Ну, шевелись! Или туда или обратно, только поживее давай.
	AI_StopProcessInfos(self);
};

