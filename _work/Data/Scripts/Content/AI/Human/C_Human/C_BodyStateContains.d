// ********************************************************************
// C_BodyStateContains
// -------------------	
// Eine 'sichere' Abfrage auf Bodystates. Bitte NICHT die BuildIn
// 'Npc_GetBodyState' direkt benutzen, denn Vergleiche wie
//
// 		if (Npc_GetBodyState(self) == BS_SIT) 
//
// werden false ergeben, wenn zusätzlich zu BS_SIT auch noch
// BS_MOD_BURNING oder andere gesetzt sind (Charakter sitzt UND brennt)
// Abfragen auf Bodystates müssen also so aussehen:
//
// 		if (C_BodyStateContains(self,BS_SIT))
// ********************************************************************

func int C_BodyStateContains (var C_NPC slf, var int bodystate)
{
	//SN: Finger weg von dieser Formel!!! Ich weiß genau was ich tue!
	if ((Npc_GetBodyState(slf)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS)) == (bodystate&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS)))			// sowohl bei der Abfrage als auch beim Vergleichswert die höheren Bits ausmaskieren!
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

