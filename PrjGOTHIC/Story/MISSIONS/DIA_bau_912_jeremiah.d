
instance DIA_JEREMIAH_EXIT(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 999;
	condition = dia_jeremiah_exit_condition;
	information = dia_jeremiah_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jeremiah_exit_condition()
{
	return 1;
};

func void dia_jeremiah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JEREMIAH_HALLO(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 1;
	condition = dia_jeremiah_hallo_condition;
	information = dia_jeremiah_hallo_info;
	permanent = 0;
	description = "Что ты делаешь?";
};


func int dia_jeremiah_hallo_condition()
{
	return 1;
};

func void dia_jeremiah_hallo_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Я готовлю шнапс из риса.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Вот, возьми бутылку. Только не говори об этом Силасу.
	CreateInvItems(self,itfobooze,1);
	b_giveinvitems(self,other,itfobooze,1);
};


var int jeremiah_bauer;

instance DIA_JEREMIAH_PERM(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 1;
	condition = dia_jeremiah_perm_condition;
	information = dia_jeremiah_perm_info;
	permanent = 1;
	description = "И как идет приготовление?";
};


func int dia_jeremiah_perm_condition()
{
	return 1;
};

func void dia_jeremiah_perm_info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//И как идет приготовление?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Я не успеваю готовить столько шнапса, сколько пьют все эти типы. А пьют они очень много, поверь мне.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//Но и это хорошо. Пока я здесь работаю, прислужники Лорда мне не мешают.
	JEREMIAH_BAUER = TRUE;
};


instance DIA_JEREMIAH_HORATIO(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 2;
	condition = dia_jeremiah_horatio_condition;
	information = dia_jeremiah_horatio_info;
	permanent = 0;
	description = "Что ты знаешь о Лорде?";
};


func int dia_jeremiah_horatio_condition()
{
	if(JEREMIAH_BAUER == TRUE)
	{
		return 1;
	};
};

func void dia_jeremiah_horatio_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Что ты знаешь о Лорде?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//Он самый гнусный тип из всех, кого я знаю. Его приспешники выискивают самых слабых и заставляют их работать на рисовых полях.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Единственный, кто мог бы справиться с ним, это Горацио. Но он давно отказался от насилия.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//Я слышал, как он говорил, что мог бы с удовольствием избавиться от Лорда. Но он этого никогда не сделает.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//Это против его убеждений.
};

