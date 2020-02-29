
const int TA_IT_NONE = 0;
const int TA_IT_APPLE = 1;
const int TA_IT_LOAF = 2;
const int TA_IT_CHEESE = 3;
const int TA_IT_BEER = 4;
const int TA_IT_MEAT = 5;
const int TA_IT_SOUP = 6;
const int TA_IT_RICE = 7;
const int TA_IT_JOINT = 8;
const int TA_IT_BOOZE = 9;
const int TA_IT_WINE = 10;
const int TA_IT_SMALLTALK_ACTIVE = 11;
const int TA_IT_SMALLTALK_PASSIVE = 12;
const int TA_IT_SMALLTALK = 13;
const int TA_IT_FORCEDSMALLTALK = 14;

func void b_initarmor()
{
	var C_ITEM myarmor;
	printdebugnpc(PD_TA_DETAIL,"B_InitArmor");
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l) || Hlp_IsItem(myarmor,org_armor_l) || Hlp_IsItem(myarmor,org_armor_m) || Hlp_IsItem(myarmor,sld_armor_m))
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m) || Hlp_IsItem(myarmor,org_armor_h) || Hlp_IsItem(myarmor,sld_armor_h))
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
	};
};

func void b_playarmor()
{
	var int guardreaktion;
	var C_ITEM myarmor;
	printdebugnpc(PD_TA_DETAIL,"B_PlayArmor");
	guardreaktion = Hlp_Random(100);
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l) || Hlp_IsItem(myarmor,org_armor_l) || Hlp_IsItem(myarmor,org_armor_m) || Hlp_IsItem(myarmor,sld_armor_m))
	{
		if(guardreaktion >= 90)
		{
			AI_PlayAni(self,"T_LGUARD_2_STAND");
			AI_PlayAni(self,"T_STAND_2_LGUARD");
		}
		else if(guardreaktion >= 80)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");
		}
		else if(guardreaktion >= 70)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");
		}
		else if(guardreaktion >= 60)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");
		};
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m) || Hlp_IsItem(myarmor,org_armor_h) || Hlp_IsItem(myarmor,sld_armor_h))
	{
		guardreaktion = Hlp_Random(100);
		if(guardreaktion >= 95)
		{
			AI_PlayAni(self,"T_HGUARD_2_STAND");
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		else if(guardreaktion >= 90)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
	};
};

func void b_exitarmor()
{
	var C_ITEM myarmor;
	printdebugnpc(PD_TA_DETAIL,"B_ExitArmor");
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l) || Hlp_IsItem(myarmor,org_armor_l) || Hlp_IsItem(myarmor,org_armor_m) || Hlp_IsItem(myarmor,sld_armor_m))
	{
		AI_PlayAni(self,"T_LGUARD_2_STAND");
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m) || Hlp_IsItem(myarmor,org_armor_h) || Hlp_IsItem(myarmor,sld_armor_h))
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};

