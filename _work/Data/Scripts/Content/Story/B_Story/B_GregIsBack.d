FUNC VOID GregIsBack_S1 ()
{
	if (GregIsBack == FALSE)
	{
		Wld_InsertNpc (PIR_1320_Addon_Greg,"ADW_PIRATECAMP_GREG");	
		
		B_StartOtherRoutine (Bill,"GREGISBACK");
		B_StartOtherRoutine (Morgan,"GREGISBACK");
		B_StartOtherRoutine (AlligatorJack,"GREGISBACK");
		
		//------ Neue Razor im Canyon -----------
		Wld_InsertNpc 	(CanyonRazor07, 	"ADW_CANYON_MINE1_01");
		Wld_InsertNpc 	(CanyonRazor08, 	"ADW_CANYON_PATH_TO_LIBRARY_07A");
		Wld_InsertNpc 	(CanyonRazor09, 	"ADW_CANYON_PATH_TO_LIBRARY_36");
		Wld_InsertNpc 	(CanyonRazor10, 	"ADW_CANYON_PATH_TO_MINE2_04");
	};	
	GregIsBack = TRUE;
}; 
