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
			B_LogEntry (TOPIC_FireContest,"En tant que novice, j'ai le droit de réclamer l'Epreuve du feu. Les trois magiciens du Haut Conseil me feront chacun passer un test. Si je les réussis tous les trois, je serai accepté dans le Cercle de feu.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "L'Epreuve du feu"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Bien qu'un novice puisse se croire prêt à affronter l'Epreuve de magie, ce n'est pas pour autant qu'il sera choisi. Cependant, s'il a bien réfléchi et s'il insiste, il a le droit de demander l'Epreuve et aucun magicien ne peut la lui refuser. Non seulement il devra réussir l'Epreuve de magie, mais il devra de plus trouver l'illumination par le feu. S'il insiste auprès du Haut Conseil, il sera soumis à l'EPREUVE DU FEU.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L’Epreuve doit être un défi de sagesse, de force et de dextérité pour le novice. Avant de prononcer le Serment du feu, il doit donc venir à bout de trois tests, chacun présenté par un magicien du Haut Conseil."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Telle est la volonté d'Innos et ainsi en sera-t-il."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Le Haut Conseil"					);
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
						Doc_PrintLines	( nDocID,  0, "... j'espère que le dôme pourra protéger le minerai de la menace de Béliar. Le roi est assez naïf pour croire que nous l'avons construit pour prévenir toute évasion. Enfin, tant que de telles ruses nous permettent d'atteindre nos objectifs... J'espère seulement qu'il nous reste assez de temps pour nous préparer au combat. Dès que le Dôme de la Vallée des mines sera terminé, j'userai de tout mon pouvoir pour intervenir au cours du combat.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingrédient pour la rune 'Projectile saint' : 1 eau bénite, pas de parchemin.");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "… j'ai suivi les instructions et j'ai versé l'eau bénite d'Innos sur une pierre runique vierge sur une table runique. La pierre a été détruite. Je crois que ce sort n'est accessible qu'à l'Elu."); 
						Doc_PrintLines	( nDocID,  1, "J'ai laissé l'Aura sacrée d'Innos sous la protection du monastère. L'abbé en prendra soin jusqu'à ce que l'Elu se révèle."	);
						Doc_PrintLines	( nDocID,  1, "Les Larmes d'Innos peuvent jouer un rôle pour le combat qui nous attend. Il est dangereux de les laisser à la vue de tous. Je vais les cacher dans la bibliothèque."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Pour créer une rune, j'ai besoin de certains ingrédients pour chaque rune. Avec ces ingrédients et une pierre runique vierge, je peux créer la rune souhaitée sur une table runique.");
			B_LogEntry (TOPIC_TalentRunes,"Ingrédients de la rune 'Secret de la téléportation' : 1 fiole d'eau bénite.");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Vous devez créer une rune de téléportation pour atteindre la pièce. Il vous faut une pierre runique vierge et une fiole d'eau bénite. Vous pourrez utiliser la rune pour vous téléporter"); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Je suis certain que les Larmes d'Innos sont celles que les paladins utilisaient pour le rituel de Consécration de l'épée. Cela signifie que je devrais être capable d'utiliser la fiole que j'ai trouvée pour augmenter la puissance d'une arme consacrée."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Pour forger une arme, il me faut tout d'abord de l'acier brut que je dois chauffer à blanc dans une forge. Je dois ensuite le forger sur une enclume. Les armes spéciales requièrent souvent certaines substances qui leur confèrent des caractéristiques spéciales.");
			B_LogEntry (TOPIC_TalentSmith,"Si j'ajoute 4 unités de minerai et 5 de sang de dragon, je peux forger une TUEUSE DE DRAGON EN FER.");
			B_LogEntry (TOPIC_TalentSmith,"Si j'ajoute 5 unités de minerai et 5 de sang de dragon, je peux forger une GRANDE TUEUSE DE DRAGON EN FER.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Extrait : Armes du seigneur dragon."); 
						Doc_PrintLines	( nDocID,  1, "Pour une armure en écailles de dragon très résistante, les écailles doivent être recouvertes de minerai de l'île de Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pour une arme digne d'un seigneur, la lame doit être trempée dans du sang de dragon. 5 fioles de sang confèrent à l'acier un tranchant et une puissance inégalables."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Note : 'Karynis' fait référence à ce qui est maintenant Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

