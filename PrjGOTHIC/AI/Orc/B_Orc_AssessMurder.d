
func void b_orc_assessmurder()
{
	printdebugnpc(PD_ORC_FRAME,"B_Orc_AssesMurder");
	if((victim.guild > GIL_SEPERATOR_ORC) && Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssesMurder: Spieler hat Ork gekillt -> RAAAAAAAAAACHE!");
		AI_TurnToNPC(self,other);
		if(Hlp_Random(10) < 5)
		{
			AI_PlayAni(self,"T_ANGRY");
		};
		Npc_SetAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		return;
	}
	else if((victim.guild > GIL_SEPERATOR_ORC) || (victim.guild == GIL_ORCDOG))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssesMurder: ein Ork(Hund) ist tot -> RAAAAAAAAAACHE!");
		AI_TurnToNPC(self,other);
		if(Hlp_Random(10) < 5)
		{
			AI_PlayAni(self,"T_ANGRY");
		}
		else if(Hlp_Random(10) < 5)
		{
			b_say(self,other,"$NEVERTRYTHATAGAIN");
		};
		AI_StartState(self,zs_orc_attack,1,"");
	}
	else if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_AssesMurder: irgendwas ist tot -> cooool");
		b_say(self,NULL,"$CHEERFIGHT");
		AI_PlayAni(self,"T_HAPPY");
	};
};

