// ****************************************************************
// B_Say_Overlay
// -------------	
// Wie B_Say(), aber folgende AI-Befehle werden parallel ausgeführt
// d.h. sie warten nicht auf das Ende der OutputUnit
// ****************************************************************

func void B_Say_Overlay(var C_NPC slf, var C_Npc oth, var string text)
{
	AI_OutputSVM_Overlay	(slf, oth , text);
};
