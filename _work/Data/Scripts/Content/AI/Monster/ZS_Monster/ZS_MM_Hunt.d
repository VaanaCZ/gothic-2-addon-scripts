// ********************************************
// ZS_MM_Hunt
// ----------
// geht davon aus, daﬂ J‰ger Beute gefunden hat
// ********************************************

func void ZS_MM_Hunt ()
{
	Perception_Set_Monster_Rtn();

	AI_StandUp 		(self);
	AI_TurnToNpc	(self, other);
	AI_SetWalkmode 	(self, NPC_WALK);
	AI_GotoNpc 		(self, other);
};

func int ZS_MM_Hunt_Loop ()
{
	return LOOP_END;
};

func void ZS_MM_Hunt_End ()
{

};

