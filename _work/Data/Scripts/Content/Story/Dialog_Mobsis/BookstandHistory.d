//##########################################################################
//##
//##	Bookstand History
//##
//##########################################################################

//----------------------
var int History_1_permanent;
//----------------------
//----------------------
var int History_2_permanent;
//----------------------
//----------------------
var int History_3_permanent;
//----------------------

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Der Weg des Kampfes"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "Angriff ist die beste Verteidigung, bei allem was nicht Mensch ist. Eine Parade gegen Tiere oder Monster auszuf�hren ist sinnlos."						);
					Doc_PrintLines	( nDocID,  0, "Da ist es besser den Gegner mit gezielten Seitenschl�gen auf Distanz zu halten um �berraschend eine Kombination aus mehreren Schl�gen durchzuf�hren."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Kombinationen mehrerer Schl�ge sind nat�rlich einem erfahrenen K�mpfer vorbehalten. Und wer sogar die Meisterschaft im Kampf erreicht, kann weitere Kombinationen ausf�hren."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_1_permanent = TRUE;
					};

	};
	
};

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Die Insel"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Die Hafenstadt Khorinis liegt auf einer Insel vor der K�ste des K�nigreiches Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "Die Insel ist vor allem durch das Minental bekannt geworden. Ein zweifelhafter Ruf, denn viele Jahre erstreckte sich eine magische Barriere �ber das gesamte Tal und alle Gefangenen des Reiches wurden dort hinein gebracht."						);
					Doc_PrintLines	( nDocID,  0, "So wurde das Tal zur Strafkolonie f�r viele Verurteilte, die tief unter der Erde nach dem magischen Erz sch�rften. "						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Au�erhalb von Khorinis gibt es noch einige Bauernh�fe, die den guten Boden nutzen, um Weizen und R�ben anzubauen, aber auch um Schafe zu z�chten."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Seit Generationen ist der gr��te Hof im Besitz eines Gro�bauern, der sein umliegendes Land an andere Bauern verpachtet. "						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Mitten auf der Insel steht ein altes Kloster. Ein Kloster Innos, das von den Magiern des Feuers gef�hrt wird. Dort gehen sie magischen und alchmistischen Forschungen nach und keltern Wein."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Das Gesetz der Insel"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "�berall dort, wo Menschen zusammenkommen, muss das gemeinsame Leben geregelt werden. Ob das im Kloster, in der Stadt oder auf dem Hof des Gro�bauers ist."						);
					Doc_PrintLines	( nDocID,  0, "So wird jedes Verbrechen wider der Gemeinschaft bestraft."						);
					Doc_PrintLines	( nDocID,  0, "Im Sinne der Gemeinschaft ist es nicht erlaubt Schl�gereien anzuzetteln oder sich in solche verwickeln zu lassen. "						);
					Doc_PrintLines	( nDocID,  0, "Ebenso ist Diebstahl ein Vergehen, das nicht ohne Folge bleibt. Und auch die Schafe stehen unter dem Schutz des Gesetzes.  "						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Wer gar einen anderen Menschen niederschl�gt und ermordet, mu� damit rechnen auf der Stelle gerichtet zu werden."						);
					Doc_PrintLines	( nDocID,  1, "Und wer dem entgehen kann, mu� eine hohen Strafe zahlen. "						);
					Doc_PrintLines	( nDocID,  1, "An allen gro�en Orten, f�hren M�nner das Amt des Rechts aus. Ihnen wird zugetragen welche Taten geschehen und sie fordern die Strafe ein, auf das der Frieden wiederhergestellt wird. "						); 
					Doc_PrintLines	( nDocID,  1, "Denn wer Opfer eines Vergehens wird oder solche bezeugen kann, wird nicht gut auf den T�ter zu sprechen sein."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Es gibt nat�rlich auch Volk das sich nicht um die Gesetze schert. Vor allem Banditen und S�ldner. "						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};

