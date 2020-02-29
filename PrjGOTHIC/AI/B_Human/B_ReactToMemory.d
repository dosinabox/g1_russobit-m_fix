
func void b_reacttomemory()
{
	var int murdernews;
	var C_NPC murdernews_victim;
	var C_NPC murdernews_offender;
	var int defeat_news;
	var int self_guild;
	var int defeat_news_victim_guild;
	var int defeat_news_offender_guild;
	var int other_guild;
	var C_NPC defeat_news_offender;
	var C_NPC defeat_news_victim;
	var int theft_news;
	var C_NPC theft_news_victim;
	var C_NPC theft_news_offender;
	printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory");
	murdernews = Npc_HasNews(self,NEWS_MURDER,NULL,NULL);
	if(murdernews > 0)
	{
		murdernews_victim = Npc_GetNewsVictim(self,murdernews);
		murdernews_offender = Npc_GetNewsOffender(self,murdernews);
		printdebugnpc(PD_ZS_CHECK,"B_ReactToMemory // Murder_News");
		if(b_comparenpcinstance(murdernews_offender,other))
		{
			printdebugnpc(PD_ZS_CHECK,"B_ReactToMemory // Murder_News// SC Offender");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetPermAttitude(self,other) == ATT_NEUTRAL))
			{
				printdebugnpc(PD_ZS_CHECK,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC");
				if(Hlp_IsValidNpc(murdernews_victim))
				{
					printdebugnpc(PD_ZS_CHECK,"B_ReactToMemory // Murder_News// SC Offender es gibt ein victim");
				};
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile");
				if(murdernews_victim.guild == GIL_EBR)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile// EBR");
					b_say(self,other,"$YOUKILLEDEBR");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_GUR)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // GUR");
					b_say(self,other,"$YOUKILLEDGUR");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if((murdernews_victim.guild == GIL_KDW) || (murdernews_victim.guild == GIL_KDF))
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // KDF");
					b_say(self,other,"$YOUKILLEDMAGE");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_GRD && KAPITEL < 4)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // GRD");
					b_say(self,other,"$YOUKILLEDOCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_STT && KAPITEL < 4)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // STT");
					b_say(self,other,"$YOUKILLEDOCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_VLK && KAPITEL < 4)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // VLK");
					b_say(self,other,"$YOUKILLEDOCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_SLD)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // SLD");
					b_say(self,other,"$YOUKILLEDNCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_ORG)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // ORG");
					b_say(self,other,"$YOUKILLEDNCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_BAU)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // BAU");
					b_say(self,other,"$YOUKILLEDNCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_SFB)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile //SFB");
					b_say(self,other,"$YOUKILLEDNCFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_NOV)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // NOV");
					b_say(self,other,"$YOUKILLEDPSIFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
				if(murdernews_victim.guild == GIL_TPL)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // TPL");
					b_say(self,other,"$YOUKILLEDPSIFOLK");
					Npc_DeleteNews(self,murdernews);
					return;
				};
			};
			if((Npc_GetPermAttitude(self,other) == ATT_ANGRY) && (Npc_GetPermAttitude(self,murdernews_victim) == ATT_FRIENDLY))
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Offender(angry) victim(Friendly)");
				b_say(self,other,"$YOUKILLEDMYFRIEND");
				Npc_DeleteNews(self,murdernews);
				return;
			};
		}
		else if(b_comparenpcinstance(other,murdernews_victim))
		{
		}
		else
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetPermAttitude(self,other) == ATT_NEUTRAL))
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender and ok guy");
				if(Npc_GetPermAttitude(self,murdernews_victim) == ATT_FRIENDLY)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender and ok guy victim was a friend");
					b_say(self,other,"$THEYKILLEDMYFRIEND");
					Npc_DeleteNews(self,murdernews);
					return;
				};
			};
		};
		Npc_DeleteNews(self,murdernews);
	};
	if(self.aivar[AIV_BEENATTACKED] == 1)
	{
		if(Npc_GetPermAttitude(self,other) == ATT_ANGRY)
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Attack_News SC offender victim(Angry) is me");
			b_say(self,other,"$LOOKINGFORTROUBLEAGAIN");
		};
		if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetPermAttitude(self,other) == ATT_NEUTRAL))
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Attack_News SC offender victim(friend/neutr) is me");
			b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
		};
		self.aivar[AIV_BEENATTACKED] = 0;
		return;
	};
	defeat_news = Npc_HasNews(self,NEWS_DEFEAT,NULL,NULL);
	if(defeat_news > 0)
	{
		defeat_news_victim = Npc_GetNewsVictim(self,defeat_news);
		defeat_news_offender = Npc_GetNewsOffender(self,defeat_news);
		self_guild = self.guild;
		defeat_news_victim_guild = defeat_news_victim.guild;
		defeat_news_offender_guild = defeat_news_offender.guild;
		other_guild = other.guild;
		printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News");
		if(b_comparenpcinstance(other,defeat_news_offender))
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender");
			if(b_comparenpcinstance(self,defeat_news_victim))
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender// victim is me");
				if(Npc_GetPermAttitude(self,defeat_news_offender) == ATT_ANGRY)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC(angry) offender// victim is me");
					b_say(self,other,"$LookingForTroubleAgain");
					Npc_DeleteNews(self,defeat_news);
					return;
				};
				if((Npc_GetPermAttitude(self,defeat_news_offender) == ATT_NEUTRAL) || (Npc_GetPermAttitude(self,defeat_news_offender) == ATT_FRIENDLY))
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC(friend/neutr) offender// victim is me");
					b_say(self,other,"$YOUDEFEATEDMEWELL");
					Npc_DeleteNews(self,defeat_news);
					return;
				};
			}
			else if(!b_comparenpcinstance(defeat_news_victim,other))
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender// victim is an other");
				if(Npc_GetPermAttitude(self,defeat_news_offender) == ATT_ANGRY)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (angry) offender// victim is an other");
					if(Wld_GetGuildAttitude(self_guild,defeat_news_victim_guild) == ATT_FRIENDLY)
					{
						printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender //victimguild (friendly)");
						if(defeat_news_victim_guild == GIL_EBR)
						{
							printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender // victimguild (friendly) EBR");
							b_say(self,other,"$SUCKERDEFEATEDEBR");
							Npc_DeleteNews(self,defeat_news);
						}
						else if(defeat_news_victim_guild == GIL_GUR)
						{
							printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender //victimguild (friendly) GUR");
							b_say(self,other,"$SUCKERDEFEATEDGUR");
							Npc_DeleteNews(self,defeat_news);
							return;
						}
						else if((defeat_news_victim_guild == GIL_KDF) || (defeat_news_victim_guild == GIL_KDW))
						{
							printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender// victimguild (friendly) MAGE");
							b_say(self,other,"SUCKERDEFEATEDMAGE");
							Npc_DeleteNews(self,defeat_news);
							return;
						}
						else if((self_guild == GIL_GRD) && ((defeat_news_victim_guild == GIL_VLK) || (defeat_news_victim_guild == GIL_STT)))
						{
							b_say(self,other,"$SUCKERDEFEATEDVLK_GUARD");
							Npc_DeleteNews(self,defeat_news);
							return;
						}
						else if((self_guild == GIL_TPL) && (defeat_news_victim_guild == GIL_NOV))
						{
							b_say(self,other,"$SUCKERDEFEATEDNOV_GUARD");
							Npc_DeleteNews(self,defeat_news);
							return;
						}
						else
						{
							printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender// victimguild (friendly) all others");
							if((Wld_GetGuildAttitude(self_guild,defeat_news_offender_guild) == ATT_ANGRY) || (Wld_GetGuildAttitude(self_guild,defeat_news_offender_guild) == ATT_NEUTRAL))
							{
								printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry / guild-angry/neutral)  offender //victimguild (friendly) all others");
								b_say(self,other,"$YOUATTACKEDMYFRIEND");
								Npc_DeleteNews(self,defeat_news);
								return;
							};
						};
					};
				}
				else if((Npc_GetPermAttitude(self,defeat_news_offender) == ATT_FRIENDLY) || (Npc_GetPermAttitude(self,defeat_news_offender) == ATT_NEUTRAL))
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other");
					if((defeat_news_victim_guild == GIL_EBR) && (self_guild != GIL_EBR))
					{
						printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other EBR me not EBR");
						b_say(self,other,"$YOUATTACKEDEBR");
						Npc_DeleteNews(self,defeat_news);
						return;
					}
					else if((defeat_news_victim_guild == GIL_GUR) && (self_guild != GIL_GUR))
					{
						printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other GUR me not GUR");
						b_say(self,other,"YOUATTACKEDGUR");
						Npc_DeleteNews(self,defeat_news);
						return;
					}
					else if((defeat_news_victim_guild == GIL_KDW) || (defeat_news_victim_guild == GIL_KDF))
					{
						printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other MAGE me not MAGE");
						b_say(self,other,"$YOUATTACKEDMAGE");
						Npc_DeleteNews(self,defeat_news);
						return;
					}
					else
					{
						if(((defeat_news_victim_guild == GIL_VLK) || (defeat_news_victim_guild == GIL_STT)) && (self_guild == GIL_GRD))
						{
							b_say(self,other,"$YOUDFEATEDVLK_GUARD");
							Npc_DeleteNews(self,defeat_news);
							return;
						};
						if((defeat_news_victim_guild == GIL_NOV) && (self_guild == GIL_TPL))
						{
							b_say(self,other,"$YOUDEFEATEDNOV_GUARD");
							Npc_DeleteNews(self,defeat_news);
							return;
						};
						printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is protected by Guards");
						if(c_npcisguard(self))
						{
							if(c_npcisguard(defeat_news_victim))
							{
								b_say(self,other,"$YouDefeatedMyComrade");
								Npc_DeleteNews(self,defeat_news);
								return;
							};
							if(Wld_GetGuildAttitude(self_guild,defeat_news_victim_guild) == ATT_FRIENDLY)
							{
								if(((defeat_news_victim_guild == GIL_VLK) || (defeat_news_victim_guild == GIL_STT)) && (self_guild == GIL_GRD))
								{
									b_say(self,other,"$YOUDFEATEDVLK_GUARD");
									Npc_DeleteNews(self,defeat_news);
									return;
								};
								if((defeat_news_victim_guild == GIL_NOV) && (self_guild == GIL_TPL))
								{
									b_say(self,other,"$YOUDEFEATEDNOV_GUARD");
									Npc_DeleteNews(self,defeat_news);
									return;
								};
							};
						};
					};
				};
			};
		}
		else
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player");
			if(b_comparenpcinstance(self,defeat_news_offender))
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player/ me is aggressor");
				b_say(self,other,"$LOOKINGFORTROUBLEAGAIN");
				Npc_DeleteNews(self,defeat_news);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player/ me is NOT aggressor");
				if(Npc_GetPermAttitude(self,defeat_news_victim) == ATT_ANGRY)
				{
					printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player(angry)/ me is NOT aggressor");
					b_say(self,other,"$SUCKERGOTSOME");
					Npc_DeleteNews(self,defeat_news);
					return;
				};
			};
		};
		Npc_DeleteNews(self,defeat_news);
	};
	theft_news = Npc_HasNews(self,NEWS_THEFT,NULL,NULL);
	if(theft_news > 0)
	{
		theft_news_victim = Npc_GetNewsVictim(self,theft_news);
		theft_news_offender = Npc_GetNewsOffender(self,theft_news);
		if(b_comparenpcinstance(other,theft_news_offender))
		{
			printdebugnpc(PD_ZS_FRAME,"B_ReactToMemory // Theft_News // SC is Thief");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetPermAttitude(self,other) == ATT_NEUTRAL))
			{
				if((theft_news_victim.guild == GIL_EBR) && (self.guild != GIL_EBR))
				{
					b_say(self,other,"$YOUSTOLEFROMEBR");
					Npc_DeleteNews(self,theft_news);
					return;
				};
				if((theft_news_victim.guild == GIL_GUR) && (self.guild != GIL_GUR))
				{
					b_say(self,other,"$YOUSTOLEFROMGUR");
					Npc_DeleteNews(self,theft_news);
					return;
				};
				if((theft_news_victim.guild == GIL_KDW) || (theft_news_victim.guild == GIL_KDF))
				{
					b_say(self,other,"$YOUSTOLEFROMMAGE");
					Npc_DeleteNews(self,theft_news);
					return;
				};
			};
			if(Npc_GetPermAttitude(self,other) == ATT_ANGRY)
			{
				if(b_comparenpcinstance(self,theft_news_victim))
				{
					b_say(self,other,"$YOUSTOLEFROMME");
					Npc_DeleteNews(self,theft_news);
					return;
				}
				else if((theft_news_victim.guild == self.guild) && (Wld_GetGuildAttitude(self.guild,self.guild) == ATT_FRIENDLY))
				{
					b_say(self,other,"$YOUSTOLEFROMUS");
					Npc_DeleteNews(self,theft_news);
					return;
				};
			};
		};
		Npc_DeleteNews(self,theft_news);
	};
};

