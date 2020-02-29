
instance DIA_CAINE_EXIT(C_INFO)
{
	npc = nov_1301_caine;
	nr = 999;
	condition = dia_caine_exit_condition;
	information = dia_caine_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_caine_exit_condition()
{
	return 1;
};

func void dia_caine_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CAINE_HALLO(C_INFO)
{
	npc = nov_1301_caine;
	nr = 1;
	condition = dia_caine_hallo_condition;
	information = dia_caine_hallo_info;
	permanent = 0;
	description = "Привет! Я новенький!";
};


func int dia_caine_hallo_condition()
{
	return 1;
};

func void dia_caine_hallo_info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Привет! Я новенький!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//А я Каин. Ученик Кор Галома. Ты ведь уже слышал о нем, правда?
	Info_ClearChoices(dia_caine_hallo);
	Info_AddChoice(dia_caine_hallo,"Нет.",dia_caine_hallo_nein);
	Info_AddChoice(dia_caine_hallo,"Да.",dia_caine_hallo_ja);
};

func void dia_caine_hallo_ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Да.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Тогда ты знаешь, что он правая рука Юбериона.
	Info_ClearChoices(dia_caine_hallo);
};

func void dia_caine_hallo_nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Нет.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Не слышал? Ты недавно сюда пришел, да?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Кор Галом - правая рука Юбериона. Наш Учитель прислушивается к его советам. От него зависит, кто будет принят в Братство, а кто нет.
	Info_ClearChoices(dia_caine_hallo);
};


instance DIA_CAINE_JOB(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_job_condition;
	information = dia_caine_job_info;
	permanent = 0;
	description = "А что делаешь ты?";
};


func int dia_caine_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_hallo))
	{
		return 1;
	};
};

func void dia_caine_job_info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//А что делаешь ты?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Я помогаю Кор Галому готовить алхимические зелья.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//Для этого используется болотник и слюна ползунов. Но сейчас ему необходима именно слюна.
};


instance DIA_CAINE_WOSEKRET(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_wosekret_condition;
	information = dia_caine_wosekret_info;
	permanent = 0;
	description = "Как добывать слюну ползунов?";
};


func int dia_caine_wosekret_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_job) && (KNOWS_GETMCMANDIBLES != TRUE))
	{
		return 1;
	};
};

func void dia_caine_wosekret_info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Как добывать слюну ползунов?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Ползуны живут в Старой шахте. Недостаточно их убить. Слюну добудет тот, кто знает, как это делается.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Если ты действительно хочешь научиться добывать слюну, тебе стоит поговорить с Гор На Драком. Он хорошо в этом разбирается.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//Каждый день он ходит к Старой шахте. Утром ты сможешь его встретить внизу, под лабораторией.
};


instance DIA_CAINE_ADDINFOKALOM(C_INFO)
{
	npc = nov_1301_caine;
	nr = 2;
	condition = dia_caine_addinfokalom_condition;
	information = dia_caine_addinfokalom_info;
	permanent = 0;
	description = "Ты можешь рассказать мне что-нибудь еще о твоем учителе?";
};


func int dia_caine_addinfokalom_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_job))
	{
		return 1;
	};
};

func void dia_caine_addinfokalom_info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Ты можешь рассказать мне что-нибудь еще о твоем учителе?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//Он не похож на других Гуру. Он отвечает всем, кто захочет с ним поговорить, но все же не стоит отвлекать его по пустякам.
};


instance NOV_1301_CAINE_CHEST(C_INFO)
{
	npc = nov_1301_caine;
	condition = nov_1301_caine_chest_condition;
	information = nov_1301_caine_chest_info;
	important = 0;
	permanent = 0;
	description = "Мне нужно достать у Кор Галома рецепт его зелья.";
};


func int nov_1301_caine_chest_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void nov_1301_caine_chest_info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Мне нужно достать у Кор Галома рецепт его зелья.
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Ты не сможешь этого сделать. Он хранится в личном сундуке Кор Галома. Не думаю, что он захочет делиться с кем-то своими тайнами.
};

