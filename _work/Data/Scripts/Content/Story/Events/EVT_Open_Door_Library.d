
//****************************
// 	EVT_OPEN_DOOR_LIBRARY (Funktion, die bei öffnen der abgeschlossenen Tür zur geheimen Bibliothek ausgeführt wird. Kapitel 5)
//****************************
var int EVT_OPEN_DOOR_LIBRARY_S1_OneTime;
func void EVT_OPEN_DOOR_LIBRARY_S1 ()
{
	if(EVT_OPEN_DOOR_LIBRARY_S1_OneTime == FALSE)
	{
		Snd_Play ("DEM_Die");
		//Bibliothek
		//**********
		//Innerer Bereich
		Wld_InsertNpc 	(Skeleton, 		"FP_ROAM_NW_KDF_LIBRARY_19");//Joly:hier keine Demonen. Decke ist zu niedrig, Dämonen versinken im Boden!!!!!!!
		Wld_InsertNpc 	(Skeleton, 		"FP_ROAM_NW_KDF_LIBRARY_18");
		Wld_InsertNpc 	(Skeleton, 		"FP_ROAM_NW_KDF_LIBRARY_30");
		Wld_InsertNpc 	(Demon, 		"FP_ROAM_NW_KDF_LIBRARY_21");
		Wld_InsertNpc 	(Demon, 		"FP_ROAM_NW_KDF_LIBRARY_22");
		//Wld_InsertNpc 	(Demon, 		"FP_ROAM_NW_KDF_LIBRARY_23");
		Wld_InsertNpc 	(DemonLord, 	"FP_ROAM_NW_KDF_LIBRARY_20");
		EVT_OPEN_DOOR_LIBRARY_S1_OneTime = TRUE;
	};
};
