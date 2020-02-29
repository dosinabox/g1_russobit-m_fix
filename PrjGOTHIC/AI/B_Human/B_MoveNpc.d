
func void b_movenpc()
{
	printdebugnpc(PD_ZS_DETAIL,"B_MoveNpc");
	if(other.aivar[AIV_INVINCIBLE] == FALSE)
	{
		if(Npc_IsInCutscene(self) || Npc_IsInCutscene(other))
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender oder Blockierter in Cutscene!!!");
			return;
		};
		if(c_npcisdown(other))
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist kampfunfähig!");
			return;
		};
		if(c_npctypeisfriend(self,other))
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist Freund!");
			return;
		};
		if(other.aivar[AIV_INVINCIBLE])
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist in ZS_Talk!");
			return;
		};
		if(!c_bodystatecontains(other,BS_STAND))
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist in Bewegung!");
			return;
		};
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist feindlich!");
			b_assessenemy();
			return;
		}
		else if(!Npc_IsPlayer(other))
		{
			printdebugnpc(PD_ZS_DETAIL,"...Blockierender ist kein Spieler!");
			if((self.level > other.level) || ((self.level == other.level) && (self.id > other.id)))
			{
			}
			else
			{
			};
		}
		else if(c_npcisworker(self))
		{
			printdebugnpc(PD_ZS_DETAIL,"...ich bin unwichter NSC!");
			b_fullstop(self);
			b_smartturntonpc(self,other);
			AI_StartState(self,zs_movenpcfriendlywait,0,"");
			return;
		}
		else if(c_npcisguard(self) && c_npcisguardarcher(self))
		{
			return;
		}
		else if(((Npc_GetAttitude(self,other) == ATT_ANGRY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL)) && c_amistronger(self,other))
		{
			b_fullstop(self);
			b_smartturntonpc(self,other);
			b_say(self,other,"$OUTOFMYWAY");
			AI_StartState(self,zs_movenpcwait,0,"");
			return;
		}
		else
		{
			b_fullstop(self);
			b_smartturntonpc(self,other);
			b_say(self,other,"$MAKEWAY");
			AI_StartState(self,zs_movenpcfriendlywait,0,"");
			return;
		};
	};
};

