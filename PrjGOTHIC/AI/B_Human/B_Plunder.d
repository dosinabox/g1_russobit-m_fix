
func void b_transferitems(var int amount)
{
	var int transferitem;
	printdebugnpc(PD_ZS_CHECK,"...B_TransferItem");
	transferitem = Hlp_GetInstanceID(item);
	b_giveinvitems(other,self,transferitem,amount);
	if(item.munition == itamarrow)
	{
		CreateInvItems(self,itamarrow,20);
	};
	if(item.munition == itambolt)
	{
		CreateInvItems(self,itambolt,20);
	};
};

func int b_checkitem(var int category,var int slot)
{
	var string printtext;
	var int count;
	printdebugnpc(PD_ZS_CHECK,"B_CheckItem");
	printtext = IntToString(slot);
	if(category == INV_WEAPON)
	{
		printtext = ConcatStrings("...found INV_WEAPON_",printtext);
	}
	else if(category == INV_ARMOR)
	{
		printtext = ConcatStrings("...found INV_ARMOR_",printtext);
	}
	else if(category == INV_RUNE)
	{
		printtext = ConcatStrings("...found INV_RUNE_",printtext);
	}
	else if(category == INV_FOOD)
	{
		printtext = ConcatStrings("...found INV_FOOD_",printtext);
	}
	else if(category == INV_DOC)
	{
		printtext = ConcatStrings("...found INV_DOC_",printtext);
	}
	else if(category == INV_MISC)
	{
		printtext = ConcatStrings("...found INV_MISC_",printtext);
	}
	else
	{
		printtext = ConcatStrings("...found unknown category #",printtext);
	};
	count = Npc_GetInvItemBySlot(other,category,slot);
	printdebugnpc(PD_ZS_DETAIL,IntToString(count));
	if(count > 0)
	{
		printdebugnpc(PD_ZS_CHECK,printtext);
		//if(Hlp_IsItem(item,itminugget))
		//{
		//	//b_transferitems(count / 2);
		//	return TRUE;
		//};
		if(Npc_OwnedByNpc(item,self))
		{
			b_transferitems(1);
			return TRUE;
		};
	};
	if(Npc_HasItems(other,itminugget) > 0)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_plunder()
{
	var string stolennuggettext;
	var int amountplundered;
	var int stolennuggetamount;
	printdebugnpc(PD_ZS_CHECK,"B_Plunder");
	if(Npc_HasItems(other,itminugget) > 0)
	{
		stolennuggettext = ConcatStrings("Отобрано руды: ",IntToString((Npc_HasItems(other,itminugget) / 2)));
		if(Npc_HasItems(other,itminugget) > 1)
		{
			PrintScreen(stolennuggettext,-1,37,"FONT_OLD_10_WHITE.TGA",3);
			b_giveinvitems(other,self,itminugget,(Npc_HasItems(other,itminugget) / 2));
		}
		else if(Npc_HasItems(other,itminugget) == 1)
		{
			PrintScreen("Отобрано руды: 1",-1,37,"FONT_OLD_10_WHITE.TGA",3);
			b_giveinvitems(other,self,itminugget,1);
		};
	};
	amountplundered = 0;
	b_checkitem(INV_WEAPON,1);
	b_checkitem(INV_WEAPON,2);
	b_checkitem(INV_WEAPON,3);
	b_checkitem(INV_WEAPON,4);
	b_checkitem(INV_WEAPON,5);
	b_checkitem(INV_WEAPON,6);
	if(b_checkitem(INV_MISC,1))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,2))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,3))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,4))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,5))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,6))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,7))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,8))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,9))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,10))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,11))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,12))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,13))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,14))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,15))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,16))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,17))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,18))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,19))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,20))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,21))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,22))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,23))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,24))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,25))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,26))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,27))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,28))
	{
		amountplundered = amountplundered + 1;
	};
	if(b_checkitem(INV_MISC,29))
	{
		amountplundered = amountplundered + 1;
	};
	printdebugint(PD_ZS_CHECK,"...Anzahl geplьnderter Items: ",amountplundered);
	return amountplundered;
};

