
// ***************************************************
//  	B_CaptainCallsAllOnBoard	(Alle Bedingungen fürs 6. Kapitel sind erfüllt. Nun gehts los!!!!!!!!!!)	
// ***************************************************

func void B_CaptainCallsAllOnBoard (var C_NPC Captain)
{	
	B_GiveInvItems (hero, Captain, ItWr_Seamap_Irdorath,1);
	CreateInvItems (Captain, ItKe_Ship_Levelchange_MIS, 1);									
	B_GiveInvItems (Captain, other, ItKe_Ship_Levelchange_MIS, 1);					
	B_StartOtherRoutine	(Captain,"AllOnBoard");

 	if (Lee_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Lee,				"Loë");};
	if (MiltenNW_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(MiltenNW,			"Loë");};
	if (Lester_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lester,			"Loë");};
	if (Gorn_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(GornNW_nach_DJG,	"Loë");};
	if (Mario_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Mario,				"Loë");};
	if (Wolf_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(SLD_Wolf,			"Loë");};
	if (Lares_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lares,				"Loë");};
	if (Bennet_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Bennet,			"Loë");};
	if (Diego_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(DiegoNW,			"Loë");};
	if (Biff_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Biff_NW,			"Loë");};
	if (Vatras_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Vatras,			"Loë");};
	if (Angar_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Angar_NW,			"Loë");};
	if (Girion_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Girion,			"Loë");};
	
 	MIS_ReadyforChapter6 = TRUE;
};
