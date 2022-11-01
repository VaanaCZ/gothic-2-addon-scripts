
// ***************************************************
//  	B_CaptainCallsAllOnBoard	(Alle Bedingungen fürs 6. Kapitel sind erfüllt. Nun gehts los!!!!!!!!!!)	
// ***************************************************

func void B_CaptainCallsAllOnBoard (var C_NPC Captain)
{	
	B_GiveInvItems (hero, Captain, ItWr_Seamap_Irdorath,1);
	CreateInvItems (Captain, ItKe_Ship_Levelchange_MIS, 1);									
	B_GiveInvItems (Captain, other, ItKe_Ship_Levelchange_MIS, 1);					
	B_StartOtherRoutine	(Captain,"AllOnBoard");

 	if (Lee_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Lee,				"Loď");};
	if (MiltenNW_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(MiltenNW,			"Loď");};
	if (Lester_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lester,			"Loď");};
	if (Gorn_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(GornNW_nach_DJG,	"Loď");};
	if (Mario_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Mario,				"Loď");};
	if (Wolf_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(SLD_Wolf,			"Loď");};
	if (Lares_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lares,				"Loď");};
	if (Bennet_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Bennet,			"Loď");};
	if (Diego_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(DiegoNW,			"Loď");};
	if (Biff_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Biff_NW,			"Loď");};
	if (Vatras_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Vatras,			"Loď");};
	if (Angar_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Angar_NW,			"Loď");};
	if (Girion_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Girion,			"Loď");};
	
 	MIS_ReadyforChapter6 = TRUE;
};
