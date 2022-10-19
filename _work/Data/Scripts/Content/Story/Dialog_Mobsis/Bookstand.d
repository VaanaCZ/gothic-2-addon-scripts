//##########################################################################
//##
//##	Hier stehen alle Buchst�ndermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchst�nder in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchst�nder in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //f�r die Pr�fung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"Jako�to novic m�m pr�vo na zkou�ku ohn�. To znamen�, �e mi ka�d� ze t�� m�g� z nejvy��� rady zad� n�jak� �kol. Pokud je spln�m, budu p�ijat do kruhu ohn�.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Zkou�ka ohn�"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "I kdy� novic m��e m�t pocit, �e je p�ipraven podstoupit zkou�ku ohn�, neznamen� to, �e bude vybr�n. Pokud ale na sv�m rozhodnut� st�le trv�, m� pr�vo zkou�ku po�adovat a ��dn� m�g mu v tom nesm� br�nit. Ale nejen�e mus� proj�t zkou�kou magie, mus� tak� doj�t osv�cen� skrze ohe�. P�ednese-li sv� rozhodnut� nejvy��� rad�, �ek� ho ZKOU�KA OHN�.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zkou�ka prov��� jak novicovu moudrost, tak i s�lu a obratnost. Proto se skl�d� celkem ze t�� ��st�, z nich� ka�dou mu zad� jeden m�g nejvy��� rady je�t� p�edt�m, ne� slo�� p��sahu ohn� a bude spjat s t�mto �ivlem."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Takov� je Innosova v�le a tak se i stane."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Nejvy��� rada"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchst�nder in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchst�nder in der geheimen Bibliothek 
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	
		var int nDocID;
		
		nDocID = 		Doc_Create		()			  ;							
						Doc_SetPages	( nDocID,  2 );                         
						Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0);
					
						Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
						Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  	
	
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLines	( nDocID,  0, "...Douf�m, �e kupole ochr�n� rudu p�ed zlobou Beliarovou. Kr�l ve sv� naivit� v���, �e jsme ji postavili proto, aby ��dn� z v�z�� neunikl. No, jestli tahle lest poslou�� vy���m c�l�m, a� se tak stane. Mohu jen doufat, �e n�m je�t� zb�v� dost �asu k p��prav� na boj. Jakmile kupole obklop� Hornick� �dol�, vynalo��m v�echnu svou moc, aby se boj u� v�ce nezdr�oval.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"K p��prav� runy 'svat� st�ely' je t�eba: 1 sv�cen� voda, ��dn� svitek s kouzlem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...postupoval jsem podle instrukc� a prost� jsem na �ist� runov� k�men na runov� tabulce nalil Innosovu sv�cenou vodu. Ta jej ale zcela zni�ila - po��t�m tedy, �e tohle kouzlo m��e pou��t pouze Vyvolen�."); 
						Doc_PrintLines	( nDocID,  1, "Kl�ter jsem sv��il pod ochranu svat� Innosovy aury. Opat se u� o n�j postar�, dokud se n�m nezjev� Vyvolen�."	);
						Doc_PrintLines	( nDocID,  1, "Mo�n� �e v nadch�zej�c�m boji sehraj� kl��ovou roli Innosovy slzy. Nemohu je ale dr�et na m�st�, kde je ka�d� uvid� - je to p��li� nebezpe�n�. Rad�i je nech�m tady v knihovn�."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"K v�rob� ka�d� runy pot�ebuji ur�it� ingredience. Kdy� je pak pou�iji na �ist� runov� k�men, mohu zvolenou runu vytvo�it podle runov� tabulky.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredience pro runu 'tajn� teleport': 1 sv�cen� voda");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pro ka�d� z tajn�ch m�st mus� pomoc� pr�zdn�ho runov�ho kamene a lahvi�ky sv�cen� vody vytvo�it teleporta�n� runu, kter� t� pak p�enese do zvolen� m�stnosti."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Te� u� jsem si skoro jist, �e pr�v� Innosovy slzy pou��vali za d�vn�ch �as� paladinov� p�i dnes ji� zapomenut�m ritu�lu sv�cen� me�e. Tak�e tahle mal� lahvi�ka, co jsem na�el, by m�la posv�cen� zbrani prop�j�it dal�� s�lu."	);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_Show		( nDocID );
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
			
			PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill 	(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry (TOPIC_TalentSmith,"K vykov�n� takov� zbran� pot�ebuji hlavn� kousek surov� oceli. Tu doruda roz�hav�m v kov��sk� v�hni a pak ji budu kout na kovadlin�. U ur�it�ch zbran� je tak� �asto zapot�eb� pou��t jist� substance, kter� jim prop�j�� jedine�n� vlastnosti.");
			B_LogEntry (TOPIC_TalentSmith,"P�id�m-li 4 kousky rudy a p�tkr�t dra�� krev, mohu vykovat DRAKOBIJCE.");
			B_LogEntry (TOPIC_TalentSmith,"Kdy� pou�iji 5 kousk� rudy a p�tkr�t dra�� krev, vykov�m VELK�HO DRAKOBIJCE.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Zdroj: Zbran� p�na drak�."); 
						Doc_PrintLines	( nDocID,  1, "Chce�-li zbroj z dra��ch �upin co mo�n� vytvrdit, mus� ji pot�hnout rudou, kter� se t�� v �dol� na ostrov� Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "M�-li b�t me� hoden p�na drak�, pak mus� jeho �epel omo�it v dra�� krvi. Pouh�ch 5 ampulek s touto vz�cnou tekutinou dod� oceli neb�valou ostrost a pr�raznost."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pozn�mka: 'Karynis' je pravd�podobn� m�sto dnes zn�m� jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

