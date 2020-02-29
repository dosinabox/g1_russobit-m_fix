
var int mud_nerve;
const int NERVESEC = 30;
var int mud_nerverealized;

instance DIA_MUD_EXIT(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_exit_condition;
	information = dia_mud_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_mud_exit_condition()
{
	return 1;
};

func void dia_mud_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MUD_FIRSTEXIT(C_INFO)
{
	npc = vlk_574_mud;
	nr = 1;
	condition = dia_mud_firstexit_condition;
	information = dia_mud_firstexit_info;
	permanent = 0;
	important = 1;
};


func int dia_mud_firstexit_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_mud_firstexit_info()
{
	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_00");	//Эй! Недавно здесь, а? Я тебя ни разу не видел.
	AI_Output(self,other,"DIA_Mud_FirstEXIT_07_01");	//Ты не против, если я пройдусь с тобой немного? Тебе же сейчас нужен друг, да?
	Info_ClearChoices(dia_mud_firstexit);
	Info_AddChoice(dia_mud_firstexit,"Не приставай ко мне!",dia_mud_firstexit_verpiss);
	Info_AddChoice(dia_mud_firstexit,"Как хочешь. Пойдем!",dia_mud_firstexit_komm);
};

func void dia_mud_firstexit_verpiss()
{
	AI_Output(other,self,"DIA_Mud_FirstEXIT_Verpiss_15_00");	//Не приставай ко мне!
	AI_Output(self,other,"DIA_Mud_FirstEXIT_Verpiss_07_01");	//А, понимаю, ты сегодня не в духе. Но, думаю, будет лучше, если я пойду с тобой...
	Info_ClearChoices(dia_mud_firstexit);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};

func void dia_mud_firstexit_komm()
{
	AI_Output(other,self,"DIA_Mud_FirstEXIT_Komm_15_00");	//Как хочешь. Пойдем!
	AI_Output(self,other,"DIA_Mud_FirstEXIT_Komm_07_01");	//Как хорошо! Мы сможем немного поговорить по дороге.
	Info_ClearChoices(dia_mud_firstexit);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_MUD_SHUTUP(C_INFO)
{
	npc = vlk_574_mud;
	nr = 3;
	condition = dia_mud_shutup_condition;
	information = dia_mud_shutup_info;
	permanent = 1;
	description = "Ты можешь хоть немного помолчать?";
};


func int dia_mud_shutup_condition()
{
	if(MUD_NERVEREALIZED == TRUE)
	{
		return 1;
	};
};

func void dia_mud_shutup_info()
{
	AI_Output(other,self,"DIA_Mud_ShutUp_15_00");	//Ты можешь хоть немного помолчать?
	AI_Output(self,other,"DIA_Mud_ShutUp_07_01");	//Как скажешь.
	Npc_SetRefuseTalk(self,300);
};


instance DIA_MUD_GETLOST(C_INFO)
{
	npc = vlk_574_mud;
	nr = 2;
	condition = dia_mud_getlost_condition;
	information = dia_mud_getlost_info;
	permanent = 1;
	description = "Уйди от меня!";
};


func int dia_mud_getlost_condition()
{
	if(Npc_KnowsInfo(hero,dia_mud_firstexit) && !Npc_KnowsInfo(hero,dia_mud_defeated))
	{
		return 1;
	};
};

func void dia_mud_getlost_info()
{
	AI_Output(other,self,"DIA_Mud_GetLost_15_00");	//Уйди от меня!
	AI_Output(self,other,"DIA_Mud_GetLost_07_01");	//Хочешь побыть один? Понимаю... Ну, я буду где-нибудь поблизости, если что...
};


instance DIA_MUD_DEFEATED(C_INFO)
{
	npc = vlk_574_mud;
	nr = 1;
	condition = dia_mud_defeated_condition;
	information = dia_mud_defeated_info;
	permanent = 0;
	important = 1;
};


func int dia_mud_defeated_condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void dia_mud_defeated_info()
{
	AI_Output(self,other,"DIA_Mud_GetLost_07_00");	//Эй, ты же ударил меня! За что?
	AI_Output(other,self,"DIA_Mud_GetLost_15_01");	//Если ты от меня не отстанешь, я ударю тебя еще больнее!
	AI_Output(self,other,"DIA_Mud_GetLost_07_02");	//Да ты ненормальный! Даже не подходи ко мне, я тебе больше не друг.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MUD_NERVE_0(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_0_condition;
	information = dia_mud_nerve_0_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_0_condition()
{
	if((MUD_NERVE == 0) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_0_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_0_07_00");	//Скажи, куда мы идем? Или это сюрприз? Знаешь, я люблю сюрпризы.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 1;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_1(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_1_condition;
	information = dia_mud_nerve_1_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_1_condition()
{
	if((MUD_NERVE == 1) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_1_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_1_07_00");	//Я не буду тебе мешать, не волнуйся. Я просто пройдусь с тобой немного.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 2;
	MUD_NERVEREALIZED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_2(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_2_condition;
	information = dia_mud_nerve_2_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_2_condition()
{
	if((MUD_NERVE == 2) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_2_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_2_07_00");	//Надеюсь, ты знаешь, куда мы идем. У тебя есть какой-то план, да?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 3;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_3(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_3_condition;
	information = dia_mud_nerve_3_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_3_condition()
{
	if((MUD_NERVE == 3) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_3_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_3_07_00");	//Хочешь найти тихое местечко? Где мы сможем поговорить? Я прав?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 4;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_4(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_4_condition;
	information = dia_mud_nerve_4_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_4_condition()
{
	if((MUD_NERVE == 4) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_4_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_4_07_00");	//Тебе не кажется, что мы ходим кругами? Ты ведь так и не сказал, куда направляешься...
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 5;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_5(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_5_condition;
	information = dia_mud_nerve_5_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_5_condition()
{
	if((MUD_NERVE == 5) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_5_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_5_07_00");	//С тобой так интересно. Как хорошо, что ты взял меня с собой. Можем, нам стоит чаще ходить куда-нибудь вместе?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 6;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_6(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_6_condition;
	information = dia_mud_nerve_6_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_6_condition()
{
	if((MUD_NERVE == 6) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_6_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_6_07_00");	//Я уже так привык к тебе. Мы ведь хорошие друзья, правда? Ты тоже так думаешь? А где ты ночуешь? Можешь оставаться у меня, я не против.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 7;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_7(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_7_condition;
	information = dia_mud_nerve_7_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_7_condition()
{
	if((MUD_NERVE == 7) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_7_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_7_07_00");	//Скажи, а за что тебя сюда отправили? Тебе тоже нравятся животные? Да, не все их любят. Из-за этого я и попал сюда.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 8;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_8(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_8_condition;
	information = dia_mud_nerve_8_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_8_condition()
{
	if((MUD_NERVE == 8) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_8_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_8_07_00");	//В колонии есть люди, которые всегда стараются меня избить. Это ужасные типы из Нового лагеря, настоящие варвары. В следующий раз я скажу им, что ты мой друг. Это их, конечно, напугает.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 9;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_9(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_9_condition;
	information = dia_mud_nerve_9_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_9_condition()
{
	if((MUD_NERVE == 9) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_9_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_9_07_00");	//Эти разбойники из Нового лагеря дар речи потеряют, если я скажу им, что теперь у меня есть защитник. Да они от страха наделают в штаны. Вот будет весело. Убийство для них дело обычное, но теперь они дважды подумают.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 10;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_10(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_10_condition;
	information = dia_mud_nerve_10_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_10_condition()
{
	if((MUD_NERVE == 10) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_10_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_10_07_00");	//Знаешь, что? Я помогу тебе. Я скажу, что тебе можно доверять. Тогда тебя примут в лагерь, и мы сможем видеться хоть каждый день.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 11;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_11(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_11_condition;
	information = dia_mud_nerve_11_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_11_condition()
{
	if((MUD_NERVE == 11) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_11_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_11_07_00");	//Многие считают меня ненормальным. Но ведь такой, как ты, не стал бы разговаривать с ненормальным, верно? Они узнают, что ты мой друг, и поймут, что были неправы.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 12;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_12(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_12_condition;
	information = dia_mud_nerve_12_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_12_condition()
{
	if((MUD_NERVE == 12) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_12_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_12_07_00");	//Ты мой лучший друг. До этого никто не хотел со мной разговаривать. Они прогоняли меня. Спасибо, что ты этого не делаешь.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 13;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_13(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_13_condition;
	information = dia_mud_nerve_13_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_13_condition()
{
	if((MUD_NERVE == 13) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_13_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_13_07_00");	//Слушай, мы уже так долго ходим. Может лучше поискать какой-нибудь тихий уголок и немного отдохнуть?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 14;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_14(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_14_condition;
	information = dia_mud_nerve_14_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_14_condition()
{
	if((MUD_NERVE == 14) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_14_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_14_07_00");	//Ты заменил мне старшего брата. У меня ведь никогда не было старшего брата. Да и младшего не было. Мои родители не хотели возиться с детьми. Я уверен, что им было тяжело со мной.
	AI_Output(other,self,"DIA_Mud_Nerve_14_15_01");	//Думаю, ты прав.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 15;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_15(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_15_condition;
	information = dia_mud_nerve_15_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_15_condition()
{
	if((MUD_NERVE == 15) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_15_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_15_07_00");	//А где ты жил до этого? Наверное, тебе тоже всегда хотелось найти человека, который тебя понимает. Сам из Хориниса. Ты был там когда-нибудь? Впрочем, это не так важно.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 16;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_16(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_16_condition;
	information = dia_mud_nerve_16_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_16_condition()
{
	if((MUD_NERVE == 16) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_16_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_16_07_00");	//Я уже проголодался. Я считаю себя твоим гостем в некотором роде, поэтому было бы просто замечательно, если бы ты меня угостил, как подобает хорошему хозяину. Это сказали мне мои друзья из Хориниса. Они хорошо относились ко мне.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 17;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_17(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_17_condition;
	information = dia_mud_nerve_17_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_17_condition()
{
	if((MUD_NERVE == 17) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_17_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_17_07_00");	//Интересно, хоть кто-нибудь из внешнего мира придет сюда просто так? Мне кажется, не придет, ведь потом он не сможет вернуться, да?
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 18;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_18(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_18_condition;
	information = dia_mud_nerve_18_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_18_condition()
{
	if((MUD_NERVE == 18) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_18_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_18_07_00");	//Теперь, когда мы с тобой, мы покажем всяким невежам, как следует себя вести. Они уже несколько лет не дают мне покоя. Пусть только попробуют напасть на меня еще раз, я им...
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 19;
	AI_StopProcessInfos(self);
};


instance DIA_MUD_NERVE_19(C_INFO)
{
	npc = vlk_574_mud;
	nr = 999;
	condition = dia_mud_nerve_19_condition;
	information = dia_mud_nerve_19_info;
	permanent = 1;
	important = 1;
};


func int dia_mud_nerve_19_condition()
{
	if((MUD_NERVE == 19) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_mud_nerve_19_info()
{
	AI_Output(self,other,"DIA_Mud_Nerve_19_07_00");	//Вместе мы непобедимы. Мы сможем даже захватить Старый лагерь. Да мы вдвоем в два счета разделаемся с Баронами. А что, хорошая идея, ее стоит обдумать.
	Npc_SetRefuseTalk(self,NERVESEC);
	MUD_NERVE = 0;
	AI_StopProcessInfos(self);
};

