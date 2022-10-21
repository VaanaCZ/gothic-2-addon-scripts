// *******************************************
// ZS_MM_EatBody
// -------------
// geht davon aus, daﬂ ein Body gefunden wurde
// *******************************************

func void ZS_MM_EatBody()
{
	Npc_SetPercTime 	(self, 1);
	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,  		B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_AssessDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE,	B_MM_AssessOthersDamage); 
	Npc_PercEnable		(self, PERC_ASSESSMURDER, 		B_MM_AssessOthersDamage); 
	
	AI_GotoNpc 	(self, other);
	AI_TurnToNpc(self, other);
	AI_PlayAni	(self, "T_STAND_2_EAT");
	
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;	//kann nur von PERC_AssessDamage auf PRIO_Attack gesetzt werden
	self.aivar[AIV_LASTBODY] 	= Hlp_GetInstanceID (other);
	self.aivar[AIV_TAPOSITION]	= NOTINPOS;
};

func int ZS_MM_EatBody_loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		Npc_PercEnable 		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy); //damit kein Ping-Pong entsteht, wenn Spieler 6-7m entfernt von Beute
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	if !Hlp_IsValidNpc(other)	//Body weg
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_EatBody_end()
{
	AI_PlayAni (self, "T_EAT_2_STAND");
};
