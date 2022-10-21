//##########################################################################
//##
//##	Hier stehen alle Buchständermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchständer in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //für die Prüfung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"Como novicio, tengo el derecho de solicitar la prueba del fuego. Eso significa que cada uno de los tres magos del concilio supremo me pondrá una prueba. Si supero los desafíos, se me aceptará en el Círculo de fuego.");
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
				
					
					Doc_PrintLines	( nDocID,  0, "Aunque un novicio se sienta preparado para someterse a la prueba de la magia, no tiene por qué ser escogido. Por otro lado, si tiene muy clara su decisión e insiste, tiene derecho a exigir la prueba y ningún mago puede negárselo. Pero no podrá limitarse a pasar la prueba de la magia, también tendrá que alcanzar la iluminación mediante el fuego. Si insiste ante el concilio supremo, tendrá que afrontar LA PRUEBA DEL FUEGO.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "La prueba debería servir para examinar la sabiduría, fuerza y destreza del novicio. Por lo tanto, deberá superar tres pruebas, cada una de ellas pensada por un mago del concilio supremo, antes de poder realizar el juramento del fuego para unirse al pacto con el fuego."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Ésa es la voluntad de Innos y así debe hacerse."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "El concilio supremo"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchständer in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchständer in der geheimen Bibliothek 
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
						Doc_PrintLines	( nDocID,  0, "... espero que el domo pueda proteger el mineral de la amenaza de Beliar. El Rey es suficientemente ingenuo como para creer que construimos el domo como protección contra huidas. Bien, mientras esos ardides nos sirvan para completar metas más importantes, que así sea. Solo espero que tengamos tiempo suficiente para preparar la lucha. En cuanto se haya erigido el domo sobre el Valle de las Minas, usaré todos los poderes de que dispongo para intervenir en la lucha.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingredientes para la runa ''proyectil mágico'': 1 agua bendita, ningún pergamino de conjuro.");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "... Seguí las instrucciones y solo pude llegar a verter agua bendita de Innos sobre una piedra rúnica virgen, sobre una mesa rúnica. La piedra rúnica fue destruida. Sospecho que este conjuro solo es posible para el Elegido."); 
						Doc_PrintLines	( nDocID,  1, "He dejado la sagrada aura de Innos bajo la protección del monasterio. El abad se encargará de ella hasta que el Elegido se de a conocer."	);
						Doc_PrintLines	( nDocID,  1, "Las Lágrimas de Innos pueden ser una parte fundamental de la lucha que nos espera. Pero es demasiado peligroso dejarlas a la vista de todos. Lo mejor será que las dejé aquí, en la biblioteca."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Para crear una runa necesito ingredientes, específicos para cada una. Con esos ingredientes y una piedra rúnica virgen, podré crear la runa deseada en una mesa rúnica.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredientes para la runa 'teletransporte secreto': 1 agua bendita");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Tienes que crear una runa de teletransporte para llegar hasta el lugar secreto. Para ello necesitas una piedra rúnica virgen y una pequeña botella de agua bendita. Se puede usar la runa para teletransportarse hasta la habitación."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Estoy razonablemente convencido de que las Lágrimas de Innos eran lo que los paladines de la antigüedad usaban en el olvidado ritual de consagración de la espada. Eso significa que debería poder usar la botellita que encontré para dar poder adicional a un arma consagrada."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Para forjar un arma primero hace falta acero en bruto. Se tiene que calentar en un fuego de herrero hasta que se ponga al rojo, moldeándolo entonces en el yunque. En las armas especiales se suelen emplear ciertas substancias que les otorgan características especiales.");
			B_LogEntry (TOPIC_TalentSmith,"Si añado 4 unidades de mineral y 5 de sangre de dragón, puedo forjar una EXTERMINADORA DE DRAGONES DE MINERAL.");
			B_LogEntry (TOPIC_TalentSmith,"Si añado 5 unidades de mineral y 5 de sangre de dragón, puedo forjar una EXTERMINADORA DE DRAGONES GRANDE DE MINERAL.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "De: Armas del señor de los dragones."); 
						Doc_PrintLines	( nDocID,  1, "Para realizar una armadura de escamas de dragón, tan dura como sea posible, las escamas deben cubrirse con una fina capa de mineral del valle de la isla Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Para crear un arma digna de un señor de los dragones, la hoja deberá impregnarse de sangre de dragón. Incluso 5 ampollas de sangre pueden otorgar al acero una fuerza y un filo inigualables."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Nota: ''Karynis'' probablemente se refería a lo que conocemos como Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