func void b_eatsmall(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_EatSmall");
	if((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 20))
	{
		AI_PlayAniBS(self,"T_FOOD_RANDOM_1",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_eathuge(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_EatHuge");
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAniBS(self,"T_FOODHUGE_RANDOM_1",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_throwapple(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ThrowApple");
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAniBS(self,"T_FOOD_RANDOM_2",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_drinkbottle(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_DrinkBottle");
	if((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 30))
	{
		AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_wipemouth(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_WipeMouth");
	if((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 50))
	{
		AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_lookbottle(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_LookBottle");
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAniBS(self,"T_POTION_RANDOM_3",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_drawjoint(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_DrawJoint");
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAniBS(self,"T_JOINT_RANDOM_1",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_eatmeat(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_EatMeat");
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAniBS(self,"T_MEAT_RANDOM_1",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_eatrice(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_EatRice");
	if((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(1) == 1))
	{
		AI_PlayAniBS(self,"T_RICE_RANDOM_1",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	}
	else
	{
		AI_PlayAniBS(self,"T_RICE_RANDOM_2",BS_ITEMINTERACT);
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_ITEMFREQ] = Hlp_Random(5) + 5;
	};
};

func void b_playitemrandoms(var C_NPC self)
{
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		b_eatsmall(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF)
	{
		b_eathuge(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE)
	{
		b_eathuge(self);
	};
	if((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		b_drinkbottle(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		b_drawjoint(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT)
	{
		b_eatmeat(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_RICE)
	{
		b_eatrice(self);
	};
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		b_throwapple(self);
	};
	if((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE))
	{
		b_lookbottle(self);
	};
	if((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		b_wipemouth(self);
	};
};

func void b_chooseapple(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseApple");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_APPLE;
	if(Npc_HasItems(self,itfoapple) == 0)
	{
		CreateInvItem(self,itfoapple);
	};
	AI_UseItemToState(self,itfoapple,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_chooseloaf(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseLoaf");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_LOAF;
	if(Npc_HasItems(self,itfoloaf) == 0)
	{
		CreateInvItem(self,itfoloaf);
	};
	AI_UseItemToState(self,itfoloaf,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosecheese(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseCheese");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_CHEESE;
	if(Npc_HasItems(self,itfocheese) == 0)
	{
		CreateInvItem(self,itfocheese);
	};
	AI_UseItemToState(self,itfocheese,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosebeer(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseBeer");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_BEER;
	if(Npc_HasItems(self,itfobeer) == 0)
	{
		CreateInvItem(self,itfobeer);
	};
	AI_UseItemToState(self,itfobeer,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosemeat(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseMeat");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_MEAT;
	if(Npc_HasItems(self,itfomutton) == 0)
	{
		CreateInvItem(self,itfomutton);
	};
	AI_UseItemToState(self,itfomutton,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosesoup(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseSoup");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_SOUP;
	if(Npc_HasItems(self,itfosoup) == 0)
	{
		CreateInvItem(self,itfosoup);
	};
	AI_UseItemToState(self,itfosoup,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_chooserice(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseRice");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_RICE;
	if(Npc_HasItems(self,itforice) == 0)
	{
		CreateInvItem(self,itforice);
	};
	AI_UseItemToState(self,itforice,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosejoint(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseJoint");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_JOINT;
	if(Npc_HasItems(self,itmijoint_1) == 0)
	{
		CreateInvItem(self,itmijoint_1);
	};
	AI_UseItemToState(self,itmijoint_1,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosebooze(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseBooze");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_BOOZE;
	if(Npc_HasItems(self,itfobooze) == 0)
	{
		CreateInvItem(self,itfobooze);
	};
	AI_UseItemToState(self,itfobooze,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_choosewine(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ChooseWine");
	self.aivar[AIV_ITEMSTATUS] = TA_IT_WINE;
	if(Npc_HasItems(self,itfowine) == 0)
	{
		CreateInvItem(self,itfowine);
	};
	AI_UseItemToState(self,itfowine,0);
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void b_pee(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_Pee");
	if(Wld_IsFPAvailable(self,"PEE"))
	{
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"PEE");
		AI_PlayAni(self,"T_PEE");
		AI_ContinueRoutine(self);
	};
};

func void b_bored(var C_NPC self)
{
	var int choice;
	printdebugnpc(PD_TA_DETAIL,"B_Bored");
	choice = Hlp_Random(100);
	if(choice < 20)
	{
		AI_PlayAni(self,"T_BORINGKICK");
	}
	else if(choice < 30)
	{
		AI_PlayAni(self,"R_SCRATCHLSHOULDER");
	}
	else if(choice < 40)
	{
		AI_PlayAni(self,"R_SCRATCHRSHOULDER");
	}
	else if(choice < 60)
	{
		AI_PlayAni(self,"R_SCRATCHEGG");
	}
	else if(choice < 80)
	{
		AI_PlayAni(self,"R_SCRATCHHEAD");
	}
	else if(choice < 100)
	{
		AI_PlayAni(self,"R_LEGSHAKE");
	};
	AI_Wait(self,1);
};

func void b_resetiterator(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ResetIterator");
	if(self.aivar[AIV_GUARDITERATOR] >= 5000)
	{
		self.aivar[AIV_GUARDITERATOR] = 0;
		self.aivar[AIV_GUARDMEMORY] = 0;
	};
	self.aivar[AIV_GUARDITERATOR] += 1;
};

func void b_clearitem(var C_NPC self)
{
	printdebugnpc(PD_TA_DETAIL,"B_ClearItem");
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		AI_UseItemToState(self,itfoapple,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF)
	{
		AI_UseItemToState(self,itfoloaf,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE)
	{
		AI_UseItemToState(self,itfocheese,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER)
	{
		AI_UseItemToState(self,itfobeer,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT)
	{
		AI_UseItemToState(self,itfomutton,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_SOUP)
	{
		AI_UseItemToState(self,itfosoup,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_RICE)
	{
		AI_UseItemToState(self,itforice,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		AI_UseItemToState(self,itmijoint_1,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE)
	{
		AI_UseItemToState(self,itfobooze,-1);
	}
	else if(self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE)
	{
		AI_UseItemToState(self,itfowine,-1);
	};
	self.aivar[AIV_ITEMSTATUS] = TA_IT_NONE;
};

func void b_startusemob(var C_NPC slf,var string mobname)
{
	printdebugnpc(PD_TA_DETAIL,"B_StartUseMob");
	if(!c_bodystatecontains(slf,BS_MOBINTERACT))
	{
		AI_SetWalkMode(slf,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(slf),slf.wp) == 0)
		{
			AI_GotoWP(slf,slf.wp);
		};
		AI_UseMob(slf,mobname,1);
	};
};

func void b_stopusemob(var C_NPC slf,var string mobname)
{
	printdebugnpc(PD_TA_DETAIL,"B_StopUseMob");
	AI_UseMob(slf,mobname,-1);
};

