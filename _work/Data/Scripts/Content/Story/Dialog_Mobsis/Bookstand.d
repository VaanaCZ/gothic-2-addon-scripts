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
			B_LogEntry (TOPIC_FireContest,"As a novice, I have a right to demand the Test of Fire. This entails each of the three magicians from the High Council setting me a test. If I pass these trials, I will be accepted into the Circle of Fire.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "The Test of Fire"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Though a novice may feel ready to submit to the Test of Magic, he may not necessarily be chosen. If, however, he has given his decision ample consideration and if he insists, he is accorded the right to demand the Test and no magician may deny it to him. But not only must he pass the Test of Magic, he must also find enlightenment through the fire. If he insists before the High Council, he shall be submitted to the TEST OF FIRE.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "The Test should challenge the wisdom, strength and dexterity of the novice. Therefore he must pass three trials, each of which is set before him by a magician of the High Council, before taking the Oath of the Fire to join the pact with the fire."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Such is the will of Innos and so it shall be done."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "The High Council"					);
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
						Doc_PrintLines	( nDocID,  0, "... I hope the dome may protect the ore from the menace of Beliar. The King is naive enough to believe that we built the dome as protection against breakouts. Well, as long as such ruses enable us to fulfill our higher goals, let it be so. I can only hope we have enough time left to prepare for the fight. As soon as the dome around the Valley of Mines has been erected, I will use all the power at my disposal to intervene in the impeding fight.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Holy Missile': 1 holy water, no spell scroll");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "... I followed the instructions and simply poured Innos' holy water over a blank runestone on a rune table. The runestone was destroyed. I suspect this spell really is accessible only to the One."); 
						Doc_PrintLines	( nDocID,  1, "I have left the holy aura of Innos in the protection of the monastery. The abbot will take care of it until the One reveals himself."	);
						Doc_PrintLines	( nDocID,  1, "The Tears of Innos may have a vital part to play in the fight ahead. But it's too dangerous to keep them where all can see. I'd better leave them here in the library."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"To create a rune I need certain ingredients for each one. Using those ingredients and a blank runestone I can create the desired rune at a rune table.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Secret teleport': 1 holy water");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "You have to create a teleportation rune to reach the secret place. For that you need a blank runestone and a small bottle of holy water. You can use the rune to teleport into the room."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "I am now reasonably certain that the Tears of Innos are what the paladins of old used in the long forgotten ritual Consecration of the Sword. That means I should be able to use the little bottle I found to give additional strength to a consecrated weapon."	);
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
			B_LogEntry (TOPIC_TalentSmith,"To forge a weapon, first of all I need a piece of raw steel. This I must heat in the fire of a smithy until it glows red-hot and then shape it on an anvil. Special weapons often require the use of certain substances that give them special characteristics.");
			B_LogEntry (TOPIC_TalentSmith,"If I add 4 units of ore and 5 of dragon blood, I can forge an ORE DRAGON SLAYER.");
			B_LogEntry (TOPIC_TalentSmith,"If I add 5 units of ore and 5 of dragon blood, I can forge a LARGE ORE DRAGON SLAYER.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "From: Weapons of the dragon lord."); 
						Doc_PrintLines	( nDocID,  1, "To make an armor of dragon scales as hard as possible, the scales may be coated with the ore mined in the valley on the isle of Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "To make a blade worthy of a dragon lord, the blade should be steeped in dragon blood. Even 5 phials of the blood can give the steel unequalled sharpness and strength."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Note: 'Karynis' probably refers to what is now known as Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

