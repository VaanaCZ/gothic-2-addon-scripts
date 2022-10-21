FUNC VOID Use_BookstandDementor_S1()		//Alchemiebücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Dementor_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Dementor_R.tga",	0	);
					
					Doc_Show		( nDocID );

	};
};
