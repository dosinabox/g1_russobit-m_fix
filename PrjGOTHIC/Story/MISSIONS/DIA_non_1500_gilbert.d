
instance DIA_GILBERT_EXIT(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 999;
	condition = dia_gilbert_exit_condition;
	information = dia_gilbert_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gilbert_exit_condition()
{
	return 1;
};

func void dia_gilbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILBERT_FIRST(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_first_condition;
	information = dia_gilbert_first_info;
	permanent = 0;
	important = 1;
};


func int dia_gilbert_first_condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_gilbert_first_info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Что ты здесь делаешь? Редко кто заходит ко мне сюда, хе-хе!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//Тебе удалось найти мое убежище, что не многим под силу.
	b_givexp(XP_GILBERTFOUND);
};


instance DIA_GILBERT_HALLO(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo_condition;
	information = dia_gilbert_hallo_info;
	permanent = 1;
	description = "Что ты здесь делаешь?";
};


func int dia_gilbert_hallo_condition()
{
	return 1;
};

func void dia_gilbert_hallo_info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Старый лагерь мне давно надоел. У нас давние разногласия с людьми Гомеза. Как давно это все началось...
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//Теперь обо мне, наверное, никто и не помнит. Но я все равно останусь здесь. В Старом лагере стало слишком много солдатни.
};

