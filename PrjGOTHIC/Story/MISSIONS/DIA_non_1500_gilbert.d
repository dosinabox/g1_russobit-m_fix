
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
	return 1;
};

func void dia_gilbert_first_info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Что ты здесь делаешь? Редко кто заходит ко мне сюда, хе-хе!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//Тебе удалось найти мое убежище, что не многим под силу.
	Npc_ExchangeRoutine(self,"start2");
	b_givexp(XP_GILBERTFOUND);
};


instance DIA_GILBERT_HALLO(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo_condition;
	information = dia_gilbert_hallo_info;
	permanent = 0;
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

instance DIA_GILBERT_HALLO2(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo2_condition;
	information = dia_gilbert_hallo2_info;
	permanent = 0;
	description = "(потребовать дубликат ключа)";
};


func int dia_gilbert_hallo2_condition()
{
	if(Npc_KnowsInfo(hero,dia_gilbert_hallo) && Npc_KnowsInfo(hero,quentin_dia33) && !Npc_HasItems(hero,itke_gilbert))
	{
		return TRUE;
	};
};

func void dia_gilbert_hallo2_info()
{
	if(hero.level < 6)
	{	
		AI_Output(self,other,"SVM_4_GetOutOfHere");	//Убирайся отсюда!
		AI_StopProcessInfos(self);
		b_setattackreason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		AI_StartState(self,zs_attack,1,"");
		b_logentry(QUENTIN_GANG,"Гилберт яростно набросился на меня. Интересно, зачем этот дубликат так нужен Квентину?");
	}
	else
	{
		AI_Output(self,other,"SVM_4_LookAway");	//Не вижу, не слышу и никому ничего не скажу...
		b_givexp(100);
		b_giveinvitems(self,hero,itke_gilbert,1);
		AI_StopProcessInfos(self);
		AI_StartState(self,zs_flee,1,"");
		b_logentry(QUENTIN_GANG,"Гилберт вернул мне копию ключа и бросился бежать. Интересно, зачем она так нужна Квентину?");
	};
};

