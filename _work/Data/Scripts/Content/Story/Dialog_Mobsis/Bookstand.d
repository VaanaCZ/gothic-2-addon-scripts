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
			B_LogEntry (TOPIC_FireContest,"Como novicio, tengo el derecho de solicitar la prueba del fuego. Eso significa que cada uno de los tres magos del concilio supremo me pondr� una prueba. Si supero los desaf�os, se me aceptar� en el C�rculo de fuego.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "La prueba del fuego"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Aunque un novicio se sienta preparado para someterse a la prueba de la magia, no tiene por qu� ser escogido. Por otro lado, si tiene muy clara su decisi�n e insiste, tiene derecho a exigir la prueba y ning�n mago puede neg�rselo. Pero no podr� limitarse a pasar la prueba de la magia, tambi�n tendr� que alcanzar la iluminaci�n mediante el fuego. Si insiste ante el concilio supremo, tendr� que afrontar LA PRUEBA DEL FUEGO.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "La prueba deber�a servir para examinar la sabidur�a, fuerza y destreza del novicio. Por lo tanto, deber� superar tres pruebas, cada una de ellas pensada por un mago del concilio supremo, antes de poder realizar el juramento del fuego para unirse al pacto con el fuego."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "�sa es la voluntad de Innos y as� debe hacerse."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "El concilio supremo"					);
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
						Doc_PrintLines	( nDocID,  0, "... espero que el domo pueda proteger el mineral de la amenaza de Beliar. El Rey es suficientemente ingenuo como para creer que construimos el domo como protecci�n contra huidas. Bien, mientras esos ardides nos sirvan para completar metas m�s importantes, que as� sea. Solo espero que tengamos tiempo suficiente para preparar la lucha. En cuanto se haya erigido el domo sobre el Valle de las Minas, usar� todos los poderes de que dispongo para intervenir en la lucha.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingredientes para la runa ''proyectil m�gico'': 1 agua bendita, ning�n pergamino de conjuro.");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "... Segu� las instrucciones y solo pude llegar a verter agua bendita de Innos sobre una piedra r�nica virgen, sobre una mesa r�nica. La piedra r�nica fue destruida. Sospecho que este conjuro solo es posible para el Elegido."); 
						Doc_PrintLines	( nDocID,  1, "He dejado la sagrada aura de Innos bajo la protecci�n del monasterio. El abad se encargar� de ella hasta que el Elegido se de a conocer."	);
						Doc_PrintLines	( nDocID,  1, "Las L�grimas de Innos pueden ser una parte fundamental de la lucha que nos espera. Pero es demasiado peligroso dejarlas a la vista de todos. Lo mejor ser� que las dej� aqu�, en la biblioteca."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Para crear una runa necesito ingredientes, espec�ficos para cada una. Con esos ingredientes y una piedra r�nica virgen, podr� crear la runa deseada en una mesa r�nica.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredientes para la runa 'teletransporte secreto': 1 agua bendita");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Tienes que crear una runa de teletransporte para llegar hasta el lugar secreto. Para ello necesitas una piedra r�nica virgen y una peque�a botella de agua bendita. Se puede usar la runa para teletransportarse hasta la habitaci�n."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Estoy razonablemente convencido de que las L�grimas de Innos eran lo que los paladines de la antig�edad usaban en el olvidado ritual de consagraci�n de la espada. Eso significa que deber�a poder usar la botellita que encontr� para dar poder adicional a un arma consagrada."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Para forjar un arma primero hace falta acero en bruto. Se tiene que calentar en un fuego de herrero hasta que se ponga al rojo, molde�ndolo entonces en el yunque. En las armas especiales se suelen emplear ciertas substancias que les otorgan caracter�sticas especiales.");
			B_LogEntry (TOPIC_TalentSmith,"Si a�ado 4 unidades de mineral y 5 de sangre de drag�n, puedo forjar una EXTERMINADORA DE DRAGONES DE MINERAL.");
			B_LogEntry (TOPIC_TalentSmith,"Si a�ado 5 unidades de mineral y 5 de sangre de drag�n, puedo forjar una EXTERMINADORA DE DRAGONES GRANDE DE MINERAL.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "De: Armas del se�or de los dragones."); 
						Doc_PrintLines	( nDocID,  1, "Para realizar una armadura de escamas de drag�n, tan dura como sea posible, las escamas deben cubrirse con una fina capa de mineral del valle de la isla Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Para crear un arma digna de un se�or de los dragones, la hoja deber� impregnarse de sangre de drag�n. Incluso 5 ampollas de sangre pueden otorgar al acero una fuerza y un filo inigualables."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Nota: ''Karynis'' probablemente se refer�a a lo que conocemos como Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

