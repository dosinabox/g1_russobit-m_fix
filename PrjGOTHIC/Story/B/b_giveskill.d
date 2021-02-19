
func int b_giveskill(var C_NPC typ,var int tal,var int new_wert,var int lp_cost)
{
	var int tal_wert;
	if(tal == NPC_TALENT_1H)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_1H);
	}
	else if(tal == NPC_TALENT_2H)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_2H);
	}
	else if(tal == NPC_TALENT_BOW)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_BOW);
	}
	else if(tal == NPC_TALENT_CROSSBOW)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_CROSSBOW);
	}
	else if(tal == NPC_TALENT_PICKLOCK)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK);
	}
	else if(tal == NPC_TALENT_PICKPOCKET)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET);
	}
	else if(tal == NPC_TALENT_MAGE)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_MAGE);
	}
	else if(tal == NPC_TALENT_SNEAK)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_SNEAK);
	}
	else if(tal == NPC_TALENT_REGENERATE)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_REGENERATE);
	}
	else if(tal == NPC_TALENT_FIREMASTER)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_FIREMASTER);
	}
	else if(tal == NPC_TALENT_ACROBAT)
	{
		tal_wert = Npc_GetTalentSkill(typ,NPC_TALENT_ACROBAT);
	};
	if((tal_wert + 1) == new_wert)
	{
		if(typ.lp >= lp_cost)
		{
			typ.lp = typ.lp - lp_cost;
			if(tal == NPC_TALENT_1H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_1H,new_wert);
				Npc_SetTalentValue(typ,NPC_TALENT_1H,Npc_GetTalentValue(typ,NPC_TALENT_1H) + 5);
				PrintScreen("�����: �������� ���������� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_2H,new_wert);
				Npc_SetTalentValue(typ,NPC_TALENT_2H,Npc_GetTalentValue(typ,NPC_TALENT_2H) + 5);
				PrintScreen("�����: �������� ��������� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_BOW,new_wert);
				Npc_SetTalentValue(typ,NPC_TALENT_BOW,Npc_GetTalentValue(typ,NPC_TALENT_BOW) + 15);
				PrintScreen("�����: �������� �� ����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_CROSSBOW,new_wert);
				Npc_SetTalentValue(typ,NPC_TALENT_CROSSBOW,Npc_GetTalentValue(typ,NPC_TALENT_CROSSBOW) + 20);
				PrintScreen("�����: �������� �� ��������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKLOCK,new_wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK) == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,Npc_GetTalentValue(typ,NPC_TALENT_PICKLOCK) - 20);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK) == 2)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,Npc_GetTalentValue(typ,NPC_TALENT_PICKLOCK) - 70);
				};
				PrintScreen("�����: ����� ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKPOCKET,new_wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET) == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,Npc_GetTalentValue(typ,NPC_TALENT_PICKPOCKET) - 50);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET) == 2)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,Npc_GetTalentValue(typ,NPC_TALENT_PICKPOCKET) - 40);
				};
				PrintScreen("�����: ���������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_MAGE,new_wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 1)
				{
					PrintScreen("�����: ������ ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 2)
				{
					PrintScreen("�����: ������ ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 3)
				{
					PrintScreen("�����: ������ ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 4)
				{
					PrintScreen("�����: ��������� ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 5)
				{
					PrintScreen("�����: ����� ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else
				{
					PrintScreen("�����: ������ ���� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_SNEAK,new_wert);
				PrintScreen("�����: �������������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_REGENERATE)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_REGENERATE,new_wert);
				PrintScreen("��������� ������ �����������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_FIREMASTER)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_FIREMASTER,new_wert);
				PrintScreen("�����: ������ ����� ����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_ACROBAT,new_wert);
				PrintScreen("�����: ����������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else
			{
				return 0;
			};
		}
		else
		{
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			b_say(self,other,"$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else if(tal_wert >= new_wert)
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	}
	else if((tal_wert + 1) < new_wert)
	{
		b_say(self,other,"$NOLEARNYOUALREADYKNOW");
	};
	return 0;
};

