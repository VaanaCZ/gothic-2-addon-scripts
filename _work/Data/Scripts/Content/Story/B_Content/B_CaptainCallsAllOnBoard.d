
// ***************************************************
//  	B_CaptainCallsAllOnBoard	(Alle Bedingungen f�rs 6. Kapitel sind erf�llt. Nun gehts los!!!!!!!!!!)	
// ***************************************************

func void B_CaptainCallsAllOnBoard (var C_NPC Captain)
{	
	B_GiveInvItems (hero, Captain, ItWr_Seamap_Irdorath,1);
	CreateInvItems (Captain, ItKe_Ship_Levelchange_MIS, 1);									
	B_GiveInvItems (Captain, other, ItKe_Ship_Levelchange_MIS, 1);					
	B_StartOtherRoutine	(Captain,"AllOnBoard");

 	if (Lee_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Lee,				"Lo�");};
	if (MiltenNW_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(MiltenNW,			"Lo�");};
	if (Lester_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lester,			"Lo�");};
	if (Gorn_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(GornNW_nach_DJG,	"Lo�");};
	if (Mario_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Mario,				"Lo�");};
	if (Wolf_IsOnBoard		 	== LOG_SUCCESS){B_StartOtherRoutine	(SLD_Wolf,			"Lo�");};
	if (Lares_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Lares,				"Lo�");};
	if (Bennet_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Bennet,			"Lo�");};
	if (Diego_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(DiegoNW,			"Lo�");};
	if (Biff_IsOnBoard 			== LOG_SUCCESS){B_StartOtherRoutine	(Biff_NW,			"Lo�");};
	if (Vatras_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Vatras,			"Lo�");};
	if (Angar_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Angar_NW,			"Lo�");};
	if (Girion_IsOnBoard 		== LOG_SUCCESS){B_StartOtherRoutine	(Girion,			"Lo�");};
	
 	MIS_ReadyforChapter6 = TRUE;
};
