
instance DIA_NYRAS_EXIT(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 999;
	condition = dia_nyras_exit_condition;
	information = dia_nyras_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_nyras_exit_condition()
{
	return 1;
};

func void dia_nyras_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NYRAS_HALLO(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 1;
	condition = dia_nyras_hallo_condition;
	information = dia_nyras_hallo_info;
	permanent = 0;
	description = "Привет! Я попал сюда недавно.";
};


func int dia_nyras_hallo_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_nyras_hallo_info()
{
	AI_Output(other,self,"DIA_Nyras_Hallo_15_00");	//Привет! Я попал сюда недавно.
	AI_Output(self,other,"DIA_Nyras_Hallo_03_01");	//Да пребудет с тобой Спящий, брат!
};


instance DIA_NYRAS_ORT(C_INFO)
{
	npc = nov_1303_nyras;
	nr = 1;
	condition = dia_nyras_ort_condition;
	information = dia_nyras_ort_info;
	permanent = 0;
	description = "Что ты можешь рассказать мне об этом месте?";
};


func int dia_nyras_ort_condition()
{
	if(Npc_KnowsInfo(hero,dia_nyras_hallo) && (KAPITEL <= 1))
	{
		return 1;
	};
};

func void dia_nyras_ort_info()
{
	AI_Output(other,self,"DIA_Nyras_Ort_15_00");	//Что ты можешь рассказать мне об этом месте?
	AI_Output(self,other,"DIA_Nyras_Ort_03_01");	//Ну, в нашем Братстве все дела ведут Гуру. Они несут в мир учение Спящего и рассказывают послушникам о видениях нашего Учителя.
	AI_Output(self,other,"DIA_Nyras_Ort_03_02");	//Конечно, сам Учитель слишком занят, чтобы говорить с каждым послушником лично.
	AI_Output(self,other,"DIA_Nyras_Ort_03_03");	//Но иногда он выходит к нам на площадь перед Храмом и раскрывает нам волю Спящего.
	Info_ClearChoices(dia_nyras_ort);
	Info_AddChoice(dia_nyras_ort,"Расскажи мне о священных словах великого Спящего.",dia_nyras_ort_holy);
	Info_AddChoice(dia_nyras_ort,"И что говорит вам Спящий?",dia_nyras_ort_casual);
};

func void dia_nyras_ort_casual()
{
	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00");	//И что говорит вам Спящий?
	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01");	//Спящий являет свою волю в видениях, но неверный никогда не сможет этого понять!
	Info_ClearChoices(dia_nyras_ort);
};

func void dia_nyras_ort_holy()
{
	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00");	//Расскажи мне о священных словах великого Спящего.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01");	//Он сам указывает нам, что делать, чтобы обрести свободу.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02");	//Юберион говорит, что Спящий сможет открыться и нам, когда мы будем к этому готовы.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03");	//Скоро он проведет великую Церемонию, дабы Спящий явился нам. В ней примут участие наши Гуру и лучшие послушники.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04");	//Гуру Кор Галом помогает ему. Он алхимик и занимается приготовлением снадобья, с помощью которого мы войдем в транс.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05");	//Только в этом состоянии или во сне мы сможем понять волю Спящего.
	Info_ClearChoices(dia_nyras_ort);
};


instance NOV_1303_NYRAS_GREET(C_INFO)
{
	npc = nov_1303_nyras;
	condition = nov_1303_nyras_greet_condition;
	information = nov_1303_nyras_greet_info;
	important = 1;
	permanent = 0;
};


func int nov_1303_nyras_greet_condition()
{
	if(YBERION_BRINGFOCUS == LOG_RUNNING)
	{
		return 1;
	};
};

func void nov_1303_nyras_greet_info()
{
	AI_Output(self,other,"Nov_1303_Nyras_GREET_Info_03_00");	//Исчезни! Здесь тебе не место!
};


instance NOV_1303_NYRAS_LEAVE(C_INFO)
{
	npc = nov_1303_nyras;
	condition = nov_1303_nyras_leave_condition;
	information = nov_1303_nyras_leave_info;
	important = 0;
	permanent = 0;
	description = "Я ищу камень-юнитор.";
};


func int nov_1303_nyras_leave_condition()
{
	if(Npc_KnowsInfo(hero,nov_1303_nyras_greet))
	{
		return 1;
	};
};

func void nov_1303_nyras_leave_info()
{
	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01");	//Я ищу камень-юнитор
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02");	//Ты пришел слишком поздно. Я уже сам нашел его!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03");	//И я решил оставить его себе!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04");	//Ночью я слышал слова Спящего. Он сказал, что теперь я его единственный последователь!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05");	//Теперь только я буду служить Спящему. Он больше не нуждается в Гуру и Стражах!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06");	//Только я один!
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07");	//Умри!
	b_logentry(CH2_FOCUS,"Нирас сошел с ума. Он захотел оставить юнитор себе и напал на меня.");
	npc_setpermattitude(self,ATT_HOSTILE);
	AI_StopProcessInfos(self);
};

