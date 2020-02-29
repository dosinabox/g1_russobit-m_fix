
instance DIA_SLD_752_OKYL_INTRO(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_intro_condition;
	information = dia_sld_752_okyl_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_752_okyl_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 250)
	{
		return 1;
	};
};

func void dia_sld_752_okyl_intro_info()
{
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//Эй, ты! Раньше я тебя не видел. Что ты здесь делаешь?
};


instance DIA_SLD_752_OKYL_EXIT(C_INFO)
{
	nr = 999;
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "Я пойду, ладно?";
};


func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//Я пойду, ладно?
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//Вот и правильно. Иди себе.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_UMSEHEN(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Я просто хочу немного оглядеться.";
};


func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//Я просто хочу немного оглядеться.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//Тогда следи за тем, чтобы не влипнуть в неприятности, иначе ты окажешься в могиле раньше, чем успеешь пожалеть об этом.
};


instance DIA_SLD_752_OKYL_WERBISTDU(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "Кто ты такой?";
};


func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//Кто ты такой?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//Я Окил. Я здесь главный.
};


instance DIA_SLD_752_OKYL_INMINE(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "Я хотел просто посмотреть, что там у вас в шахте.";
};


func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//Я хотел просто посмотреть, что там у вас в шахте.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//А, просто заглянуть в шахту...
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//Похоже, ты совершенно ни в чем не разбираешься. Никто не может попасть в шахту без моего разрешения.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//Заруби это себе на носу. Тот, кто попадет в шахту без моего согласия, долго не проживет!
};


instance DIA_SLD_752_OKYL_PERMIT(C_INFO)
{
	npc = sld_752_okyl;
	condition = dia_sld_752_okyl_permit_condition;
	information = dia_sld_752_okyl_permit_info;
	important = 0;
	permanent = 0;
	description = "А ты можешь разрешить мне пойти туда?";
};


func int dia_sld_752_okyl_permit_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_inmine))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_permit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");	//А ты можешь разрешить мне пойти туда?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//А я даже не знаю, кто ты. Почему я должен давать тебе такое разрешение?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//И вообще, у меня много дел. Проваливай.
	AI_StopProcessInfos(self);
};

