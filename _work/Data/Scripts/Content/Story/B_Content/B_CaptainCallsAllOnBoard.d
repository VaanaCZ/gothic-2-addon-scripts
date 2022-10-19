
// ***************************************************
//  	B_CaptainCallsAllOnBoard	(Alle Bedingungen fürs 6. Kapitel sind erfüllt. Nun gehts los!!!!!!!!!!)	
// ***************************************************

func void B_CaptainCallsAllOnBoard (var C_NPC Captain)
{	
	B_GiveInvItems (hero, Captain, ItWr_Seamap_Irdorath,1);
	CreateInvItems (Captain, ItKe_Ship_Levelchange_MIS, 1);									
	B_GiveInvItems (Captain, other, ItKe_Ship_Levelchange_MIS, 1);					
	B_StartOtherRoutine	(Captain,"AllOnBoard");

 	if (Lee_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Lee,				"Loï");};
	if (MiltenNW_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(MiltenNW,			"Loï");};
	if (Lester_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lester,			"Loï");};
	if (Gorn_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(GornNW_nach_DJG,	"Loï");};
	if (Mario_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Mario,				"Loï");};
	if (Wolf_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(SLD_Wolf,			"Loï");};
	if (Lares_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lares,				"Loï");};
	if (Bennet_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Bennet,			"Loï");};
	if (Diego_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(DiegoNW,			"Loï");};
	if (Biff_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Biff_NW,			"Loï");};
	if (Vatras_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Vatras,			"Loï");};
	if (Angar_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Angar_NW,			"Loï");};
	if (Girion_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Girion,			"Loï");};
	
 	MIS_ReadyforChapter6 = TRUE;
};
