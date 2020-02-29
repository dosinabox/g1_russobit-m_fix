
instance DIA_GRD_281_EXIT(C_INFO)
{
	npc = grd_281_gardist;
	nr = 999;
	condition = dia_grd_281_exit_condition;
	information = dia_grd_281_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_281_exit_condition()
{
	return 1;
};

func void dia_grd_281_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_281_GUARDGATE(C_INFO)
{
	npc = grd_281_gardist;
	nr = 1;
	condition = dia_grd_281_guardgate_condition;
	information = dia_grd_281_guardgate_info;
	permanent = 1;
	description = "Как дела?";
};


func int dia_grd_281_guardgate_condition()
{
	if(!c_npcbelongstonewcamp(other))
	{
		return 1;
	};
};

func void dia_grd_281_guardgate_info()
{
	AI_Output(other,self,"DIA_Grd_281_GuardGate_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Grd_281_GuardGate_07_01");	//Хорошо! Воры из Нового лагеря сюда не заглядывают, значит, все в порядке.
	AI_StopProcessInfos(self);
};

